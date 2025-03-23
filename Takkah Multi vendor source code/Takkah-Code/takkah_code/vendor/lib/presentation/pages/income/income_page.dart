import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_bar_screen.dart';
import '../../styles/style.dart';
import '../../component/components.dart';
import 'widgets/statistics_section.dart';
import 'widgets/order_prices_section.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

class IncomePage extends ConsumerStatefulWidget {
  const IncomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends ConsumerState<IncomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = [
    Tab(
      child: Text(AppHelpers.trans(TrKeys.today)),
    ),
    Tab(
      child: Text(AppHelpers.trans(TrKeys.weekly)),
    ),
    Tab(
      child: Text(AppHelpers.trans(TrKeys.monthly)),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 0) {
        ref.read(statisticsProvider.notifier).fetchStatistics(
            startTime: DateTime.now(),
            endTime: DateTime.now().subtract(const Duration(days: 3)));
      } else if (_tabController.index == 1) {
        ref.read(statisticsProvider.notifier).fetchStatistics(
            startTime: DateTime.now(),
            endTime: DateTime.now().subtract(const Duration(days: 7)));
      } else {
        ref.read(statisticsProvider.notifier).fetchStatistics(
            startTime: DateTime.now(),
            endTime: DateTime.now().subtract(const Duration(days: 30)));
      }
    });
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(statisticsProvider.notifier).fetchStatistics(
            startTime: DateTime.now(),
            endTime: DateTime.now().subtract(const Duration(days: 3)));
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.greyColor,
      body: Column(
        children: [
          AppbarScreen(
            event: ref.read(statisticsProvider.notifier),
          ),
          16.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                right: 16.w,
                left: 16.w,
                bottom: MediaQuery.of(context).padding.bottom + 56.h,
              ),
              child: Column(
                children: [
                  CustomTabBar(tabController: _tabController, tabs: _tabs),
                  24.verticalSpace,
                  const OrderPricesSection(),
                  _chart(),
                  const StatisticsSection(),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: REdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PopButton(heroTag: AppConstants.heroTagIncomePage),
            8.horizontalSpace,
            Expanded(
              child: CustomButton(
                title: AppHelpers.trans(TrKeys.withdrawMoney),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _chart() {
    return Column(
      children: [
        TitleAndIcon(title: AppHelpers.trans(TrKeys.earningsChart)),
        16.verticalSpace,
        Container(
          width: double.infinity,
          height: 300.h,
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.all(16.r),
          child: Consumer(builder: (context, ref, child) {
            final state = ref.watch(statisticsProvider);
            return BarChart(
              state.list,
              animate: true,
              vertical: false,
              animationDuration: const Duration(seconds: 1),
              defaultRenderer: BarRendererConfig(
                  cornerStrategy: const ConstCornerStrategy(6)),
              selectionModels: [
                SelectionModelConfig(changedListener: (d) {
                 
                })
              ],
            );
          }),
        ),
        32.verticalSpace,
      ],
    );
  }
}
