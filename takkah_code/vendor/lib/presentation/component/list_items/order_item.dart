import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../infrastructure/models/data/order_data.dart';
import '../../styles/style.dart';
import '../helper/common_image.dart';
import '../buttons/buttons_bouncing_effect.dart';
import '../../../infrastructure/services/services.dart';

class OrderItem extends StatelessWidget {
  final OrderData order;
  final bool isHistoryOrder;
  final VoidCallback onTap;

  const OrderItem({
    Key? key,
    required this.order,
    required this.onTap,
    this.isHistoryOrder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonsBouncingEffect(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 134.h,
          width: double.infinity,
          margin: REdgeInsets.only(bottom: 10),
          padding: REdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Style.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CommonImage(
                          imageUrl: order.user?.img,
                          radius: 25,
                          width: 50,
                          height: 50,
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${order.user?.firstname ?? AppHelpers.trans(TrKeys.noName)} ${order.user?.lastname ?? ''}',
                                style: Style.interRegular(
                                  size: 14.sp,
                                  color: Style.blackColor,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                '${toBeginningOfSentenceCase(order.deliveryType?.type ?? '')}',
                                style: Style.interNormal(
                                  size: 12.sp,
                                  color: Style.blackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (AppHelpers.getOrderStatus(order.status) ==
                      OrderStatus.newOrder)
                    Container(
                      width: 10.r,
                      height: 10.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Style.redColor,
                      ),
                    ),
                  if (isHistoryOrder)
                    Text(order.transaction?.paymentSystem?.payment?.tag ?? '')
                ],
              ),
              Divider(color: Style.greyColor, thickness: 1.r, height: 1.r),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '№ ${order.id}',
                      style: Style.interNormal(
                        color: Style.blackColor,
                        size: 14.sp,
                        letterSpacing: -0.3,
                      ),
                      children: [
                        TextSpan(
                          text: ' | ',
                          style: Style.interNormal(
                            color: Style.borderColor,
                            size: 14.sp,
                            letterSpacing: -0.3,
                          ),
                        ),
                        TextSpan(
                          text: '${order.deliveryDate}'.substring(0, 11),
                          style: Style.interNormal(
                            color: Style.blackColor,
                            size: 14.sp,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                            symbol: LocalStorage.instance
                                .getSelectedCurrency()
                                ?.symbol)
                        .format(order.price ?? 0),
                    style:
                        Style.interNormal(size: 14.sp, color: Style.blackColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
