import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final int height;
  final Color? borderColor;
  final Color? textColor;
  final VoidCallback onTap;

  const CustomOutlinedButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.height = 60,
    this.borderColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100.r),
      color: AppColors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100.r),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(
              color: borderColor ?? AppColors.iconAndTextColor(),
              width: 2.r,
            ),
          ),
          alignment: Alignment.center,
          height: height.r,
          child: isLoading
              ? SizedBox(
                  height: (height / 3).r,
                  width: (height / 3).r,
                  child: CircularProgressIndicator(
                    color: borderColor ?? AppColors.iconAndTextColor(),
                    strokeWidth: 3.r,
                  ),
                )
              : Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    color: textColor ?? AppColors.iconAndTextColor(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
