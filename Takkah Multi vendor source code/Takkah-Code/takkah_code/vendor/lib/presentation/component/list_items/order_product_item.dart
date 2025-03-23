import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/presentation/component/helper/common_image.dart';
import '../../../infrastructure/models/data/order_data.dart';
import '../../styles/style.dart';
import '../loading/text_loading.dart';
import '../../../infrastructure/services/services.dart';

class OrderProductItem extends StatelessWidget {
  final Detail orderDetail;
  final bool isLast;
  final bool isLoading;
  final Function() onToggle;

  const OrderProductItem({
    Key? key,
    required this.orderDetail,
    required this.isLoading,
    required this.onToggle,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    num totalPrice = 0;
    totalPrice = ((orderDetail.totalPrice)! *
        (num.tryParse(orderDetail.quantity ?? '') ?? 0));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CommonImage(
                  imageUrl: orderDetail.shopProduct?.product?.img,
                  height: 50,
                  width: 50,
                ),
                14.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isLoading
                        ? const TextLoading(width: 200)
                        : SizedBox(
                            width: MediaQuery.of(context).size.width - 190.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderDetail.shopProduct?.product?.translation
                                          ?.title ??
                                      AppHelpers.trans(TrKeys.noName),
                                  style: Style.interSemi(
                                      size: 14.sp, color: Style.blackColor),
                                ),
                                4.verticalSpace,
                                Text(
                                  "${orderDetail.shopProduct?.product?.translation?.title} x ${orderDetail.quantity}  ${orderDetail.totalPrice}",
                                  style: Style.interSemi(
                                      size: 12.sp, color: Style.blackColor),
                                )
                              ],
                            ),
                          ),
                    4.verticalSpace,
                    isLoading
                        ? const TextLoading(width: 150)
                        : Text(
                            '${AppHelpers.trans(TrKeys.amount)} — ${orderDetail.quantity} x ${NumberFormat.currency(symbol: LocalStorage.instance.getSelectedCurrency()?.symbol).format(orderDetail.totalPrice ?? 0)}',
                            style: Style.interRegular(
                              size: 14.sp,
                              color: Style.blackColor,
                            ),
                          ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 64.w,
              child: Text(
                NumberFormat.currency(
                  symbol: LocalStorage.instance.getSelectedCurrency()?.symbol,
                ).format(totalPrice),
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: Style.interSemi(size: 13.sp, color: Style.blackColor),
              ),
            ),
          ],
        ),
        16.verticalSpace,
        if (!isLast)
          Divider(thickness: 1.r, height: 1.r, color: Style.greyColor),
      ],
    );
  }
}
