import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'rate_customer_modal.dart';
import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/services/services.dart';

class DeliveredOrderDialog extends StatelessWidget {
  const DeliveredOrderDialog({Key? key}) : super(key: key);

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
                    isLoading: ref.watch(orderDetailsProvider).isLoading,
                    onPressed: () => ref
                        .read(orderDetailsProvider.notifier)
                        .updateToDelivered(
                      context,
                      success: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        ref.read(orderProvider.notifier).refreshActiveOrders(
                              context,
                              emptyActiveOrders: () => ref
                                  .read(homeProvider.notifier)
                                  .setCurrentActiveOrder(context),
                            );
                        AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal: RateCustomerModal(
                            order: ref.watch(orderDetailsProvider).order,
                          ),
                          isDarkMode: false,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
