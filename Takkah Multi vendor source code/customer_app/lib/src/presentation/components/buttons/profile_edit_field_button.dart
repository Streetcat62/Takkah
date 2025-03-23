import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class ProfileEditFieldButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final String? hintText;
  final IconData? suffixIconData;

  const ProfileEditFieldButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.hintText,
    this.suffixIconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: AppColors.secondaryIconTextColor(),
              letterSpacing: -0.4,
            ),
          ),
          7.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hintText ?? '',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: AppColors.iconAndTextColor(),
                  letterSpacing: -0.4,
                ),
              ),
              Icon(
                suffixIconData,
                size: 24.r,
                color: AppColors.iconAndTextColor(),
              ),
            ],
          ),
          12.verticalSpace,
          Divider(
            thickness: 1.r,
            height: 1.r,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
