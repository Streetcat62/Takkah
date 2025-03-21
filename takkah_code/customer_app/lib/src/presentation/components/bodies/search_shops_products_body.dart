import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class SearchShopsProductsBody extends StatelessWidget {
  final bool isShopsLoading;
  final List<ShopData> shops;
  final bool fromDelivery;
  final bool isProductsLoading;
  final List<ProductData> products;
  final Function(int?, int?) onLikeTap;

  const SearchShopsProductsBody({
    Key? key,
    required this.isShopsLoading,
    required this.shops,
    required this.fromDelivery,
    required this.isProductsLoading,
    required this.products,
    required this.onLikeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          isShopsLoading
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppHelpers.getTranslation(TrKeys.shops),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,
                    const HorizontalListShimmer(horizontalPadding: 16),
                  ],
                )
              : shops.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.verticalSpace,
                        Padding(
                          padding: REdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppHelpers.getTranslation(TrKeys.shops),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: AppColors.iconAndTextColor(),
                                  letterSpacing: -1,
                                ),
                              ),
                              Text(
                                '${AppHelpers.getTranslation(TrKeys.found)} ${shops.length} ${AppHelpers.getTranslation(TrKeys.results).toLowerCase()}',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: AppColors.iconAndTextColor(),
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        16.verticalSpace,
                        SizedBox(
                          height: 256.r,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: REdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: shops.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => HorizontalShopItem(
                              shop: shops[index],
                              fromDelivery: fromDelivery,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Align(
                      alignment: Alignment.topCenter,
                      child: Lottie.asset(
                        AppAssets.lottieSearchEmpty,
                        width: 200.r,
                        height: 168.r,
                      ),
                    ),
          40.verticalSpace,
          isProductsLoading
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppHelpers.getTranslation(TrKeys.products),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.verticalSpace,
                    const HorizontalListShimmer(horizontalPadding: 16),
                  ],
                )
              : products.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.verticalSpace,
                        Padding(
                          padding: REdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppHelpers.getTranslation(TrKeys.products),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                  color: AppColors.iconAndTextColor(),
                                  letterSpacing: -1,
                                ),
                              ),
                              Text(
                                '${AppHelpers.getTranslation(TrKeys.found)} ${products.length} ${AppHelpers.getTranslation(TrKeys.results).toLowerCase()}',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: AppColors.iconAndTextColor(),
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        16.verticalSpace,
                        SizedBox(
                          height: 250.r,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: REdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => SearchProductItem(
                              product: products[index],
                              onLikePressed: () => onLikeTap(
                                products[index].shopId,
                                products[index].id,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Align(
                      alignment: Alignment.topCenter,
                      child: Lottie.asset(
                        AppAssets.lottieSearchEmpty,
                        width: 200.r,
                        height: 168.r,
                      ),
                    ),
          40.verticalSpace,
        ],
      ),
    );
  }
}
