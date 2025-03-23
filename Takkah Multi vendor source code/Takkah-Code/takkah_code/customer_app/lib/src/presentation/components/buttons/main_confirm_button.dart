import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import 'buttons_bouncing_effect.dart';

class MainConfirmButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final bool? isLoading;
  final Color? background;
  final int? fontSize;

  const MainConfirmButton({
    Key? key,
    required this.title,
    this.onTap,
    this.isLoading,
    this.background,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsBouncingEffect(
      child: Material(
        borderRadius: BorderRadius.circular(100.r),
        color: onTap != null
            ? (background ?? AppColors.green)
            : AppColors.unratedIcon(),
        child: InkWell(
          borderRadius: BorderRadius.circular(100.r),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
            ),
            height: 60.r,
            alignment: Alignment.center,
            child: (isLoading ?? false)
                ? SizedBox(
                    height: 20.r,
                    width: 20.r,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 3.r,
                    ),
                  )
                : Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: (fontSize ?? 18).sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
