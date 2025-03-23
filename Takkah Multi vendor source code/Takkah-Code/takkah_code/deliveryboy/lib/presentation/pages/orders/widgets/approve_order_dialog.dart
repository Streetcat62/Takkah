import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/models/models.dart';
import '../../../../infrastructure/services/services.dart';

class ApproveOrderDialog extends StatelessWidget {
  final OrderDetailData order;
  final bool doublePop;

  const ApproveOrderDialog({
    Key? key,
    required this.order,
    this.doublePop = false,
  }) : super(key: key);

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
                  builder: (context, ref, child) {
                    return CustomButton(
                      title: AppHelpers.getTranslation(TrKeys.approve),
                      background: Style.blackColor,
                      textColor: Style.white,
                      isLoading: ref.watch(orderDetailsProvider).isLoading,
                      onPressed: () => ref
                          .read(orderDetailsProvider.notifier)
                          .updateToOnAWay(
                        context,
                        success: () {
                          if (doublePop) {
                            Navigator.pop(context);
                          }
                          Navigator.pop(context);
                          ref.read(orderProvider.notifier).refreshActiveOrders(
                                context,
                                emptyActiveOrders: () => ref
                                    .read(homeProvider.notifier)
                                    .setCurrentActiveOrder(context),
                              );
                          if (LocalStorage.instance.getActiveOrderId() ==
                              order.id) {
                            ref
                                .read(homeProvider.notifier)
                                .getRoutingAll(context, order: order);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
