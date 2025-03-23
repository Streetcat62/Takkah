import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool? hasBack;
  final VoidCallback? onBack;
  final Widget? actions;

  const CustomAppBar({
    Key? key,
    this.title,
    this.hasBack,
    this.onBack,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = AppBar().preferredSize.height;
    return Container(
      width: 1.sw,
      height: statusBarHeight + appBarHeight,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 2.r,
            spreadRadius: 0,
            color: AppColors.mainAppbarShadow(),
          )
        ],
        color: AppColors.mainAppbarBack(),
      ),
      padding: REdgeInsets.only(left: 15, right: 15, top: statusBarHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              if (hasBack!)
                InkWell(
                  child: SizedBox(
                    width: 34.r,
                    height: 34.r,
                    child: Icon(
                      FlutterRemix.arrow_left_s_line,
                      size: 24.sp,
                      color: AppColors.iconAndTextColor(),
                    ),
                  ),
                  onTap: () {
                    if (onBack != null) onBack!();
                    context.popRoute();
                  },
                ),
              Container(
                height: 34,
                alignment: Alignment.centerLeft,
                margin: REdgeInsets.only(left: 8),
                child: Text(
                  '$title',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    letterSpacing: -0.4,
                    color: AppColors.iconAndTextColor(),
                  ),
                ),
              ),
            ],
          ),
          if (actions != null) actions!
        ],
      ),
    );
  }
}
