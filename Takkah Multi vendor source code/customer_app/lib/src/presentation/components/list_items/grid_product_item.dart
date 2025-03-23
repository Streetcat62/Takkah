import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/data/local_cart.dart';
import '../buttons/animated_button_effect.dart';
import '../common_image.dart';
import '../../theme/theme.dart';
import '../../../models/models.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';
import '../../../core/routes/app_router.gr.dart';

class GridProductItem extends StatelessWidget {
  final ProductData product;
  final VoidCallback onLikePressed;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback updateState;
  final int? shopId;

  const GridProductItem({
    Key? key,
    required this.product,
    required this.onLikePressed,
    required this.onIncrease,
    required this.onDecrease,
    required this.updateState,
    this.shopId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
        margin: EdgeInsets.all(4.r),
        decoration: BoxDecoration(
            color: AppColors.mainAppbarBack(),
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: InkWell(
          onTap: () async {
            await context.pushRoute(ProductRoute(shopId: shopId, product: product));
            updateState();
          },
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CommonImage(
                      imageUrl: product.product?.img,
                      height: 100,
                      width: double.infinity,
                      radius: 10,
                    ),
                    if (product.discount != null && product.discount != 0)
                    Text(
                      '- ${(((product.discount ?? 0) / (product.price ?? 1)) * 100).toStringAsFixed(1)}%',
                      style: AppStyle.interNoSemi(
                        size: 12.sp,
                        color: AppColors.red,
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                Text(
                  product.product?.translation?.title ?? "",
                  style: AppStyle.interNoSemi(
                    size: 14.sp,
                    color: isDarkMode ? AppColors.white : AppColors.lightBlack,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         product.product?.translation?.title ?? "",
                //         style: GoogleFonts.inter(
                //           fontSize: 14.sp,
                //           color: AppColors.iconAndTextColor(),
                //         ),
                //         maxLines: 3,
                //       ),
                //     ),
                //     const Spacer(),
                //
                //         AnimationButtonEffect(
                //       child: InkWell(
                //         onTap: () {
                //           /*AppHelpers.showCustomModalBottomSheet(
                //           paddingTop: MediaQuery.of(context).padding.top,
                //           context: context,
                //           modal: BonusScreen(
                //             bonus: product?.stocks?.first.bonus,
                //           ),
                //           isDarkMode: false,
                //           isDrag: true,
                //           radius: 12,
                //         );*/
                //         },
                //         child: Container(
                //           width: 22.w,
                //           height: 22.h,
                //           margin: EdgeInsets.only(
                //               top: 8.r, left: 8.r, right: 4.r, bottom: 4.r),
                //           decoration: const BoxDecoration(
                //               shape: BoxShape.circle, color: AppColors.blueBonus),
                //           child: Icon(
                //               FlutterRemix.gift_2_fill,
                //               size: 16.r,
                //               color: AppColors.white
                //           ),
                //         ),
                //       ),
                //     )
                //
                //   ],
                // ),
                ((product.quantity ?? 0) >= (product.minQty ?? 0))
                    ? ((LocalStorage.instance
                    .getProductQuantity()
                    .firstWhere(
                        (element) =>
                    element.productId ==
                        product.id, orElse: () {
                  return LocalCart(productId: 0, quantity: 0);
                })
                    .quantity) > 0)
                    ? Text(NumberFormat.currency(
                  symbol: LocalStorage.instance
                      .getSelectedCurrency()
                      ?.symbol,
                ).format(
                    ((product.price ?? 0) - (product.discount ?? 0))),
                  style: AppStyle.interNoSemi(
                    size: 16.sp,
                      color: isDarkMode ? AppColors.white : AppColors.lightBlack,
                    decoration: TextDecoration.none
                  ),
                )
                    : Text(
                  product.product?.translation?.description ?? "",
                  style: AppStyle.interNoSemi(
                      size: 12.sp,
                    color: isDarkMode ? AppColors.white : AppColors.lightBlack,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
                    : const SizedBox.shrink(),
                8.verticalSpace,
                ((product.quantity ?? 0) >= (product.minQty ?? 0))
                    ? (LocalStorage.instance
                    .getProductQuantity()
                    .firstWhere(
                (element) =>
                element.productId ==
                product.id, orElse: () {
                return LocalCart(productId: 0, quantity: 0);
                })
                    .quantity > 0)
                    ? Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          onDecrease();
                          Vibrate.feedback(FeedbackType.selection);
                        },
                        child: AnimationButtonEffect(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.r,
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.bgGrey,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Center(
                              child: Text(
                                "-",
                                style: AppStyle.interNoSemi(
                                    size: 16.sp,
                                    color: AppColors.lightBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    12.horizontalSpace,
                    Text(
                      '${LocalStorage.instance
                          .getProductQuantity()
                          .firstWhere(
                              (element) =>
                          element.productId ==
                              product.id, orElse: () {
                        return LocalCart(productId: 0, quantity: 0);
                      })
                          .quantity}',
                      style: AppStyle.interNoSemi(
                        size: 16.sp,
                        color: isDarkMode ? AppColors.white : AppColors.lightBlack,
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          onIncrease();
                          Vibrate.feedback(FeedbackType.selection);
                        },
                        child: AnimationButtonEffect(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.r,
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.bgGrey,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "+",
                                    style: AppStyle.interNoSemi(
                                      size: 16.sp,
                                      color: AppColors.lightBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
                    : InkWell(
                     onTap: (){
                    if (LocalStorage.instance.getToken().isEmpty) {
                      context.router.popUntilRoot();
                      context.replaceRoute(const LoginRoute());
                      AppHelpers.showCheckFlash(
                        context,
                        AppHelpers.getTranslation(
                            TrKeys.youNeedToLoginFirst),
                      );
                      return;
                    }
                    Vibrate.feedback(FeedbackType.selection);
                    onIncrease();
                  },
                  child: AnimationButtonEffect(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 14.r, horizontal: 8.r),
                      decoration: BoxDecoration(
                          color: AppColors.bgGrey,
                          borderRadius: BorderRadius.circular(16.r)),
                      child:  Center(
                        child: Text(NumberFormat.currency(
                          symbol: LocalStorage.instance
                              .getSelectedCurrency()
                              ?.symbol,
                        ).format((product.price ?? 0) - (product.discount ?? 0)),
                          style: AppStyle.interNoSemi(
                            size: 16.sp,
                            color: AppColors.lightBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                : AnimationButtonEffect(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 14.r, horizontal: 8.r),
                    decoration: BoxDecoration(
                        color: AppColors.bgGrey,
                        borderRadius: BorderRadius.circular(16.r)),
                    child:  Center(
                      child: Text(
                        AppHelpers.getTranslation(TrKeys.outOfStock),
                        style: AppStyle.interNoSemi(
                          letterSpacing: -0.4,
                          size: 14.sp,
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
