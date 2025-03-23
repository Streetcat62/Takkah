import 'package:flutter/material.dart';

import 'widgets/coupon_products_tab_body.dart';
import 'widgets/discount_products_tab_body.dart';

class SavedProductsPage extends StatefulWidget {
  final int? shopId;

  const SavedProductsPage({Key? key, this.shopId}) : super(key: key);

  @override
  State<SavedProductsPage> createState() => _SavedProductsPageState();
}

class _SavedProductsPageState extends State<SavedProductsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   height: 60.r,
        //   color: AppColors.secondaryBack(),
        //   child: TabBar(
        //     indicatorColor: AppColors.green,
        //     indicatorWeight: 2,
        //     controller: _tabController,
        //     labelColor: AppColors.iconAndTextColor(),
        //     unselectedLabelColor: AppColors.gray,
        //     tabs: [
        //       Tab(
        //         child: Text(
        //           AppHelpers.getTranslation(TrKeys.discounts),
        //           style: GoogleFonts.inter(
        //             fontWeight: FontWeight.w500,
        //             fontSize: 14.sp,
        //             letterSpacing: -0.4,
        //           ),
        //         ),
        //       ),
        //       Tab(
        //         child: Text(
        //           AppHelpers.getTranslation(TrKeys.coupons),
        //           style: GoogleFonts.inter(
        //             fontWeight: FontWeight.w500,
        //             fontSize: 14.sp,
        //             letterSpacing: -0.4,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              DiscountProductsTabBody(shopId: widget.shopId),
              const CouponProductsTabBody(),
            ],
          ),
        ),
      ],
    );
  }
}
