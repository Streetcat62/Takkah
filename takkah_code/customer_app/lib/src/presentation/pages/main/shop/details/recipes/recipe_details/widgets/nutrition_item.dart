import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../theme/theme.dart';
import '../../../../../../../../models/models.dart';

class NutritionItem extends StatelessWidget {
  final Nutritions? nutritions;

  const NutritionItem({Key? key, this.nutritions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                '${nutritions?.translation?.title}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.secondaryIconTextColor(),
                  letterSpacing: -0.4,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                '${nutritions?.weight} g',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.secondaryIconTextColor(),
                  letterSpacing: -0.4,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                '${nutritions?.percentage} %',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.secondaryIconTextColor(),
                  letterSpacing: -0.4,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        16.verticalSpace,
        Divider(
          thickness: 1.r,
          height: 1.r,
          color: AppColors.iconAndTextColor().withOpacity(0.05),
        ),
      ],
    );
  }
}
