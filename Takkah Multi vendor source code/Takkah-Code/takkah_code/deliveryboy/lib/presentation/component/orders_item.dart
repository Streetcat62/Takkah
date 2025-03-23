import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common_image.dart';
import '../styles/style.dart';
import '../pages/orders/widgets/order_detail_modal.dart';
import '../../infrastructure/models/models.dart';
import '../../infrastructure/services/services.dart';

class OrdersItem extends StatelessWidget {
  final OrderDetailData order;
  final bool isOrder;
  final bool isActiveButton;

  const OrdersItem({
    Key? key,
    required this.order,
    required this.isOrder,
    this.isActiveButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppHelpers.showCustomModalBottomSheet(
        paddingTop: MediaQuery.of(context).padding.top,
        context: context,
        radius: 12,
        modal: OrderDetailModal(
          isOrder: isOrder,
          order: order,
          isActiveButton: isActiveButton,
        ),
        isDarkMode: true,
      ),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Style.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonImage(
                        imageUrl: order.shop?.logoImg,
                        width: 32,
                        height: 32,
                        radius: 16,
                      ),
                      16.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.shop?.translation?.title ?? '',
                            style: Style.interSemi(
                              size: 14.sp,
                              letterSpacing: -0.3,
                            ),
                          ),
                          2.verticalSpace,
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Text(
                                  '№ ${order.id}',
                                  style: Style.interNormal(
                                      size: 14.sp, letterSpacing: -0.3),
                                ),
                                const VerticalDivider(),
                                Text(
                                  intl.DateFormat("MMM dd hh:mm").format(
                                      DateTime.parse(order.updatedAt ??
                                          DateTime.now().toString())),
                                  style: Style.interNormal(
                                      size: 14.sp, letterSpacing: -0.3),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: const BoxDecoration(
                          color: Style.greyColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(FlutterRemix.bank_card_2_line),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14.w),
                    child: Column(
                      children: [
                        Container(
                          width: 4.r,
                          height: 4.r,
                          margin: EdgeInsets.only(bottom: 6.h, top: 2.h),
                          decoration: const BoxDecoration(
                            color: Style.tabBarBorderColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 4.r,
                          height: 4.r,
                          margin: EdgeInsets.only(bottom: 6.h),
                          decoration: const BoxDecoration(
                            color: Style.tabBarBorderColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 32.r,
                        width: 32.r,
                        decoration: const BoxDecoration(
                          color: Style.white,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: CommonImage(imageUrl: order.user?.img),
                        ),
                      ),
                      12.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 120.w,
                            child: Text(
                              order.address?.address ?? '',
                              style: Style.interSemi(
                                size: 14.sp,
                                letterSpacing: -0.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          2.verticalSpace,
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Text(
                                  order.user?.firstname ?? '',
                                  style: Style.interNormal(
                                    size: 14.sp,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                const VerticalDivider(),
                                Text(
                                  order.user?.phone ?? '',
                                  style: Style.interNormal(
                                    size: 14.sp,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            16.verticalSpace,
            const Divider(color: Style.shimmerBase),
            8.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Icon(
                    FlutterRemix.money_dollar_box_fill,
                    size: 20.sp,
                  ),
                  10.horizontalSpace,
                  Text(
                    intl.NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency()!.symbol,
                    ).format(order.price ?? 0),
                    style: Style.interSemi(size: 14.sp),
                  ),
                  const Spacer(),
                  Icon(
                    FlutterRemix.takeaway_fill,
                    size: 18.sp,
                  ),
                  10.horizontalSpace,
                  Text(
                    intl.NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency()!.symbol,
                    ).format(order.deliveryFee ?? 0),
                    style: Style.interSemi(size: 14.sp),
                  ),
                  const Spacer(),
                  Container(
                    width: 36.r,
                    height: 36.r,
                    decoration: const BoxDecoration(
                      color: Style.greyColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(FlutterRemix.arrow_right_s_line),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
