import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import 'widgets/new_orders_body.dart';
import 'widgets/ready_orders_body.dart';
import 'widgets/canceled_orders_body.dart';
import 'widgets/on_a_way_orders_body.dart';
import 'widgets/accepted_orders_body.dart';
import 'widgets/delivered_orders_body.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';

class OrderHistoryPage extends ConsumerStatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends ConsumerState<OrderHistoryPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.myOrders),
        onLeadingPressed: context.popRoute,
      ),
      body: Column(
        children: [
          Container(
            height: 60.r,
            color: AppColors.secondaryBack(),
            child: TabBar(
              indicatorColor: AppColors.green,
              indicatorWeight: 2,
              controller: _tabController,
              labelColor: AppColors.iconAndTextColor(),
              unselectedLabelColor: AppColors.gray,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              tabs: [
                Tab(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.newKey),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.accepted),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.ready),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.onAWay),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.delivered),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.canceled),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const BouncingScrollPhysics(),
              children: const [
                NewOrdersBody(),
                AcceptedOrdersBody(),
                ReadyOrdersBody(),
                OnAWayOrdersBody(),
                DeliveredOrdersBody(),
                CanceledOrdersBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
