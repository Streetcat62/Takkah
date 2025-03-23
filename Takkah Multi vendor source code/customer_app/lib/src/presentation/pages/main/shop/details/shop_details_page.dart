import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/shop_app_bar.dart';
import '../../../../theme/theme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import 'riverpod/provider/shop_brands_provider.dart';
import '../../../../../core/constants/constants.dart';
import 'riverpod/provider/shop_banners_provider.dart';
import '../riverpod/provider/shop_cart_provider.dart';
import 'riverpod/provider/shop_details_provider.dart';
import '../../../../../core/routes/app_router.gr.dart';
import 'riverpod/provider/shop_categories_provider.dart';
import '../../../../../riverpod/provider/app_provider.dart';
import '../riverpod/provider/shop_main_bottom_provider.dart';
import 'riverpod/provider/shop_category_products_provider.dart';
import '../../pickup/riverpod/provider/saved_shops_in_pickup_provider.dart';
import '../../delivery/riverpod/provider/saved_shops_in_delivery_provider.dart';

class ShopDetailsPage extends ConsumerStatefulWidget {
  final int? shopId;
  final bool fromDelivery;

  const ShopDetailsPage({Key? key, this.shopId, required this.fromDelivery})
      : super(key: key);

  @override
  ConsumerState<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends ConsumerState<ShopDetailsPage>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(shopCategoryProductsProvider.notifier).fetchShopCategories(
                shopId: widget.shopId,
                cartData: ref.watch(shopCartProvider).cartData,
              );
        }
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          ref.read(shopMainBottomProvider.notifier).setVisible(false);
        }
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          ref.read(shopMainBottomProvider.notifier).setVisible(true);
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(shopDetailsProvider.notifier).fetchShopDetails(
              shopId: widget.shopId,
              checkYourNetwork: () {
                AppHelpers.showCheckFlash(
                  context,
                  AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
                );
              },
              updateSavedShops: (data) {
                if (widget.fromDelivery) {
                  ref
                      .read(savedShopsInDeliveryProvider.notifier)
                      .addSavedShop(data);
                } else {
                  ref
                      .read(savedShopsInPickupProvider.notifier)
                      .addSavedShop(data);
                }
              },
            );
        ref
            .read(shopBannersProvider.notifier)
            .fetchShopBanners(shopId: widget.shopId);
        ref
            .read(shopCategoriesProvider.notifier)
            .fetchShopCategories(shopId: widget.shopId);
        ref
            .read(shopBrandsProvider.notifier)
            .fetchBrands(shopId: widget.shopId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shopDetailsProvider);
    ref.watch(appProvider);
    return state.isLoading
        ? const MainProgressIndicator()
        : NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) {
              return [
                SliverAppBar(
                  expandedHeight: 300.r,
                  leadingWidth: 0,
                  pinned: true,
                  snap: false,
                  floating: false,
                  leading: const SizedBox.shrink(),
                  backgroundColor: AppColors.mainAppbarBack(),
                  elevation: 0,
                  collapsedHeight: 90.r,
                  flexibleSpace: ShopAppBar(shop: state.shopData),
                ),
              ];
            },
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  18.verticalSpace,
                  Consumer(
                    builder: (context, ref, child) {
                      final shopBannersState = ref.watch(shopBannersProvider);
                      return shopBannersState.isLoading
                          ? HorizontalListShimmer(
                              horizontalPadding: 16,
                              height: 180,
                              itemWidth: 1.sw - 32,
                              spacing: 8,
                              itemBorderRadius: 16,
                            )
                          : shopBannersState.banners.isEmpty
                              ? const SizedBox.shrink()
                              : SizedBox(
                                  height: 180.r,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    padding:
                                        REdgeInsets.symmetric(horizontal: 16),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: shopBannersState.banners.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        ShopBannerItem(
                                      banner: shopBannersState.banners[index],
                                      shopId: widget.shopId,
                                    ),
                                  ),
                                );
                    },
                  ),
                  32.verticalSpace,
                  Consumer(
                    builder: (context, ref, child) {
                      final categoriesState = ref.watch(shopCategoriesProvider);
                      return SizedBox(
                        height: 34.r,
                        child: categoriesState.isLoading
                            ? const HorizontalListShimmer(
                                horizontalPadding: 16,
                                itemBorderRadius: 100,
                                itemWidth: 100,
                                spacing: 8,
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                itemCount: categoriesState.categories.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ShopCategoryItem(
                                    title: categoriesState
                                        .categories[index].translation?.title,
                                    onTap: () => context.pushRoute(
                                      CategoryDetailsRoute(
                                        category:
                                            categoriesState.categories[index],
                                        shopId: widget.shopId,
                                      ),
                                    ),
                                  );
                                },
                              ),
                      );
                    },
                  ),
                  32.verticalSpace,
                  Consumer(
                    builder: (context, ref, child) {
                      final shopCategoriesState =
                          ref.watch(shopCategoryProductsProvider);
                      final shopCategoriesNotifier =
                          ref.read(shopCategoryProductsProvider.notifier);
                      return shopCategoriesState.isLoading
                          ? const ShopCategoriesShimmer()
                          : ListView.builder(
                              itemCount: shopCategoriesState
                                      .shopCategoryProducts.length +
                                  ((shopCategoriesState.hasMore &&
                                          shopCategoriesState.isMoreLoading)
                                      ? 1
                                      : 0),
                              shrinkWrap: true,
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return (shopCategoriesState
                                                .shopCategoryProducts.length ==
                                            index &&
                                        shopCategoriesState.hasMore &&
                                        shopCategoriesState.isMoreLoading)
                                    ? const ShopCategoriesShimmer()
                                    : ShopCategoryProductsItem(
                                        shopId: widget.shopId,
                                        shopCategoryData: shopCategoriesState
                                            .shopCategoryProducts[index],
                                        onLikeProduct: (productId) =>
                                            shopCategoriesNotifier
                                                .likeOrUnlikeProduct(
                                          productId: productId,
                                          shopId: widget.shopId,
                                        ),
                                        onIncrease: (productId) =>
                                            shopCategoriesNotifier
                                                .increaseProductCount(productId,
                                                    widget.shopId ?? 0),
                                        onDecrease: (productId) =>
                                            shopCategoriesNotifier
                                                .decreaseProductCount(productId,
                                                    widget.shopId ?? 0),
                                      );
                              },
                            );
                    },
                  ),
                  32.verticalSpace,
                  Consumer(
                    builder: (context, ref, child) {
                      final brandsState = ref.watch(shopBrandsProvider);
                      return brandsState.isLoading
                          ? const CircleBrandsShimmer()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      REdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppHelpers.getTranslation(
                                            TrKeys.brands),
                                        style: GoogleFonts.inter(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -1,
                                          color: AppColors.iconAndTextColor(),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => context.pushRoute(
                                            BrandsRoute(shopId: widget.shopId)),
                                        child: Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.viewMore),
                                          style: GoogleFonts.inter(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.5,
                                            color: AppColors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                18.verticalSpace,
                                brandsState.brands.isNotEmpty
                                    ? SizedBox(
                                        height: 120.r,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: brandsState.brands.length,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          padding: REdgeInsets.symmetric(
                                              horizontal: 16),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      end: 4.r),
                                              child: GestureDetector(
                                                onTap: () async {

                                                  await context.pushRoute(
                                                    BrandProductsRoute(
                                                      brand: brandsState
                                                          .brands[index],
                                                      shopId: widget.shopId,
                                                    ),
                                                  );
                                                  ref.read(shopCategoryProductsProvider.notifier).updateState();
                                                },
                                                child: CommonImage(
                                                  imageUrl: brandsState
                                                      .brands[index].brand?.img,
                                                  width: 120,
                                                  height: 120,
                                                  radius: 60,
                                                  errorBackground: AppColors
                                                      .mainAppbarBack(),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : Center(
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 168.r,
                                              height: 168.r,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                color:
                                                    AppColors.secondaryBack(),
                                              ),
                                              margin: REdgeInsets.only(top: 20),
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                AppAssets.pngNoSearchResult,
                                                width: 79.r,
                                                height: 144.r,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            14.verticalSpace,
                                            Text(
                                              AppHelpers.getTranslation(
                                                  TrKeys.noBrandsForThisShop),
                                              style: GoogleFonts.inter(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -14 * 0.02,
                                                color: AppColors
                                                    .iconAndTextColor(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            );
                    },
                  ),
                  42.verticalSpace,
                ],
              ),
            ),
          );
  }
}
