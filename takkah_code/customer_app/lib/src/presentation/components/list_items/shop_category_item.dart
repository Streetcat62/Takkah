import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class ShopCategoryItem extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;

  const ShopCategoryItem({Key? key, this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.r),
      child: Material(
        borderRadius: BorderRadius.circular(100.r),
        color: AppColors.onBoardingDot(),
        child: InkWell(
          borderRadius: BorderRadius.circular(100.r),
          onTap: onTap,
          child: Container(
            height: 34.r,
            alignment: Alignment.center,
            padding: REdgeInsets.symmetric(horizontal: 19),
            child: Text(
              '$title',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.iconAndTextColor(),
                letterSpacing: -0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
