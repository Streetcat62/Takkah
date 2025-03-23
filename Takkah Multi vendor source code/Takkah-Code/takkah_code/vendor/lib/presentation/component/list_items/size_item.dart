import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';

class SizeItem extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final String title;

  const SizeItem({
    Key? key,
    required this.onTap,
    required this.isActive,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: 18.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                      color: isActive ? Style.greenColor : Style.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isActive ? Style.blackColor : Style.greyColor,
                        width: isActive ? 4.r : 2.r,
                      ),
                    ),
                  ),
                  16.horizontalSpace,
                  Text(
                    title,
                    style: Style.interNormal(
                      size: 16.sp,
                      color: Style.blackColor,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              Divider(color: Style.greyColor.withOpacity(0.2))
            ],
          ),
        ),
      ),
    );
  }
}
