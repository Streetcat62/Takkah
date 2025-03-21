import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import 'buttons_bouncing_effect.dart';
import '../../../infrastructure/services/services.dart';

class PopButton extends StatelessWidget {
  final String heroTag;

  const PopButton({Key? key, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return ButtonsBouncingEffect(
      child: Hero(
        tag: heroTag,
        child: GestureDetector(
          onTap: context.popRoute,
          child: Container(
            width: 48.r,
            height: 48.r,
            decoration: BoxDecoration(
              color: Style.blackColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: Icon(
              isLtr
                  ? FlutterRemix.arrow_left_s_line
                  : FlutterRemix.arrow_right_s_line,
              color: Style.white,
              size: 20.r,
            ),
          ),
        ),
      ),
    );
  }
}
