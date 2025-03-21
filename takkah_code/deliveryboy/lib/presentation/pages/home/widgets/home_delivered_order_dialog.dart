import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';
import 'home_rate_customer_modal.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/models/models.dart';
import '../../../../infrastructure/services/services.dart';

class HomeDeliveredOrderDialog extends StatelessWidget {
  final OrderDetailData order;

  const HomeDeliveredOrderDialog({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        color: Style.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: AppHelpers.getTranslation(TrKeys.thatYouHaveIndeed),
              style: Style.interNormal(size: 16.sp),
              children: [
                TextSpan(
                  text: ' ${AppHelpers.getTranslation(TrKeys.received)} ',
                  style: Style.interSemi(size: 16.sp),
                ),
                TextSpan(
                  text: AppHelpers.getTranslation(TrKeys.theOrderDoYouConfirm)
                      .toLowerCase(),
                  style: Style.interNormal(size: 16.sp),
                ),
              ],
            ),
          ),
          32.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: AppHelpers.getTranslation(TrKeys.cancel),
                  background: Style.redColor,
                  textColor: Style.white,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              10.horizontalSpace,
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) => CustomButton(
                    title: AppHelpers.getTranslation(TrKeys.delivered),
                    background: Style.blackColor,
                    textColor: Style.white,
                    isLoading: ref.watch(homeProvider).isApproveLoading,
                    onPressed: () =>
                        ref.read(homeProvider.notifier).deliveredFinish(
                      context,
                      orderId: order.id,
                      success: () {
                        ref.read(orderProvider.notifier).refreshActiveOrders(
                              context,
                              setNextActiveOrder: (activeOrder) => ref
                                  .read(homeProvider.notifier)
                                  .setCurrentActiveOrder(
                                    context,
                                    order: activeOrder,
                                  ),
                            );
                        Navigator.pop(context);
                        AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal: HomeRateCustomerModal(order: order),
                          isDarkMode: false,
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
