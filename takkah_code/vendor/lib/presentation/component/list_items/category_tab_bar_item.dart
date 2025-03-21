import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../buttons/buttons_bouncing_effect.dart';

class CategoryTabBarItem extends StatelessWidget {
  final String? title;
  final bool isActive;
  final Function() onTap;

  const CategoryTabBarItem({
    Key? key,
    this.title,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsBouncingEffect(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 36.r,
          decoration: BoxDecoration(
            color: isActive ? Style.primaryColor : Style.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Style.white.withOpacity(0.07),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          alignment: Alignment.center,
          padding: REdgeInsets.symmetric(horizontal: 18),
          margin: REdgeInsets.only(right: 8),
          child: Row(
            children: [
              Text(
                '$title',
                style: Style.interNormal(
                  size: 13.sp,
                  color: Style.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
