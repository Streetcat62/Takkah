import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class SmallDot extends StatelessWidget {
  final Color? color;

  const SmallDot({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4.r,
      height: 4.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.r),
        color: color ?? AppColors.gray.withOpacity(0.28),
      ),
    );
  }
}
