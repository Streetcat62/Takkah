import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../core/utils/utils.dart';

class CommonAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final bool hasBack;
  final VoidCallback onLeadingPressed;
  final List<Widget>? actions;

  const CommonAppBar({
    Key? key,
    required this.title,
    required this.onLeadingPressed,
    this.hasBack = true,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return AppBar(
      backgroundColor: AppColors.mainAppbarBack(),
      elevation: 2,
      shadowColor: AppColors.mainAppbarShadow(),
      leadingWidth: hasBack ? 56.r : 0,
      titleSpacing: hasBack ? 0 : NavigationToolbar.kMiddleSpacing,
      leading: hasBack
          ? IconButton(
              splashRadius: 18.r,
              onPressed: onLeadingPressed,
              padding: EdgeInsets.zero,
              icon: Icon(
                isLtr
                    ? FlutterRemix.arrow_left_s_line
                    : FlutterRemix.arrow_right_s_line,
                size: 32.r,
                color: AppColors.iconAndTextColor(),
              ),
            )
          : const SizedBox.shrink(),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.4,
          color: AppColors.iconAndTextColor(),
        ),
      ),
      centerTitle: false,
      actions: actions,
    );
  }

  @override
  Widget get child => const Text('Common appbar');

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
