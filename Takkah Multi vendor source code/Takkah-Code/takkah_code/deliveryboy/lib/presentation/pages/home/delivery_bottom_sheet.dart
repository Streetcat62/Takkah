import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import 'widgets/order_items_modal.dart';
import '../../component/components.dart';
import 'widgets/home_approve_order_dialog.dart';
import 'widgets/home_delivered_order_dialog.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/services/services.dart';

class DeliverBottomSheetScreen extends StatelessWidget {
  final OrderDetailData order;

  const DeliverBottomSheetScreen({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Consumer(
        builder: (context, ref, child) {
          return SizedBox(
            height: ref.watch(homeProvider).isGoUser
                ? MediaQuery.of(context).size.height * 1.8 / 3
                : MediaQuery.of(context).size.height * 2 / 3,
            width: double.infinity,
            child: DraggableScrollableSheet(
              initialChildSize: 0.2,
              maxChildSize: 1,
              minChildSize: 0.16,
              snap: true,
              builder: (context, scrollController) => Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Style.greyColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    topLeft: Radius.circular(12.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Style.blackColor.withOpacity(0.25),
                      blurRadius: 40,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    top: 8.h,
                    bottom: MediaQuery.of(context).padding.bottom + 16.h,
                    left: 16.w,
                    right: 16.w,
                  ),
                  children: [
                    Container(
                      height: 4.h,
                      margin: EdgeInsets.symmetric(
                        horizontal:
                            (MediaQuery.of(context).size.width - 100.w) / 2,
                      ),
                      decoration: BoxDecoration(
                        color: Style.bottomSheetIconColor,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                    24.verticalSpace,
                    OrderBottomSheet(order: order),
                    24.verticalSpace,
                    ref.watch(homeProvider).isGoRestaurant
                        ? Column(
                            children: [
                              CustomButton(
                                title: AppHelpers.getTranslation(
                                    TrKeys.orderInformation),
                                onPressed: () =>
                                    AppHelpers.showCustomModalBottomSheet(
                                  context: context,
                                  modal: OrderItemsModal(order: order),
                                  isDarkMode: false,
                                ),
                                background: Style.transparent,
                                borderColor: Style.blackColor,
                                textColor: Style.blackColor,
                              ),
                              10.verticalSpace,
                            ],
                          )
                        : const SizedBox.shrink(),
                    CustomButton(
                      title: ref.watch(homeProvider).isGoRestaurant
                          ? AppHelpers.getTranslation(TrKeys.order)
                          : AppHelpers.getTranslation(TrKeys.deliveredTheOrder),
                      onPressed: () {
                        if (ref.watch(homeProvider).isGoRestaurant) {
                          AppHelpers.showAlertDialog(
                            context: context,
                            child: HomeApproveOrderDialog(order: order),
                          );
                        } else {
                          AppHelpers.showAlertDialog(
                            context: context,
                            child: HomeDeliveredOrderDialog(order: order),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
