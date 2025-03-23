import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Tab> tabs;

  const CustomTabBar(
      {Key? key, required this.tabController, required this.tabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      height: 48.h,
      decoration: BoxDecoration(
          color: Style.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Style.tabBarBorderColor)),
      child: TabBar(
          controller: tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Style.blackColor),
          labelColor: Style.white,
          unselectedLabelColor: Style.textColor,
          unselectedLabelStyle: Style.interRegular(size: 14.sp),
          labelStyle: Style.interSemi(size: 14.sp,),
          tabs: tabs),
    );
  }
}
