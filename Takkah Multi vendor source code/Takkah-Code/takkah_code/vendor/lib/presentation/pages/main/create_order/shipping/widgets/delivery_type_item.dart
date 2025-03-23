import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/components.dart';
import '../../../../../styles/style.dart';

class DeliveryTypeItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String desc;
  final bool isActive;
  final VoidCallback onTap;

  const DeliveryTypeItem({
    Key? key,
    required this.iconData,
    required this.title,
    required this.desc,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsBouncingEffect(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: isActive ? Style.primaryColor : Style.shimmerBase,
            ),
          ),
          padding: REdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? Style.blackColor : Style.transparent,
                  border: Border.all(color: Style.blackColor),
                ),
                padding: EdgeInsets.all(10.r),
                child: Center(
                  child: Icon(
                    iconData,
                    color: isActive ? Style.primaryColor : Style.blackColor,
                  ),
                ),
              ),
              10.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Style.interSemi(
                      size: 14.sp,
                      color: Style.blackColor,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Text(
                    desc,
                    style: Style.interNormal(
                      size: 12.sp,
                      color: Style.blackColor,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
