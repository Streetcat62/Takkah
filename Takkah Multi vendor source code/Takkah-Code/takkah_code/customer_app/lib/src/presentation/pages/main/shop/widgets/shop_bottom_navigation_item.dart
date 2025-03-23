import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';

class ShopBottomNavigationItem extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  const ShopBottomNavigationItem({
    Key? key,
    required this.iconData,
    required this.isSelected,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isSelected) {
          return;
        }
        onTap();
      },
      child: Platform.isAndroid
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Icon(
                    iconData,
                    size: 24.r,
                    color: isSelected ? AppColors.green : AppColors.gray,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    label,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: isSelected ? AppColors.green : AppColors.gray,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 24.r,
                  color: isSelected ? AppColors.green : AppColors.gray,
                ),
                4.verticalSpace,
                Text(
                  label,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: isSelected ? AppColors.green : AppColors.gray,
                    letterSpacing: -0.5,
                  ),
                )
              ],
            ),
    );
  }
}
