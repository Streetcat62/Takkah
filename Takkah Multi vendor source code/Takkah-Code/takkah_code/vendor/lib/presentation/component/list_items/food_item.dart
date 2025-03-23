import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';

import '../../styles/style.dart';
import '../../component/components.dart';
import '../../../infrastructure/services/services.dart';

class FoodItem extends StatelessWidget {
  final ProductModel product;
  final Function() onTap;
  final int spacing;

  const FoodItem({
    Key? key,
    required this.product,
    required this.onTap,
    this.spacing = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isOutOfStock = product.quantity == null || product.quantity == 0;
    return Container(
      color: product.active == 0 ? Style.pending : Style.white,
      margin: EdgeInsets.only(bottom: spacing.r),
      padding: REdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.product?.translation?.title}',
                      style: Style.interNormal(
                        size: 14.sp,
                        color: Style.blackColor,
                        letterSpacing: -0.3,
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      NumberFormat.currency(
                        symbol:
                            LocalStorage.instance.getSelectedCurrency()?.symbol,
                      ).format(product.price ?? 0),
                      style: Style.interSemi(
                        size: 14.sp,
                        color: isOutOfStock ? Style.redColor : Style.blackColor,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              CommonImage(
                width: 110,
                height: 106,
                imageUrl: product.product?.img,
                radius: 0,
                errorRadius: 0,
                fit: BoxFit.fitWidth,
              ),
              16.horizontalSpace,
            ],
          ),
          20.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              thickness: 1.r,
              height: 1.r,
              color: Style.tabBarBorderColor,
            ),
          ),
          14.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: ButtonsBouncingEffect(
                    child: Row(
                      children: [
                        Text(
                          AppHelpers.trans(TrKeys.parameters),
                          style: Style.interNormal(size: 13.sp),
                        ),
                        6.horizontalSpace,
                        Icon(
                          FlutterRemix.arrow_down_s_line,
                          size: 18.r,
                          color: Style.blackColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30.r,
                  alignment: Alignment.center,
                  padding: REdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: product.active == 0
                        ? Style.pendingDark
                        : Style.primaryColor,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        product.active == 0
                            ? FlutterRemix.time_fill
                            : FlutterRemix.check_double_line,
                        size: 20.r,
                        color: Style.white,
                      ),
                      6.horizontalSpace,
                      Text(
                        product.active == 0
                            ? AppHelpers.trans(TrKeys.pending)
                            : AppHelpers.trans(TrKeys.published),
                        style: Style.interNormal(
                          size: 14.sp,
                          color: Style.white,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          8.verticalSpace,
        ],
      ),
    );
  }
}
