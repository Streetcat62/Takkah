import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final VoidCallback onClick;
  final String? title;
  final IconData? icon;
  final Widget? rightWidget;
  final bool isLast;
  final bool isWarning;

  const ProfileMenuItem({
    Key? key,
    required this.onClick,
    this.title,
    this.icon,
    this.rightWidget,
    this.isLast = false,
    this.isWarning = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onClick,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 20.r,
                      color: isWarning
                          ? AppColors.red
                          : AppColors.iconAndTextColor(),
                    ),
                    20.horizontalSpace,
                    Text(
                      '$title',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.4,
                        color: isWarning
                            ? AppColors.red
                            : AppColors.iconAndTextColor(),
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                if (rightWidget != null) rightWidget!
              ],
            ),
            20.verticalSpace,
            if (!isLast)
              Divider(
                height: 1.r,
                thickness: 1.r,
                color: AppColors.gray.withOpacity(0.3),
              ),
          ],
        ),
      ),
    );
  }
}
