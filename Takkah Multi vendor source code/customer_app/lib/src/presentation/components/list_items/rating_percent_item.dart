import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class RatingPercentItem extends StatelessWidget {
  final int star;
  final num percent;

  const RatingPercentItem({Key? key, required this.star, required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$star ${AppHelpers.getTranslation(TrKeys.star)}',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            letterSpacing: -0.7,
            color: AppColors.secondaryIconTextColor(),
          ),
        ),
        8.horizontalSpace,
        SizedBox(
          width: 92.r,
          height: 6.r,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: LinearProgressIndicator(
              value: percent / 100,
              color: AppColors.warning,
              backgroundColor: AppColors.unratedIcon(),
            ),
          ),
        ),
      ],
    );
  }
}
