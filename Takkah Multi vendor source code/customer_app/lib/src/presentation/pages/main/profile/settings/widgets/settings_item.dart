import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? rightWidget;

  const SettingsItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
    this.rightWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.mainAppbarBack(),
          child: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: onTap,
            child: Container(
              height: 60.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.center,
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          size: 22.r,
                          color: AppColors.iconAndTextColor(),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: Text(
                            title,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: AppColors.iconAndTextColor(),
                              letterSpacing: -0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (rightWidget != null) rightWidget!
                ],
              ),
            ),
          ),
        ),
        8.verticalSpace,
      ],
    );
  }
}
