import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/constants/constants.dart';

class ProductReviewCountWidget extends StatelessWidget {
  final ProductData? productData;

  const ProductReviewCountWidget({Key? key, this.productData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.r,
      padding: REdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      color: AppColors.secondaryBack(),
      child: Row(
        children: [
          Icon(
            FlutterRemix.star_smile_fill,
            size: 18.r,
            color: AppColors.warning,
          ),
          8.horizontalSpace,
          Text(
            (productData?.ratingAvg ?? 0.0).toStringAsFixed(1),
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.iconAndTextColor(),
              letterSpacing: -0.35,
            ),
          ),
          15.horizontalSpace,
          Container(
            width: 22.r,
            height: 1.r,
            color: AppColors.gray.withOpacity(0.3),
          ),
          15.horizontalSpace,
          Icon(
            FlutterRemix.message_2_fill,
            size: 18.r,
            color: AppColors.green,
          ),
          9.horizontalSpace,
          Text(
            '${productData?.reviewsCount ?? 0} ${AppHelpers.getTranslation(TrKeys.reviews)}',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColors.iconAndTextColor(),
              letterSpacing: -0.35,
            ),
          ),
        ],
      ),
    );
  }
}
