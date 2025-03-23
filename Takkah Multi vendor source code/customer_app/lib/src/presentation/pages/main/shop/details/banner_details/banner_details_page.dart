import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';
import 'riverpod/provider/banner_products_provider.dart';
import 'riverpod/provider/search_product_in_banner_provider.dart';

class BannerDetailsPage extends ConsumerStatefulWidget {
  final int? shopId;
  final BannerData banner;

  const BannerDetailsPage({Key? key, required this.banner, this.shopId})
      : super(key: key);

  @override
  ConsumerState<BannerDetailsPage> createState() => _BannerDetailsPageState();
}

class _BannerDetailsPageState extends ConsumerState<BannerDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(bannerProductsProvider.notifier).fetchBannerProducts(
              bannerId: widget.banner.id,
              checkYourNetwork: () {
                AppHelpers.showCheckFlash(
                  context,
                  AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
                );
              },
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
          title: '${widget.banner.translation?.title}',
          onLeadingPressed: context.popRoute,
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(searchProductInBannerProvider);
            final notifier = ref.watch(searchProductInBannerProvider.notifier);
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
                          shopId: widget.shopId,
                          onIncrease: (data) {notifier.increaseProductCount(product: data);},
                          onDecrease: (index) => notifier.decreaseProductCount(product: index),
                        )
                      : Padding(
                          padding: REdgeInsets.symmetric(horizontal: 16.0),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                20.verticalSpace,
                                Hero(
                                  tag:
                                      '${AppConstants.tagHeroBannerImage}${widget.banner.id}',
                                  child: CommonImage(
                                    imageUrl: widget.banner.img,
                                    height: 180,
                                    width: double.infinity,
                                  ),
                                ),
                                20.verticalSpace,
                                Text(
                                  '${widget.banner.translation?.description}',
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    color: AppColors.secondaryIconTextColor(),
                                    letterSpacing: -0.4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                30.verticalSpace,
                                Consumer(
                                  builder: (context, ref, child) {
                                    final productsState =
                                        ref.watch(bannerProductsProvider);
                                    return productsState.isLoading
                                        ? const GridListShimmer()
                                        : GridView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount: productsState
                                                .bannerProducts.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 170 / 283,
                                              mainAxisSpacing: 8.r,
                                              crossAxisSpacing: 8.r,
                                              crossAxisCount: 2,
                                            ),
                                            itemBuilder: (context, index) {
                                              return GridProductItem(
                                                updateState: () {
                                                  ref.read(bannerProductsProvider.notifier).updateState();
                                                },
                                                shopId: widget.shopId,
                                                product: productsState
                                                    .bannerProducts[index],
                                                onLikePressed: () => ref
                                                    .read(bannerProductsProvider
                                                        .notifier)
                                                    .likeOrUnlikeProduct(
                                                      productId: productsState
                                                          .bannerProducts[index]
                                                          .id,
                                                      shopId: widget.shopId,
                                                    ),
                                                onIncrease: () {
                                                  ref.read(bannerProductsProvider.notifier).increaseCartCount(
                                                      productsState.bannerProducts[index].id ?? 0,
                                                      widget.shopId ?? 0
                                                  );
                                                },
                                                onDecrease: () {
                                                  ref.read(bannerProductsProvider.notifier).decreaseProductCount(
                                                      productsState.bannerProducts[index].id ?? 0,
                                                      widget.shopId ?? 0
                                                  );
                                                },
                                              );
                                            },
                                          );
                                  },
                                ),
                                42.verticalSpace,
                              ],
                            ),
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
