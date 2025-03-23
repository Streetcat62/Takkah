import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/constants/constants.dart';

class ShopTabBar extends StatelessWidget {
  final TabController tabController;

  const ShopTabBar({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.r,
      padding: REdgeInsets.all(6),
      margin: REdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        color: AppColors.mainAppbarBack(),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.green,
        ),
        labelPadding: REdgeInsets.symmetric(horizontal: 17),
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.secondaryIconTextColor(),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryIconTextColor(),
          letterSpacing: -14 * 0.01,
        ),
        labelStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: -14 * 0.01,
          color: AppColors.white,
        ),
        controller: tabController,
        tabs: [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FlutterRemix.store_2_fill,
                  size: 24.r,
                ),
                12.horizontalSpace,
                Text(AppHelpers.getTranslation(TrKeys.shop))
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FlutterRemix.restaurant_fill,
                  size: 24.r,
                ),
                12.horizontalSpace,
                Text(AppHelpers.getTranslation(TrKeys.recipes))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
