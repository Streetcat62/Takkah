import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../riverpod/provider/shop_cart_provider.dart';
import 'riverpod/provider/category_details_provider.dart';
import 'riverpod/provider/search_product_in_category_details_provider.dart';

class CategoryDetailsPage extends ConsumerStatefulWidget {
  final CategoryData category;
  final int? shopId;

  const CategoryDetailsPage({Key? key, required this.category, this.shopId})
      : super(key: key);

  @override
  ConsumerState<CategoryDetailsPage> createState() =>
      _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends ConsumerState<CategoryDetailsPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(categoryDetailsProvider.notifier).fetchCategoryProducts(
                shopId: widget.shopId,
                categoryId: widget.category.id,
                cartData: ref.watch(shopCartProvider).cartData,
              );
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(categoryDetailsProvider.notifier).updateCategoryProducts(
              categoryId: widget.category.id,
              shopId: widget.shopId,
              cartData: ref.watch(shopCartProvider).cartData,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: AppColors.mainBackground(),
        appBar: CommonAppBar(
          title: '${widget.category.translation?.title}',
          onLeadingPressed: context.popRoute,
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(searchProductInCategoryDetailsProvider);
            final notifier =
                ref.read(searchProductInCategoryDetailsProvider.notifier);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextField(
                  onChanged: (value) => notifier.setQuery(
                    value,
                    shopId: widget.shopId,
                    cartData: ref.watch(shopCartProvider).cartData,
                  ),
                ),
                Expanded(
                  child: state.isSearching
                      ? SearchProductsBody(
                          isSearchLoading: state.isSearchLoading,
                          searchedProducts: state.searchedProducts,
                          onLikeProduct: (productId) =>
                              notifier.likeOrUnlikeProduct(
                            productId: productId,
                            shopId: widget.shopId,
                          ),
                          onIncrease: (data) {
                            notifier.increaseProductCount(
                              product: data,
                            );
                          },
                          onDecrease: (data) {
                            notifier.decreaseProductCount(
                              product: data,
                            );
                          },
                        )
                      : Padding(
                          padding: REdgeInsets.symmetric(horizontal: 16.0),
                          child: Consumer(
                            builder: (context, ref, child) {
                              final productsState =
                                  ref.watch(categoryDetailsProvider);
                              final productsNotifier =
                                  ref.read(categoryDetailsProvider.notifier);
                              return GridProductsBody(
                                updateState: productsNotifier.updateState,
                                isLoading: productsState.isLoading,
                                products: productsState.products,
                                scrollController: _scrollController,
                                shopId: widget.shopId,
                                bottomPadding: 24,
                                increase: (data) {
                                  productsNotifier.increaseProductCount(
                                    product: data,
                                  );
                                },
                                decrease: (data) {
                                  productsNotifier.decreaseProductCount(
                                    product: data,
                                  );
                                },
                                onLiked: (productId) {
                                  productsNotifier.likeOrUnlikeProduct(
                                    productId: productId,
                                    shopId: widget.shopId,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
