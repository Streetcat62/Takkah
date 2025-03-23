import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutStatusDash extends StatelessWidget {
  final Color color;

  const CheckoutStatusDash({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.r,
      child: ListView.builder(
        itemCount: Platform.isAndroid ? 5 : 4,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            height: 6.r,
            width: 16.r,
            margin: REdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: color,
            ),
          );
        },
      ),
    );
  }
}
