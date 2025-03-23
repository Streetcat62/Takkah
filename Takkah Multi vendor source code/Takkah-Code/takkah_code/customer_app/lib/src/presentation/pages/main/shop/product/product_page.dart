import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/reviews_widget.dart';
import '../../../../theme/theme.dart';
import '../../../../../models/models.dart';
import 'widgets/product_images_widget.dart';
import 'widgets/related_products_widget.dart';
import '../../../../../core/utils/utils.dart';
import 'widgets/product_core_info_widget.dart';
import '../../../../components/components.dart';
import 'riverpod/provider/product_provider.dart';
import 'widgets/product_title_price_widget.dart';
import 'widgets/product_review_count_widget.dart';
import '../../../../../core/constants/constants.dart';
import '../riverpod/provider/shop_cart_provider.dart';
import '../../../../../core/routes/app_router.gr.dart';
import 'riverpod/provider/related_products_provider.dart';

class ProductPage extends ConsumerStatefulWidget {
  final int? shopId;
  final ProductData? product;

  const ProductPage({Key? key, this.product, this.shopId}) : super(key: key);

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (LocalStorage.instance.getUser() != null) {
          ref.read(productProvider.notifier).fetchProductDetails(
                shopId: widget.shopId,
                uuid: widget.product?.uuid,
                cartData: ref.watch(shopCartProvider).cartData,
                checkYourNetwork: () {
                  AppHelpers.showCheckFlash(
                    context,
                    AppHelpers.getTranslation(
                        TrKeys.checkYourNetworkConnection),
                  );
                  context.popRoute();
                },
                fetchingFailed: () {
                  context.popRoute();
                  AppHelpers.showCheckFlash(
                    context,
                    AppHelpers.getTranslation(
                        TrKeys.somethingWentWrongWithTheServer),
                  );
                },
              );
          ref.read(relatedProductsProvider.notifier).fetchRelatedProducts(
                cartData: ref.watch(shopCartProvider).cartData,
                shopId: widget.product?.shopId,
                productId: widget.product?.id,
                categoryId: widget.product?.product?.categoryId,
                brandId: widget.product?.product?.brandId,
              );
        } else {
          ref.read(productProvider.notifier).fetchProductDetails(
                shopId: widget.shopId,
                uuid: widget.product?.uuid,
                checkYourNetwork: () {
                  AppHelpers.showCheckFlash(
                    context,
                    AppHelpers.getTranslation(
                        TrKeys.checkYourNetworkConnection),
                  );
                  context.popRoute();
                },
              );
          ref.read(relatedProductsProvider.notifier).fetchRelatedProducts(
                cartData: ref.watch(shopCartProvider).cartData,
                shopId: widget.product?.shopId,
                productId: widget.product?.id,
                categoryId: widget.product?.product?.categoryId,
                brandId: widget.product?.product?.brandId,
              );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(productProvider.notifier);
    final state = ref.watch(productProvider);
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      extendBody: true,
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.details),
        onLeadingPressed: context.popRoute,
        actions: [
          CircleIconButton(
            onTap: () async {
              if (LocalStorage.instance.getToken().isEmpty) {
                context.router.popUntilRoot();
                context.replaceRoute(const LoginRoute());
                AppHelpers.showCheckFlash(
                  context,
                  AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
                );
                return;
              }
              await context.pushRoute(CartRoute(shopId: widget.shopId));
              notifier.updateState();
            },
            iconData: FlutterRemix.shopping_bag_3_line,
            iconColor: AppColors.iconAndTextColor(),
          ),
          CircleIconButton(
            onTap: () => notifier.likeOrUnlikeProduct(
              productId: widget.product?.id,
              shopId: widget.shopId,
            ),
            iconData: AppHelpers.isLikedProduct(widget.product?.id)
                ? FlutterRemix.heart_fill
                : FlutterRemix.heart_line,
            iconColor: AppHelpers.isLikedProduct(widget.product?.id)
                ? AppColors.red
                : AppColors.iconAndTextColor(),
          ),
        ],
      ),
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.green,
                strokeWidth: 3.r,
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.mainAppbarBack().withOpacity(0.8),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mainAppbarShadow(),
                          spreadRadius: 0.r,
                          blurRadius: 2.r,
                          offset: Offset(0.r, 2.r),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        7.verticalSpace,
                        if (state.productData?.product?.galleries != null &&
                            (state.productData?.product?.galleries
                                    ?.isNotEmpty ??
                                false))
                          ProductImagesWidget(productData: state.productData),
                        40.verticalSpace,
                        ProductTitlePriceWidget(productData: state.productData),
                        24.verticalSpace,
                      ],
                    ),
                  ),
                  ProductReviewCountWidget(productData: state.productData),
                  20.verticalSpace,
                  ProductCoreInfoWidget(productData: state.productData),
                  55.verticalSpace,
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppHelpers.getTranslation(TrKeys.reviews),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                            color: AppColors.iconAndTextColor(),
                            letterSpacing: -1,
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(100.r),
                          color: AppColors.green,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100.r),
                            onTap: () => context.pushRoute(
                              AddReviewRoute(
                                productData: state.productData,
                                shopId: widget.shopId,
                              ),
                            ),
                            child: Container(
                              height: 30.r,
                              padding: REdgeInsets.symmetric(horizontal: 14),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Icon(
                                    FlutterRemix.message_2_fill,
                                    size: 16.r,
                                    color: AppColors.white,
                                  ),
                                  6.horizontalSpace,
                                  Text(
                                    AppHelpers.getTranslation(
                                        TrKeys.addComment),
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: AppColors.white,
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  ReviewsWidget(productData: state.productData),
                  20.verticalSpace,
                  RelatedProductsWidget(shopId: widget.shopId),
                  120.verticalSpace,
                ],
              ),
            ),
      bottomNavigationBar: state.isLoading
          ? const SizedBox.shrink()
          : Padding(
              padding: REdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: ((widget.product?.quantity ?? 0) >= (widget.product?.minQty ?? 0))
                  ? ProductCartCountButton(
                      title: AppHelpers.getTranslation(TrKeys.addToCart),
                      unit: state.productData?.product?.unit,
                      productId: state.productData?.id,
                      onTap: () {
                        if (LocalStorage.instance.getToken().isEmpty) {
                          context.router.popUntilRoot();
                          context.replaceRoute(const LoginRoute());
                          AppHelpers.showCheckFlash(
                            context,
                            AppHelpers.getTranslation(
                                TrKeys.youNeedToLoginFirst),
                          );
                          return;
                        }
                        notifier.increaseCartCount(
                            widget.product?.id ?? 0, widget.product?.maxQty ?? 0
                        );
                      },
                      onIncrease: () => notifier.increaseCartCount(
                          widget.product?.id ?? 0 ,  widget.product?.maxQty ?? 0
                      ),
                      onDecrease: () => notifier.decreaseCartCount(
                          widget.product?.id ?? 0
                      ),
                    )
                  : MainConfirmButton(
                      title: AppHelpers.getTranslation(TrKeys.outOfStock),
                    ),
            ),
    );
  }
}
