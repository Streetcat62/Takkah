import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'statistics_item.dart';
import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/services/services.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndIcon(title: AppHelpers.trans(TrKeys.statistics)),
        16.verticalSpace,
        SizedBox(
          height: 190.h,
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(statisticsProvider);
              return Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Style.white,
                    ),
                    padding: REdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          AppHelpers.trans(TrKeys.totalOrders),
                          style: Style.interNormal(
                            size: 12.sp,
                            color: Style.blackColor,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${state.countData?.ordersCount ?? 0}',
                          style: Style.interSemi(
                            size: 34.sp,
                            color: Style.blackColor,
                            letterSpacing: -1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          StatisticsItem(
                            title: AppHelpers.trans(TrKeys.acceptedOrders),
                            count: int.tryParse(
                                    state.countData?.acceptedOrdersCount ??
                                        '0') ??
                                0,
                            percentage: state.countData?.ordersCount == 0
                                ? 0
                                : ((int.tryParse(state.countData
                                                    ?.acceptedOrdersCount ??
                                                '0') ??
                                            0) /
                                        (state.countData?.ordersCount ?? 1)) *
                                    100,
                            bgColor: Style.greenColor,
                            textColor: Style.white,
                            iconColor: Style.white.withOpacity(0.54),
                          ),
                          8.horizontalSpace,
                          StatisticsItem(
                            title: AppHelpers.trans(TrKeys.cancelOrders),
                            count: int.tryParse(
                                    state.countData?.cancelOrdersCount ??
                                        '0') ??
                                0,
                            percentage: state.countData?.ordersCount == 0
                                ? 0
                                : ((int.tryParse(state.countData
                                                    ?.cancelOrdersCount ??
                                                '0') ??
                                            0) /
                                        (state.countData?.ordersCount ?? 1)) *
                                    100,
                            bgColor: Style.redColor,
                            textColor: Style.white,
                            iconColor: Style.white.withOpacity(0.54),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatisticsItem(
                            title:
                                AppHelpers.trans(TrKeys.deliveredOrdersCount),
                            count: int.tryParse(
                                    state.countData?.deliveredOrdersCount ??
                                        '0') ??
                                0,
                            percentage: state.countData?.ordersCount == 0
                                ? 0
                                : ((int.tryParse(state.countData
                                                    ?.deliveredOrdersCount ??
                                                '0') ??
                                            0) /
                                        (state.countData?.ordersCount ?? 1)) *
                                    100,
                            bgColor: Style.white,
                            textColor: Style.blackColor,
                            iconColor: Style.iconColor,
                          ),
                          8.horizontalSpace,
                          StatisticsItem(
                            title: AppHelpers.trans(TrKeys.newOrders),
                            count: int.tryParse(
                                    state.countData?.newOrdersCount ?? '0') ??
                                0,
                            percentage: state.countData?.ordersCount == 0
                                ? 0
                                : ((int.tryParse(state.countData
                                                    ?.newOrdersCount ??
                                                '0') ??
                                            0) /
                                        (state.countData?.ordersCount ?? 1)) *
                                    100,
                            bgColor: Style.white,
                            textColor: Style.blackColor,
                            iconColor: Style.iconColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
