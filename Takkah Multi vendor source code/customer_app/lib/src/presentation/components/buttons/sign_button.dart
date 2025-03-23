import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';

class SignButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onClick;
  final bool? loading;

  const SignButton({Key? key, this.title, this.onClick, this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(28.r),
      color: AppColors.green,
      child: InkWell(
        borderRadius: BorderRadius.circular(28.r),
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.r),
          ),
          height: 56.r,
          padding:
              REdgeInsets.symmetric(horizontal: (Platform.isIOS ? 20 : 26)),
          child: Row(
            children: [
              Text(
                '$title',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: (Platform.isIOS ? 18 : 14).sp,
                  color: AppColors.white,
                ),
              ),
              10.horizontalSpace,
              (loading ?? false)
                  ? SizedBox(
                      height: 20.r,
                      width: 20.r,
                      child: CircularProgressIndicator(
                        color: AppColors.white,
                        strokeWidth: 4.r,
                      ),
                    )
                  : Icon(
                      FlutterRemix.login_circle_line,
                      color: AppColors.white,
                      size: 24.r,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
