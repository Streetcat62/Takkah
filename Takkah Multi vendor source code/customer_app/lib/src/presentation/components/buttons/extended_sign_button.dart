import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'google_button.dart';
import 'facebook_button.dart';
import '../../theme/theme.dart';

class ExtendedSignButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onSignInWithGoogle;
  final VoidCallback? onSignInWithFacebook;
  final VoidCallback? onSignInWithApple;
  final bool isGoogleLoading;
  final bool isFacebookLoading;
  final bool isAppleLoading;

  const ExtendedSignButton({
    Key? key,
    this.title,
    this.onSignInWithGoogle,
    this.onSignInWithFacebook,
    this.onSignInWithApple,
    required this.isGoogleLoading,
    required this.isFacebookLoading,
    required this.isAppleLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
        color: AppColors.mainBackground(),
      ),
      padding: EdgeInsetsDirectional.only(start: 12.r, end: 12.r),
      child: Row(
        children: [
          if (title != null && title!.isNotEmpty)
            Row(
              children: [
                Text(
                  '$title',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: (Platform.isIOS ? 14 : 12).sp,
                    letterSpacing: -0.4,
                    color: AppColors.secondaryIconTextColor(),
                  ),
                ),
                6.horizontalSpace,
              ],
            ),
          GoogleButton(
            onSubmit: onSignInWithGoogle,
            isLoading: isGoogleLoading,
          ),
          6.horizontalSpace,
          FacebookButton(
            onSubmit: onSignInWithFacebook,
            isLoading: isFacebookLoading,
          ),
        ],
      ),
    );
  }
}
