
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';
import '../../riverpod/provider/cart_provider.dart';
import '../riverpod/provider/coupon_provider.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../riverpod/provider/checkout_cart_provider.dart';
import '../../../../../../../core/constants/constants.dart';

class VerifyBody extends StatelessWidget {
  final int? shopId;

  const VerifyBody({Key? key, this.shopId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mainAppbarBack(),
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainInputField(
              title: AppHelpers.getTranslation(TrKeys.comment),
              onChange: (value) {},
            ),
            22.verticalSpace,
            Consumer(
              builder: (context, ref, child) {
                final couponState = ref.watch(couponProvider);
                final couponNotifier = ref.read(couponProvider.notifier);
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: MainInputField(
                        title: AppHelpers.getTranslation(TrKeys.coupon),
                        onChange: couponNotifier.setCoupon,
                        descriptionText:
                            (couponState.isSuccess || couponState.isError)
                                ? (couponState.isSuccess
                                    ? AppHelpers.getTranslation(
                                        TrKeys.couponApplies)
                                    : AppHelpers.getTranslation(
                                        TrKeys.invalidCoupon))
                                : null,
                        isError: couponState.isError,
                        isSuccess: couponState.isSuccess,
                        readOnly: couponState.isSuccess,
                      ),
                    ),
                    12.horizontalSpace,
                    CommonMaterialButton(
                      onTap: () => couponNotifier.checkCoupon(shopId: shopId),
                      isLoading: couponState.isLoading,
                    ),
                  ],
                );
              },
            ),
            34.verticalSpace,
            Text(
              AppHelpers.getTranslation(TrKeys.yourOrder),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: AppColors.secondaryIconTextColor(),
                letterSpacing: -0.4,
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(checkoutCartProvider);
                final stateProduct = ref.watch(cartProvider);
                return state.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3.r,
                          color: AppColors.green,
                        ),
                      )
                    : Column(
                        children: [
                          CartTotalProductItem(
                            product: stateProduct.cartData?.userCarts?.first,
                          ),
                          const CustomSeparator(),
                          28.verticalSpace,
                          PriceWithTypeWidget(
                            type: AppHelpers.getTranslation(
                                TrKeys.totalProductPrice),
                            price: state.calculateData?.productTotal,
                          ),
                          28.verticalSpace,
                          const CustomSeparator(),
                          28.verticalSpace,
                          PriceWithTypeWidget(
                            type: AppHelpers.getTranslation(TrKeys.discount),
                            price: state.calculateData?.totalDiscount,
                          ),
                          20.verticalSpace,
                          PriceWithTypeWidget(
                            type: AppHelpers.getTranslation(TrKeys.delivery),
                            price: state.deliveryFee,
                          ),
                          20.verticalSpace,
                          PriceWithTypeWidget(
                            type: AppHelpers.getTranslation(TrKeys.vatTax),
                            price: state.calculateData?.productTax,
                          ),
                          20.verticalSpace,
                          PriceWithTypeWidget(
                            type: AppHelpers.getTranslation(TrKeys.shopTax),
                            price: state.calculateData?.orderTax,
                          ),
                          20.verticalSpace,
                          PriceWithTypeWidget(
                            type: AppHelpers.getTranslation(TrKeys.coupon),
                            price: state.couponPrice,
                          ),
                          34.verticalSpace,
                          Divider(
                            thickness: 1.r,
                            height: 1.r,
                            color: AppColors.iconAndTextColor(),
                          ),
                          10.verticalSpace,
                          Divider(
                            thickness: 1.r,
                            height: 1.r,
                            color: AppColors.iconAndTextColor(),
                          ),
                          23.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppHelpers.getTranslation(TrKeys.totalAmount),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: AppColors.iconAndTextColor(),
                                  letterSpacing: -0.3,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                  symbol: LocalStorage.instance
                                      .getSelectedCurrency()
                                      ?.symbol,
                                ).format(
                                    (state.calculateData?.orderTotal ?? 0) -
                                        state.couponPrice +
                                        state.deliveryFee),
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp,
                                  color: AppColors.iconAndTextColor(),
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ],
                          ),
                          140.verticalSpace,
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
