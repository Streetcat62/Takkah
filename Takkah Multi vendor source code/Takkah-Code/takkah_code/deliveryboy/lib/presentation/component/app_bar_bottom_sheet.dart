import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/style.dart';
import 'buttons/buttons_bouncing_effect.dart';

class AppBarBottomSheet extends StatelessWidget {
  final String title;

  const AppBarBottomSheet({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonsBouncingEffect(
          child: GestureDetector(
            onTap: context.popRoute,
            child: Icon(
              Icons.arrow_back,
              color: Style.blackColor,
              size: 24.r,
            ),
          ),
        ),
        Text(
          title,
          style: Style.interSemi(
              size: 20, color: Style.blackColor, letterSpacing: -0.01),
        ),
        Container(
          width: 24.w,
          height: 24.h,
          margin: const EdgeInsets.all(8),
        ),
      ],
    );
  }
}
