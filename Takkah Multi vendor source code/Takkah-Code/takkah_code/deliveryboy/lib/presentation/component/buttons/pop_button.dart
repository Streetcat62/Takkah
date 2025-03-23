import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import 'buttons_bouncing_effect.dart';

class PopButton extends StatelessWidget {
  const PopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsBouncingEffect(
      child: GestureDetector(
        onTap: () {
          context.popRoute();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Style.blackColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.all(12.sp),
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Style.white,
          ),
        ),
      ),
    );
  }
}
