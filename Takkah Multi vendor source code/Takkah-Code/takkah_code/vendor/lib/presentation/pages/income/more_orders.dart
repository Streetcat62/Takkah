import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:venderfoodyman/application/restaurant/income/statistics/statistics_provider.dart';
import 'package:venderfoodyman/presentation/component/filter_screen.dart';

import '../../component/helper/modal_drag.dart';
import '../../component/helper/modal_wrap.dart';
import '../../component/loading/loading.dart';
import '../../styles/style.dart';
import '../../../infrastructure/services/services.dart';

class MoreOrders extends ConsumerStatefulWidget {
  const MoreOrders({Key? key}) : super(key: key);

  @override
  ConsumerState<MoreOrders> createState() => _MoreOrdersState();
}

class _MoreOrdersState extends ConsumerState<MoreOrders> {
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(statisticsProvider.notifier).fetchStatisticsOrder();
    });
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: ref.watch(statisticsProvider).isLoading
            ? const Loading()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ModalDrag(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppHelpers.trans(TrKeys.moreOrders),
                            style: Style.interSemi(size: 18.sp),
                          ),
                          Text(
                            AppHelpers.trans(TrKeys.moreOrders),
                            style: Style.interNormal(
                                size: 14.sp, letterSpacing: -0.3),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          AppHelpers.showCustomModalBottomSheet(
                            paddingTop: MediaQuery.of(context).padding.top,
                            context: context,
                            radius: 12,
                            modal: FilterScreen(
                              isTabBar: false,
                              onChangeDay: (rangeDatePicker) {
                                ref
                                    .read(statisticsProvider.notifier)
                                    .fetchStatisticsOrderByDay(
                                        startTime: rangeDatePicker.last ??
                                            DateTime.now(),
                                        endTime: rangeDatePicker.first ??
                                            DateTime.now());
                              },
                            ),
                            isDarkMode: true,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: const BoxDecoration(
                            color: Style.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            FlutterRemix.calendar_event_fill,
                            color: Style.blackColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  40.verticalSpace,
                  Expanded(
                    child: SmartRefresher(
                      controller: _refreshController,
                      physics: const BouncingScrollPhysics(),
                      enablePullDown: true,
                      enablePullUp: true,
                      onLoading: () {
                        if (ref.watch(statisticsProvider).isRefresh) {
                          ref
                              .read(statisticsProvider.notifier)
                              .fetchStatisticsOrderPage(
                                refreshController: _refreshController,
                              );
                        } else {
                          _refreshController.loadNoData();
                        }
                      },
                      onRefresh: () => ref
                          .read(statisticsProvider.notifier)
                          .fetchStatisticsOrder(),
                      child: Table(
                        defaultColumnWidth: FixedColumnWidth(
                            MediaQuery.of(context).size.width / 4),
                        border: TableBorder.all(color: Style.transparent),
                        children: [
                          TableRow(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppHelpers.trans(TrKeys.time),
                                    style: Style.interSemi(
                                      size: 13.sp,
                                      color: Style.blackColor,
                                      letterSpacing: -0.3,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    AppHelpers.trans(TrKeys.price),
                                    style: Style.interSemi(
                                      size: 13.sp,
                                      color: Style.blackColor,
                                      letterSpacing: -0.3,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    AppHelpers.trans(TrKeys.shop),
                                    style: Style.interSemi(
                                      size: 13.sp,
                                      color: Style.blackColor,
                                      letterSpacing: -0.3,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    AppHelpers.trans(TrKeys.fm),
                                    style: Style.interSemi(
                                      size: 13.sp,
                                      color: Style.blackColor,
                                      letterSpacing: -0.3,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          for (int i = 0;
                              i <
                                  (ref
                                          .watch(statisticsProvider)
                                          .listOfOrder
                                          ?.data
                                          ?.length ??
                                      0);
                              i++)
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: Column(
                                    children: [
                                      Text(
                                        DateFormat("hh:mm - dd MMMM").format(ref
                                                .watch(statisticsProvider)
                                                .listOfOrder
                                                ?.data?[i]
                                                .createdAt ??
                                            DateTime.now()),
                                        style: Style.interNormal(
                                          size: 12.sp,
                                          color: Style.blackColor,
                                          letterSpacing: -0.3,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: Column(
                                    children: [
                                      Text(
                                        NumberFormat.currency(
                                          symbol: LocalStorage.instance
                                              .getSelectedCurrency()
                                              ?.symbol,
                                        ).format(ref
                                                .watch(statisticsProvider)
                                                .listOfOrder
                                                ?.data?[i]
                                                .price ??
                                            0),
                                        style: Style.interSemi(
                                          size: 12.sp,
                                          color: Style.blackColor,
                                          letterSpacing: -0.3,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: Column(
                                    children: [
                                      Text(
                                        NumberFormat.currency(
                                          symbol: LocalStorage.instance
                                              .getSelectedCurrency()
                                              ?.symbol,
                                        ).format(ref
                                                .watch(statisticsProvider)
                                                .listOfOrder
                                                ?.data?[i]
                                                .avgPrice ??
                                            0),
                                        style: Style.interNormal(
                                          size: 12.sp,
                                          color: Style.blackColor,
                                          letterSpacing: -0.3,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: REdgeInsets.symmetric(vertical: 12),
                                  child: Column(
                                    children: [
                                      Text(
                                        NumberFormat.currency(
                                          symbol: LocalStorage.instance
                                              .getSelectedCurrency()
                                              ?.symbol,
                                        ).format(ref
                                                .watch(statisticsProvider)
                                                .listOfOrder
                                                ?.data?[i]
                                                .tax ??
                                            0),
                                        style: Style.interNormal(
                                          size: 12.sp,
                                          color: Style.blackColor,
                                          letterSpacing: -0.3,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  32.verticalSpace,
                ],
              ),
      ),
    );
  }
}
