import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class ShopGroupItem extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final bool isSelected;

  const ShopGroupItem({
    Key? key,
    this.title,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.r),
      child: Material(
        borderRadius: BorderRadius.circular(100.r),
        color: isSelected ? AppColors.green : AppColors.onBoardingDot(),
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
                color:
                    isSelected ? AppColors.white : AppColors.iconAndTextColor(),
                letterSpacing: -0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
