import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../../infrastructure/models/models.dart';
import '../../../../infrastructure/services/services.dart';

class OrdersBody extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onRefresh;
  final VoidCallback onLoading;
  final RefreshController refreshController;
  final List<OrderDetailData> orders;

  const OrdersBody({
    Key? key,
    required this.isLoading,
    required this.onRefresh,
    required this.onLoading,
    required this.refreshController,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loading()
        : SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: onRefresh,
            onLoading: onLoading,
            controller: refreshController,
            child: orders.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.only(
                      top: 30.h,
                      bottom: MediaQuery.of(context).padding.bottom + 42.h,
                      left: 16.r,
                      right: 16.r,
                    ),
                    shrinkWrap: true,
                    itemCount: orders.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => OrdersItem(
                      isActiveButton: true,
                      isOrder: true,
                      order: orders[index],
                    ),
                  )
                : Column(
                    children: [
                      16.verticalSpace,
                      Lottie.asset(AppAssets.lottieEmptyBox),
                      Text(
                        AppHelpers.getTranslation(TrKeys.nothingFound),
                        style: Style.interSemi(size: 18.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.trySearchingAgain),
                          style: Style.interRegular(size: 14.sp),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
          );
  }
}
