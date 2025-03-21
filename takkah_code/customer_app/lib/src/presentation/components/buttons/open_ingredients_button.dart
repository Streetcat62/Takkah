import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import 'circle_icon_button.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class OpenIngredientsButton extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onTap;

  const OpenIngredientsButton({
    Key? key,
    required this.isVisible,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: AppColors.onBoardingDot(),
      ),
      padding: REdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          CircleIconButton(
            onTap: onTap,
            iconData: isVisible
                ? FlutterRemix.arrow_down_s_line
                : FlutterRemix.arrow_up_s_line,
            width: 42,
            iconColor: AppColors.iconAndTextColor(),
          ),
          Expanded(
            child: Center(
              child: Text(
                AppHelpers.getTranslation(TrKeys.ingredients),
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.iconAndTextColor(),
                  letterSpacing: -0.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
