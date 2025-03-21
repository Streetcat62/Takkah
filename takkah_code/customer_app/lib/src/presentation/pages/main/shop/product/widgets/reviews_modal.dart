import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';

class ReviewsModal extends StatelessWidget {
  final int? shopId;
  final ProductData? productData;

  const ReviewsModal({Key? key, this.productData, this.shopId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        productData?.discount != null && ((productData?.discount ?? 0) > 0);
    final discountPrice = hasDiscount
        ? ((productData?.price ?? 0) - (productData?.discount ?? 0))
        : 0;
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Row(
              children: [
                CommonImage(
                  imageUrl: productData?.product?.img,
                  width: 80,
                  height: 80,
                  radius: 15,
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productData?.product?.translation?.title ?? '',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: AppColors.iconAndTextColor(),
                          letterSpacing: -0.4,
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Text(
                            NumberFormat.currency(
                              symbol: LocalStorage.instance
                                  .getSelectedCurrency()
                                  ?.symbol,
                            ).format(hasDiscount
                                ? discountPrice
                                : productData?.price),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -0.2,
                            ),
                          ),
                          10.horizontalSpace,
                          if (hasDiscount)
                            Text(
                              NumberFormat.currency(
                                symbol: LocalStorage.instance
                                    .getSelectedCurrency()
                                    ?.symbol,
                              ).format(productData?.price),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: AppColors.red,
                                letterSpacing: -0.7,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            35.verticalSpace,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.secondaryBack(),
              ),
              padding: REdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              (productData?.ratingAvg ?? 0.0)
                                  .toStringAsFixed(1),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 30.sp,
                                color: AppColors.iconAndTextColor(),
                                letterSpacing: -0.7,
                              ),
                            ),
                            4.horizontalSpace,
                            Text(
                              '/5',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                                color: AppColors.iconAndTextColor(),
                                letterSpacing: -0.7,
                              ),
                            ),
                          ],
                        ),
                        7.verticalSpace,
                        Text(
                          '${AppHelpers.getTranslation(TrKeys.basedOn)} ${productData?.reviewsCount ?? 0} ${AppHelpers.getTranslation(TrKeys.reviews)}',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.secondaryIconTextColor(),
                            letterSpacing: -0.7,
                          ),
                        ),
                        33.verticalSpace,
                        RatingBar.builder(
                          itemBuilder: (context, index) {
                            return Icon(
                              FlutterRemix.star_smile_fill,
                              color: AppColors.warning,
                              size: 24.r,
                            );
                          },
                          maxRating: 5,
                          minRating: 0,
                          initialRating:
                              (productData?.ratingAvg ?? 0).toDouble(),
                          itemSize: 24.r,
                          itemPadding: EdgeInsetsDirectional.only(end: 12.r),
                          unratedColor: AppColors.unratedIcon(),
                          glow: false,
                          ignoreGestures: true,
                          onRatingUpdate: (double value) {},
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RatingPercentItem(
                          star: 5,
                          percent: AppHelpers.getPercent(
                              '5', productData?.ratingPercent),
                        ),
                        12.verticalSpace,
                        RatingPercentItem(
                          star: 4,
                          percent: AppHelpers.getPercent(
                              '4', productData?.ratingPercent),
                        ),
                        12.verticalSpace,
                        RatingPercentItem(
                          star: 3,
                          percent: AppHelpers.getPercent(
                              '3', productData?.ratingPercent),
                        ),
                        12.verticalSpace,
                        RatingPercentItem(
                          star: 2,
                          percent: AppHelpers.getPercent(
                              '2', productData?.ratingPercent),
                        ),
                        12.verticalSpace,
                        RatingPercentItem(
                          star: 1,
                          percent: AppHelpers.getPercent(
                              '1', productData?.ratingPercent),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            40.verticalSpace,
            Divider(
              thickness: 1.r,
              height: 1.r,
              color: AppColors.black.withOpacity(0.2),
            ),
            Material(
              color: AppColors.transparent,
              child: InkWell(
                onTap: () {
                  if (LocalStorage.instance.getToken().isEmpty) {
                    context.router.popUntilRoot();
                    context.replaceRoute(const LoginRoute());
                    AppHelpers.showCheckFlash(
                      context,
                      AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
                    );
                    return;
                  }
                  context.popRoute();
                  context.pushRoute(
                    AddReviewRoute(productData: productData, shopId: shopId),
                  );
                },
                child: Container(
                  height: 60.r,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FlutterRemix.chat_1_line,
                            size: 32.r,
                            color: AppColors.iconAndTextColor(),
                          ),
                          12.horizontalSpace,
                          Text(
                            AppHelpers.getTranslation(TrKeys.addReview),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -0.7,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        FlutterRemix.arrow_right_line,
                        size: 24.r,
                        color: AppColors.iconAndTextColor(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.r,
              height: 1.r,
              color: AppColors.black.withOpacity(0.2),
            ),
            40.verticalSpace,
            Text(
              AppHelpers.getTranslation(TrKeys.reviews),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                color: AppColors.iconAndTextColor(),
                letterSpacing: -1,
              ),
            ),
            20.verticalSpace,
            (productData?.reviews != null &&
                    (productData?.reviews?.isNotEmpty ?? false))
                ? Column(
                    children: productData!.reviews!
                        .map(
                          (review) => ReviewItemWidget(review: review),
                        )
                        .toList(),
                  )
                : Center(
                    child: Text(
                      AppHelpers.getTranslation(TrKeys.thereIsNoReviews),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColors.iconAndTextColor(),
                        letterSpacing: -0.4,
                      ),
                    ),
                  ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
