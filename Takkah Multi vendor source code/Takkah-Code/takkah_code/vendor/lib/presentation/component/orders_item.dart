import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'driver_avatar.dart';
import '../styles/style.dart';
import '../../infrastructure/services/tr_keys.dart';
import '../../infrastructure/services/app_helpers.dart';
import '../../infrastructure/services/app_constants.dart';

class OrdersItem extends StatelessWidget {
  final String profileAvatar;
  final String name;
  final String number;
  final String time;
  final String price;
  final String paymentType;
  final OrderStatus status;
  final VoidCallback onTap;

  const OrdersItem({
    Key? key,
    required this.profileAvatar,
    required this.name,
    required this.number,
    required this.time,
    required this.price,
    required this.status,
    required this.onTap,
    this.paymentType = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 132.h,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DriverAvatar(
                  imageUrl: profileAvatar,
                  name: name,
                  desc: AppHelpers.trans(TrKeys.delivery),
                ),
                Row(
                  children: [
                    Text(
                      paymentType,
                      style: Style.interSemi(size: 12.sp, letterSpacing: -0.3),
                    ),
                    status == OrderStatus.delivered
                        ? const SizedBox.shrink()
                        : status == OrderStatus.canceled
                            ? Container(
                                width: 10.r,
                                height: 10.r,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 6.h),
                                decoration: BoxDecoration(
                                  color: Style.greyColor,
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FlutterRemix.time_fill,
                                      size: 16.r,
                                    ),
                                    4.horizontalSpace,
                                    Text(
                                      "41:00",
                                      style: Style.interSemi(
                                          size: 14.sp, color: Style.blackColor),
                                    )
                                  ],
                                ),
                              ),
                  ],
                )
              ],
            ),
            const Divider(color: Style.greyColor),
            IntrinsicHeight(
              child: Row(
                children: [
                  Text(
                    number,
                    style:
                        Style.interNormal(size: 14.sp, color: Style.blackColor),
                  ),
                  const VerticalDivider(color: Style.greyColor),
                  Text(
                    time,
                    style:
                        Style.interNormal(size: 14.sp, color: Style.blackColor),
                  ),
                  const Spacer(),
                  Text(
                    "\$$price",
                    style:
                        Style.interNormal(size: 14.sp, color: Style.blackColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
