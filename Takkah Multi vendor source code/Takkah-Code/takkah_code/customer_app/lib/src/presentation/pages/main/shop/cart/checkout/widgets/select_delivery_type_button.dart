import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';

class SelectDeliveryTypeButton extends StatelessWidget {
  final bool isSelected;
  final IconData iconData;
  final String title;
  final VoidCallback? onTap;

  const SelectDeliveryTypeButton({
    Key? key,
    required this.isSelected,
    required this.iconData,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.r),
      color: isSelected ? AppColors.green : AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Container(
          height: 60.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: isSelected
                ? null
                : Border.all(
                    color: AppColors.secondaryIconTextColor(),
                    width: 1.5.r,
                  ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 24.r,
                color: isSelected
                    ? AppColors.white
                    : AppColors.secondaryIconTextColor(),
              ),
              8.horizontalSpace,
              Text(
                title,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  letterSpacing: -0.5,
                  color: isSelected
                      ? AppColors.white
                      : AppColors.secondaryIconTextColor(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
