import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class ProfileDot extends StatelessWidget {
  final bool isFull;
  final int width;
  final int height;
  final int radius;
  final Color fillColor;
  final Color notFillColor;

  const ProfileDot({
    Key? key,
    required this.isFull,
    this.width = 34,
    this.height = 11,
    this.radius = 15,
    this.fillColor = AppColors.white,
    this.notFillColor = AppColors.darkGreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.r,
      height: height.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
        color: isFull ? fillColor : notFillColor,
      ),
    );
  }
}
