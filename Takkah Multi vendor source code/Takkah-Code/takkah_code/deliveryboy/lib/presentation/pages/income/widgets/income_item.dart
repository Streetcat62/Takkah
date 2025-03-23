import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';

class IncomeItem extends StatelessWidget {
  final String title;
  final String price;
  final bool isBlack;

  const IncomeItem(
      {Key? key,
      required this.title,
      required this.price,
      this.isBlack = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: isBlack ? Style.blackColor : Style.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Style.interNormal(
                size: 14.sp,
                letterSpacing: -0.3,
                color: isBlack ? Style.white : Style.blackColor),
          ),
          Text(
            price,
            style: Style.interSemi(
                size: 14.sp,
                letterSpacing: -0.3,
                color: isBlack ? Style.white : Style.blackColor),
          ),
        ],
      ),
    );
  }
}
