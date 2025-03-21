import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';
import '../../../../../styles/style.dart';
import '../../../../../../infrastructure/services/services.dart';

class FoodPriceWidget extends StatelessWidget {
  final ProductModel product;

  const FoodPriceWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isOutOfStock = product.quantity == null ||
        (product.quantity ?? 0) < (product.minQty ?? 0);
    final bool hasDiscount = isOutOfStock
        ? false
        : (product.discount != null && (product.discount ?? 0) > 0);
    return isOutOfStock
        ? Text(
            AppHelpers.trans(TrKeys.outOfStock),
            style: Style.interSemi(
              size: 11.sp,
              color: Style.redColor,
              letterSpacing: -0.3,
            ),
          )
        : (hasDiscount
            ? Row(
                children: [
                  Text(
                    NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency()?.symbol,
                    ).format(
                      (product.price ?? 0) + (product.tax ?? 0),
                    ),
                    style: Style.interSemi(
                      size: 14.sp,
                      color: Style.blackColor,
                      letterSpacing: -0.3,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  10.horizontalSpace,
                  Container(
                    padding: REdgeInsets.only(
                      top: 4,
                      bottom: 4,
                      left: 4,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Style.bgColor,
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          width: 20.r,
                          height: 20.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Style.redColor,
                          ),
                          child: Icon(
                            FlutterRemix.percent_fill,
                            size: 12.r,
                            color: Style.white,
                          ),
                        ),
                        8.horizontalSpace,
                        Text(
                          NumberFormat.currency(
                            symbol: LocalStorage.instance
                                .getSelectedCurrency()
                                ?.symbol,
                          ).format(product.price ?? 0),
                          style: Style.interSemi(
                            size: 14.sp,
                            color: Style.blackColor,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Text(
                NumberFormat.currency(
                  symbol: LocalStorage.instance.getSelectedCurrency()?.symbol,
                ).format(product.price ?? 0),
                style: Style.interSemi(
                  size: 14.sp,
                  color: Style.blackColor,
                  letterSpacing: -0.3,
                ),
              ));
  }
}
