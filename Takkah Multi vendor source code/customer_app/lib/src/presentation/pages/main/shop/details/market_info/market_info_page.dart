import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/market_info_body.dart';
import '../../../../../theme/theme.dart';
import 'widgets/delivery_times_body.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';

class MarketInfoPage extends StatefulWidget {
  final ShopData? shop;
  final int? initialTabIndex;

  const MarketInfoPage({Key? key, this.shop, this.initialTabIndex})
      : super(key: key);

  @override
  State<MarketInfoPage> createState() => _MarketInfoPageState();
}

class _MarketInfoPageState extends State<MarketInfoPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTabIndex ?? 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Scaffold(
      backgroundColor: AppColors.mainBackground(),
      appBar: AppBar(
        backgroundColor: AppColors.mainAppbarBack(),
        elevation: 2,
        shadowColor: AppColors.mainAppbarShadow(),
        leadingWidth: 56.r,
        titleSpacing: 0,
        leading: IconButton(
          splashRadius: 18.r,
          onPressed: context.popRoute,
          icon: Icon(
            isLtr
                ? FlutterRemix.arrow_left_s_line
                : FlutterRemix.arrow_right_s_line,
            size: 24.r,
            color: AppColors.iconAndTextColor(),
          ),
        ),
        title: Row(
          children: [
            Hero(
              tag: AppConstants.tagHeroMarketLogo,
              child: CommonImage(
                imageUrl: widget.shop?.logoImg,
                width: 26,
                height: 26,
                radius: 54,
              ),
            ),
            10.horizontalSpace,
            Hero(
              tag: AppConstants.tagHeroMarketTitle,
              child: Text(
                '${widget.shop?.translation?.title}',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.4,
                  color: AppColors.iconAndTextColor(),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
        centerTitle: false,
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
              tabs: [
                Tab(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.marketInfo),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      letterSpacing: -0.4,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    AppHelpers.getTranslation(TrKeys.deliveryTimes),
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
              children: [
                MarketInfoBody(shop: widget.shop),
                DeliveryTimesBody(
                  openTime: AppHelpers.checkWorkDate(widget.shop?.shopWorkingDay),
                  closeTime: AppHelpers.checkWorkDate(widget.shop?.shopWorkingDay)
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
