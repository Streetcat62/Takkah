import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';

class BottomNavigationBarButton extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  const BottomNavigationBarButton({
    Key? key,
    required this.iconData,
    required this.isSelected,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.r),
      color: isSelected ? AppColors.green : AppColors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: onTap,
        child: Container(
          height: 40.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                size: 20.r,
                color: isSelected ? AppColors.white : AppColors.gray,
              ),
              10.horizontalSpace,
              Text(
                label,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  letterSpacing: -0.5,
                  color: isSelected ? AppColors.white : AppColors.secondaryIconTextColor(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
