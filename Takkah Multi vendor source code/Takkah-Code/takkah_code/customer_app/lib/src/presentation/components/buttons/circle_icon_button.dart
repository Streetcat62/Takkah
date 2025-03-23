import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class CircleIconButton extends StatelessWidget {
  final int? width;
  final IconData iconData;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final int elevation;
  final int? badgeCount;
  final bool? isLoading;

  const CircleIconButton({
    Key? key,
    this.width,
    required this.onTap,
    required this.iconData,
    this.backgroundColor,
    this.iconColor,
    this.elevation = 0,
    this.badgeCount,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? AppColors.mainAppbarBack(),
      borderRadius: BorderRadius.circular(((width ?? 40) / 2).r),
      elevation: elevation.r,
      child: InkWell(
        borderRadius: BorderRadius.circular(((width ?? 40) / 2).r),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(((width ?? 40) / 2).r),
          ),
          alignment: Alignment.center,
          width: (width ?? 40).r,
          height: (width ?? 40).r,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              (isLoading ?? false)
                  ? Center(
                      child: SizedBox(
                        width: ((width ?? 40) / 3).r,
                        height: ((width ?? 40) / 3).r,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.r,
                          color: AppColors.green,
                        ),
                      ),
                    )
                  : badgeCount != null
                      ? Container(
                          width: (width ?? 40).r,
                          height: (width ?? 40).r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.green,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$badgeCount',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: AppColors.white,
                              letterSpacing: -0.4,
                            ),
                          ),
                        )
                      : Icon(
                          iconData,
                          size: ((width ?? 40) / 2).r,
                          color:
                              iconColor ?? AppColors.secondaryIconTextColor(),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
