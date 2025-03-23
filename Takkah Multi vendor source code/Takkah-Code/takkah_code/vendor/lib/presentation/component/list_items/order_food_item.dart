import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';
import '../../styles/style.dart';
import '../../component/components.dart';
import '../../../infrastructure/services/services.dart';

class OrderFoodItem extends StatelessWidget {
  final ProductModel product;
  final Function() onTap;
  final int index;
  final int spacing;

  const OrderFoodItem({
    Key? key,
    required this.product,
    required this.onTap,
    this.spacing = 1,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isOutOfStock = product.quantity == null || product.quantity == 0;
    final bool hasDiscount = isOutOfStock
        ? false
        : (product.discount != null && (product.discount ?? 0) > 0);
    return ButtonsBouncingEffect(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Style.white,
          margin: EdgeInsets.only(bottom: spacing.r),
          padding: REdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Consumer(builder: (context, ref, child) {
                    if ((product.cartCount ?? 0) > 0) {
                      return Container(
                        width: 50.r,
                        height: 78.r,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16.r),
                            bottomRight: Radius.circular(16.r),
                          ),
                          color: Style.primaryColor,
                        ),
                        child: Text(
                          '${product.cartCount}x',
                          style: Style.interSemi(size: 15.sp),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
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
                        isOutOfStock
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
                                          symbol: LocalStorage.instance
                                              .getSelectedCurrency()
                                              ?.symbol,
                                        ).format(
                                          (product.price ?? 0) +
                                              (product.tax ?? 0),
                                        ),
                                        style: Style.interSemi(
                                          size: 14.sp,
                                          color: Style.blackColor,
                                          letterSpacing: -0.3,
                                          decoration:
                                              TextDecoration.lineThrough,
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
                                          borderRadius:
                                              BorderRadius.circular(30.r),
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
                                      symbol: LocalStorage.instance
                                          .getSelectedCurrency()
                                          ?.symbol,
                                    ).format(product.price ?? 0),
                                    style: Style.interSemi(
                                      size: 14.sp,
                                      color: Style.blackColor,
                                      letterSpacing: -0.3,
                                    ),
                                  )),
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
              8.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
