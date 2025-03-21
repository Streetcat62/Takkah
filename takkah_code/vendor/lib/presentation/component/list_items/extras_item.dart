import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../buttons/buttons_bouncing_effect.dart';
import '../../../infrastructure/models/models.dart';

class ExtrasItem extends StatelessWidget {
  final Group extras;
  final Function()? onTap;
  final bool isLast;

  const ExtrasItem({
    Key? key,
    required this.extras,
    this.isLast = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsBouncingEffect(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Style.transparent,
          padding: REdgeInsets.symmetric(vertical: 16),
          margin: REdgeInsets.only(right: 14),
          child: Row(
            children: [
              Icon(
                (extras.isChecked ?? false)
                    ? FlutterRemix.checkbox_circle_fill
                    : FlutterRemix.checkbox_blank_circle_line,
                color: (extras.isChecked ?? false)
                    ? Style.primaryColor
                    : Style.blackColor,
                size: 24.r,
              ),
              4.horizontalSpace,
              Text(
                '${extras.translation?.title}',
                style: Style.interSemi(size: 14.sp, letterSpacing: -0.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
