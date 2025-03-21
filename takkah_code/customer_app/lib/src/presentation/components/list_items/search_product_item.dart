import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../small_dot.dart';
import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';

class SearchProductItem extends StatelessWidget {
  final ProductData product;
  final int? shopId;
  final VoidCallback onLikePressed;

  const SearchProductItem({
    Key? key,
    required this.product,
    required this.onLikePressed,
    this.shopId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(
        ProductRoute(product: product, shopId: shopId ?? product.shopId),
      ),
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.mainAppbarBack(),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r),
                  ),
                  child: CommonImage(
                    imageUrl: product.product?.img,
                    height: 126,
                    width: 170,
                    radius: 0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  right: 16.r,
                  top: 16.r,
                  child: GestureDetector(
                    onTap: onLikePressed,
                    child: Icon(
                      AppHelpers.isLikedProduct(product.id)
                          ? FlutterRemix.heart_fill
                          : FlutterRemix.heart_line,
                      size: 24.r,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 170.r,
              padding: REdgeInsets.symmetric(horizontal: 16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  8.verticalSpace,
                  Text(
                    '${product.product?.translation?.title}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                  6.verticalSpace,
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            FlutterRemix.star_smile_fill,
                            color: AppColors.warning,
                            size: 17.r,
                          ),
                          8.horizontalSpace,
                          Text(
                            '${product.ratingAvg ?? 0.0}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: AppColors.secondaryIconTextColor(),
                              letterSpacing: -0.4,
                            ),
                          ),
                        ],
                      ),
                      if (product.bonus != null)
                        Row(
                          children: [
                            8.horizontalSpace,
                            const SmallDot(),
                            8.horizontalSpace,
                            Icon(
                              FlutterRemix.gift_2_fill,
                              color: AppColors.red,
                              size: 17.r,
                            ),
                            8.horizontalSpace,
                            Text(
                              AppHelpers.getTranslation(TrKeys.bonus),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.red,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  if (product.discount != null && product.discount != 0)
                    Column(
                      children: [
                        8.verticalSpace,
                        Row(
                          children: [
                            Text(
                              NumberFormat.currency(
                                symbol: LocalStorage.instance
                                    .getSelectedCurrency()
                                    ?.symbol,
                              ).format(product.price),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.iconAndTextColor(),
                                letterSpacing: -0.4,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            8.horizontalSpace,
                            const SmallDot(),
                            8.horizontalSpace,
                            Text(
                              '${(((product.discount ?? 0) / (product.price ?? 1)) * 100).toStringAsFixed(1)}%',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: AppColors.red,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  8.verticalSpace,
                  Text(
                    NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency()?.symbol,
                    ).format(
                      (product.discount != null && product.discount != 0)
                          ? ((product.price ?? 0) - (product.discount ?? 0))
                          : product.price,
                    ),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: AppColors.iconAndTextColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                  12.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
