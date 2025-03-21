import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_status_item.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';

class OrderStatusWidget extends StatelessWidget {
  final String? status;

  const OrderStatusWidget({Key? key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: status == 'canceled'
          ? OrderStatusItem(
              status: OrderItemWidgetStatus.canceled,
              text: AppHelpers.getTranslation(TrKeys.canceled),
              iconData: FlutterRemix.close_line,
            )
          : Stack(
              children: [
                Positioned(
                  top: 26,
                  left: 16.r,
                  child: SizedBox(
                    width: 4.r,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 30,
                      itemBuilder: (context, index) => Padding(
                        padding: REdgeInsets.only(bottom: 5),
                        child: const SmallDot(),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    OrderStatusItem(
                      status: AppHelpers.getWidgetStatuses(status)[0],
                      text: AppHelpers.getTranslation(TrKeys.newKey),
                      iconData: FlutterRemix.notification_fill,
                    ),
                    OrderStatusItem(
                      status: AppHelpers.getWidgetStatuses(status)[1],
                      text: AppHelpers.getTranslation(TrKeys.accepted),
                      iconData: FlutterRemix.shield_check_fill,
                    ),
                    OrderStatusItem(
                      status: AppHelpers.getWidgetStatuses(status)[2],
                      text: AppHelpers.getTranslation(TrKeys.ready),
                      iconData: FlutterRemix.time_fill,
                    ),
                    OrderStatusItem(
                      status: AppHelpers.getWidgetStatuses(status)[3],
                      text: AppHelpers.getTranslation(TrKeys.onAWay),
                      iconData: FlutterRemix.truck_fill,
                    ),
                    OrderStatusItem(
                      status: AppHelpers.getWidgetStatuses(status)[4],
                      text: AppHelpers.getTranslation(TrKeys.delivered),
                      iconData: FlutterRemix.star_smile_fill,
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
