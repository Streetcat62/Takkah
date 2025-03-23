import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';

class BottomNavigatorItem extends StatelessWidget {
  final VoidCallback selectItem;
  final int index;
  final int currentIndex;
  final IconData selectIcon;
  final IconData unSelectIcon;
  final bool isScrolling;

  const BottomNavigatorItem({
    Key? key,
    required this.selectItem,
    required this.index,
    required this.selectIcon,
    required this.unSelectIcon,
    required this.currentIndex,
    required this.isScrolling,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectItem,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        color: Style.transparent,
        height: isScrolling ? 0.h : 30.h,
        width: isScrolling ? 0.w : 56.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: index == currentIndex
                  ? Icon(
                      selectIcon,
                      size: isScrolling ? 0.r : 24.r,
                      color: Style.white,
                    )
                  : Icon(
                      unSelectIcon,
                      size: isScrolling ? 0.r : 24.r,
                      color: Style.white,
                    ),
            ),
            AnimatedContainer(
              height: isScrolling ? 0.h : 4.h,
              width: isScrolling ? 0.w : 24.w,
              decoration: BoxDecoration(
                color: index == currentIndex
                    ? Style.primaryColor
                    : Style.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100.r),
                  topRight: Radius.circular(100.r),
                ),
              ),
              duration: const Duration(milliseconds: 400),
            )
          ],
        ),
      ),
    );
  }
}
