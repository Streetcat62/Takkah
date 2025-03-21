import 'dart:io';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';
import '../../../../styles/style.dart';
import 'widgets/food_price_widget.dart';
import '../../../../component/components.dart';
import '../../../../../application/providers.dart';
import '../../../../../infrastructure/services/services.dart';

class FoodDetailsModal extends ConsumerStatefulWidget {
  final ProductModel product;

  const FoodDetailsModal({Key? key, required this.product}) : super(key: key);

  @override
  ConsumerState<FoodDetailsModal> createState() => _FoodDetailsModalState();
}

class _FoodDetailsModalState extends ConsumerState<FoodDetailsModal> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(productsProvider.notifier).setProductDetails(
              product: widget.product,
              productStocks: ref.watch(orderCartProvider).products,
            );
        ref.read(orderCartProvider.notifier).refreshStockCart();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Consumer(
          builder: (context, ref, child) {
            final event = ref.read(productsProvider.notifier);
            final cartEvent = ref.read(orderCartProvider.notifier);
            final cartState = ref.watch(orderCartProvider);
            final productsEvent = ref.read(orderProductsProvider.notifier);
            return Column(
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ModalDrag(),
                      CommonImage(
                        imageUrl: widget.product.product?.img,
                        radius: 16,
                        errorRadius: 16,
                        fit: BoxFit.fitWidth,
                        height: 212,
                        width: double.infinity,
                      ),
                      22.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${widget.product.product?.translation?.title}',
                              style: Style.interNormal(
                                size: 14.sp,
                                color: Style.blackColor,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                          FoodPriceWidget(
                            product: widget.product,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Style.white,
                  padding: REdgeInsets.only(
                    bottom: Platform.isIOS ? 40 : 20,
                    top: 20,
                  ),
                  child: cartState.cartCount > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 56.w,
                              height: 50.r,
                              decoration: BoxDecoration(
                                color: Style.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16.r),
                                  bottomRight: Radius.circular(16.r),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${cartState.cartCount}x',
                                style: Style.interSemi(
                                  size: 15.sp,
                                  color: Style.blackColor,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                ButtonsBouncingEffect(
                                  child: GestureDetector(
                                    onTap: () {
                                      Vibrate.feedback(FeedbackType.selection);
                                      event.decreaseStockCount(
                                        updateCart: (count) =>
                                            cartEvent.addStockToCart(
                                                count: count,
                                                product: widget.product,
                                                updateProducts: (stocs) =>
                                                    productsEvent
                                                        .updateProducts(
                                                            productStocks:
                                                                stocs)),
                                      );
                                    },
                                    child: Container(
                                      height: 50.r,
                                      width: 100.r,
                                      decoration: BoxDecoration(
                                        color: Style.discountColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.r),
                                          bottomLeft: Radius.circular(16.r),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        FlutterRemix.subtract_line,
                                        size: 24.r,
                                        color: Style.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                                1.horizontalSpace,
                                ButtonsBouncingEffect(
                                  child: GestureDetector(
                                    onTap: () {
                                      Vibrate.feedback(FeedbackType.selection);
                                      event.increaseStockCount(
                                        updateCart: (count) =>
                                            cartEvent.addStockToCart(
                                          count: count,
                                          product: widget.product,
                                          updateProducts: (stocs) =>
                                              productsEvent.updateProducts(
                                                  productStocks: stocs),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 50.r,
                                      width: 100.r,
                                      decoration: BoxDecoration(
                                        color: Style.addCountColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(16.r),
                                          bottomRight: Radius.circular(16.r),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Icon(
                                        FlutterRemix.add_line,
                                        size: 24.r,
                                        color: Style.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            36.horizontalSpace,
                          ],
                        )
                      : Padding(
                          padding: REdgeInsets.symmetric(horizontal: 16),
                          child: CustomButton(
                              title: AppHelpers.trans(TrKeys.toBuy),
                              onPressed: () {
                                Vibrate.feedback(FeedbackType.selection);
                                event.increaseStockCount(
                                  updateCart: (count) =>
                                      cartEvent.addStockToCart(
                                          count: count,
                                          product: widget.product,
                                          updateProducts: (stocs) =>
                                              productsEvent.updateProducts(
                                                  productStocks: stocs)),
                                );
                              }),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
