import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../list_items/shop_tab_bar_item.dart';
import '../../../infrastructure/services/services.dart';

class CategoryTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabs;
  final int index;
  final ValueChanged<int> onTap;

  const CategoryTabBar({
    Key? key,
    required this.tabController,
    required this.tabs,
    required this.onTap,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Style.greyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.r, end: 8.r),
            child: SvgPicture.asset(
              AppAssets.svgMenu,
              width: 22.r,
              height: 22.r,
            ),
          ),
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            onTap: onTap,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            isScrollable: true,
            indicatorPadding: EdgeInsets.zero,
            indicatorColor: Style.transparent,
            labelColor: Style.primaryColor,
            unselectedLabelColor: Style.white,
            controller: tabController,
            tabs: [
              ...tabs.map(
                (e) => ShopTabBarItem(
                  title: e,
                  isActive: index == tabs.indexOf(e),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
