import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class CommonMaterialButton extends StatelessWidget {
  final int? height;
  final Color? color;
  final String? text;
  final int? horizontalPadding;
  final bool isLoading;
  final VoidCallback? onTap;
  final int? fontSize;
  final int? borderRadius;
  final Color? fontColor;
  final FontWeight? fontWeight;

  const CommonMaterialButton({
    Key? key,
    this.height,
    this.color,
    this.text,
    this.horizontalPadding,
    this.isLoading = false,
    this.onTap,
    this.fontSize,
    this.borderRadius,
    this.fontColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular((borderRadius ?? 45).r),
      color: color ?? AppColors.iconAndTextColor(),
      child: InkWell(
        borderRadius: BorderRadius.circular((borderRadius ?? 45).r),
        onTap: onTap,
        child: Container(
          height: (height ?? 40).r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((borderRadius ?? 45).r),
          ),
          padding: REdgeInsets.symmetric(
            horizontal: (horizontalPadding ?? 44).toDouble(),
          ),
          child: isLoading
              ? SizedBox(
                  height: (height ?? 40) / 2,
                  width: (height ?? 40) / 2,
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                    strokeWidth: 3.r,
                  ),
                )
              : Text(
                  text ?? AppHelpers.getTranslation(TrKeys.apply),
                  style: GoogleFonts.inter(
                    color: fontColor ?? AppColors.mainAppbarBack(),
                    fontSize: (fontSize ?? 14).sp,
                    letterSpacing: -0.4,
                    fontWeight: fontWeight ?? FontWeight.w400,
                  ),
                ),
        ),
      ),
    );
  }
}
