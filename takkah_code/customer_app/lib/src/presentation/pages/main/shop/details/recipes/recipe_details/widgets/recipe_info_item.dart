import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../theme/theme.dart';

class RecipeInfoItem extends StatelessWidget {
  final String title;
  final String value;

  const RecipeInfoItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: AppColors.secondaryIconTextColor(),
            letterSpacing: -0.4,
          ),
        ),
        4.verticalSpace,
        Text(
          value,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: AppColors.iconAndTextColor(),
            letterSpacing: -0.4,
          ),
        ),
      ],
    );
  }
}
