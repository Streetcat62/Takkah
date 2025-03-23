import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import 'riverpod/provider/brand_products_provider.dart';
import 'riverpod/provider/search_product_in_brand_provider.dart';

class BrandProductsPage extends ConsumerStatefulWidget {
  final BrandData brand;
  final int? shopId;

  const BrandProductsPage({Key? key, required this.brand, this.shopId})
      : super(key: key);

  @override
  ConsumerState<BrandProductsPage> createState() => _BrandProductsPageState();
}

class _BrandProductsPageState extends ConsumerState<BrandProductsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(brandProductsProvider.notifier).updateBrandProducts(
            context,
            brandId: widget.brand.brand?.id,
          );
      ref.watch(searchProductInBrandProvider.notifier).makeAllShop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: AppColors.mainBackground(),
        appBar: CommonAppBar(
          title: '${widget.brand.brand?.title}',
          onLeadingPressed: context.popRoute,
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(searchProductInBrandProvider);
            final notifier = ref.watch(searchProductInBrandProvider.notifier);
            return Column(
              children: [
                SearchTextField(
                  onChanged: (query) => notifier.setQuery(context, query),
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
                                  ref.watch(brandProductsProvider);
                              return productsState.isLoading
                                  ? const GridListShimmer()
                                  : GridView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: productsState.products.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 170 / 283,
                                        mainAxisSpacing: 8.r,
                                        crossAxisSpacing: 8.r,
                                        crossAxisCount: 2,
                                      ),
                                      itemBuilder: (context, index) =>
                                          GridProductItem(
                                        updateState: () {
                                          ref
                                              .read(brandProductsProvider
                                                  .notifier)
                                              .updateState();
                                        },
                                        shopId: widget.shopId,
                                        product: productsState.products[index],
                                        onLikePressed: () => ref
                                            .read(
                                                brandProductsProvider.notifier)
                                            .likeOrUnlikeProduct(
                                              productId: productsState
                                                  .products[index].id,
                                              shopId: widget.shopId,
                                            ),
                                        onIncrease: () {
                                          ref
                                              .read(brandProductsProvider
                                                  .notifier)
                                              .increaseProductCount(
                                                maxQty: productsState
                                                        .products[index]
                                                        .maxQty ??
                                                    0,
                                                productId: productsState
                                                    .products[index].id,
                                                shopId: widget.shopId,
                                              );
                                        },
                                        onDecrease: () {
                                          ref
                                              .read(brandProductsProvider
                                                  .notifier)
                                              .decreaseProductCount(
                                                productId: productsState
                                                    .products[index].id,
                                                shopId: widget.shopId,
                                              );
                                        },
                                      ),
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
