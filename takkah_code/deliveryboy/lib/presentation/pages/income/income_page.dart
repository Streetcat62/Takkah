import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'income_appbar.dart';
import 'statistics_screen.dart';
import '../../styles/style.dart';
import 'widgets/income_item.dart';
import '../../component/components.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/models/models.dart';
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
      child: Text(AppHelpers.getTranslation(TrKeys.today)),
    ),
    Tab(
      child: Text(AppHelpers.getTranslation(TrKeys.weekly)),
    ),
    Tab(
      child: Text(AppHelpers.getTranslation(TrKeys.monthly)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(
      () {
        if (_tabController.index == 0) {
          ref.read(statisticsProvider.notifier).fetchStatistics(
                startTime: DateTime.now(),
                endTime: DateTime.now().subtract(const Duration(days: 3)),
              );
        } else if (_tabController.index == 1) {
          ref.read(statisticsProvider.notifier).fetchStatistics(
                startTime: DateTime.now(),
                endTime: DateTime.now().subtract(const Duration(days: 7)),
              );
        } else {
          ref.read(statisticsProvider.notifier).fetchStatistics(
                startTime: DateTime.now(),
                endTime: DateTime.now().subtract(const Duration(days: 30)),
              );
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(statisticsProvider.notifier).fetchStatistics(
            startTime: DateTime.now(),
            endTime: DateTime.now().subtract(const Duration(days: 3)),
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(statisticsProvider);
    return Scaffold(
      backgroundColor: Style.greyColor,
      body: Column(
        children: [
          const IncomeAppbar(),
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
                  _orderPrices(context, state.countData),
                  TitleAndIcon(
                    title: AppHelpers.getTranslation(
                        TrKeys.deliverymanTransactions),
                  ),
                  12.verticalSpace,
                  IncomeItem(
                    title: AppHelpers.getTranslation(TrKeys.wallet),
                    price: NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency()?.symbol,
                    ).format(
                        LocalStorage.instance.getUser()?.wallet?.price ?? 0),
                  ),
                  IncomeItem(
                    title: AppHelpers.getTranslation(TrKeys.rating),
                    price: (LocalStorage.instance.getUser()?.rate ?? 0)
                        .toStringAsFixed(1),
                  ),
                  24.verticalSpace,
                  StatisticsScreen(
                    totalOrders:
                        (state.countData?.data?.totalCount ?? 0).toString(),
                    todayOrders: (state.countData?.data?.totalTodayCount ?? 0)
                        .toString(),
                    acceptedOrders:
                        (state.countData?.data?.totalAcceptedCount ?? 0)
                            .toString(),
                    rejectedOrders:
                        (state.countData?.data?.totalCanceledCount ?? 0)
                            .toString(),
                    doneOrders:
                        (state.countData?.data?.totalDeliveredCount ?? 0)
                            .toString(),
                    canceledOrders:
                        (state.countData?.data?.totalNewCount ?? 0).toString(),
                    acceptedPer:
                        '${((state.countData?.data?.totalAcceptedCount ?? 0) / (state.countData?.data?.totalCount ?? 1) * 100).toStringAsFixed(1)}%',
                    rejectedPer:
                        '${((state.countData?.data?.totalCanceledCount ?? 0) / (state.countData?.data?.totalCount ?? 1) * 100).toStringAsFixed(1)}%',
                    donePer:
                        '${((state.countData?.data?.totalDeliveredCount ?? 0) / (state.countData?.data?.totalCount ?? 1) * 100).toStringAsFixed(1)}%',
                    canceledPer:
                        '${((state.countData?.data?.totalNewCount ?? 0) / (state.countData?.data?.totalCount ?? 1) * 100).toStringAsFixed(1)}%',
                  ),
                  32.verticalSpace,
                  _chart(state.list),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PopButton(),
            8.horizontalSpace,
            Expanded(
              child: CustomButton(
                title: AppHelpers.getTranslation(TrKeys.withdrawMoney),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _chart(List<Series<OrdinalSales, String>> list) {
    return Column(
      children: [
        TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.earningsChart)),
        16.verticalSpace,
        Container(
          width: double.infinity,
          height: 300.h,
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.all(16.r),
          child: BarChart(
            list,
            animate: true,
            vertical: false,
            animationDuration: const Duration(seconds: 1),
            defaultRenderer:
                BarRendererConfig(cornerStrategy: const ConstCornerStrategy(6)),
          ),
        ),
        32.verticalSpace,
      ],
    );
  }

  Column _orderPrices(
    BuildContext context,
    StatisticsIncomeResponse? countData,
  ) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.orderPrice),
                style: Style.interNormal(
                  size: 14.sp,
                  color: Style.blackColor,
                  letterSpacing: -0.3,
                ),
              ),
              16.verticalSpace,
              Text(
                NumberFormat.currency(
                  symbol: LocalStorage.instance.getSelectedCurrency()?.symbol,
                ).format(countData?.data?.lastOrderTotalPrice ?? 0),
                style: Style.interSemi(
                  size: 32.sp,
                  color: Style.blackColor,
                  letterSpacing: -0.3,
                ),
              ),
              4.verticalSpace,
              RichText(
                text: TextSpan(
                  text: '${AppHelpers.getTranslation(TrKeys.lastIncome)} ',
                  style: Style.interNormal(
                    size: 12.sp,
                    color: Style.blackColor,
                    letterSpacing: -0.3,
                  ),
                  children: [
                    TextSpan(
                      text: NumberFormat.currency(
                        symbol:
                            LocalStorage.instance.getSelectedCurrency()?.symbol,
                      ).format(countData?.data?.lastOrderIncome ?? 0),
                      style: Style.interSemi(
                        size: 12.sp,
                        color: Style.blackColor,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        32.verticalSpace,
      ],
    );
  }
}
