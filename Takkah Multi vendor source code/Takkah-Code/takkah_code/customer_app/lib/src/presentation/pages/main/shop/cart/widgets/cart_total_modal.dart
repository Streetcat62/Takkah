import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../riverpod/provider/cart_provider.dart';
import 'price_with_title_widget.dart';
import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../riverpod/provider/cart_total_provider.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';

class CartTotalModal extends ConsumerStatefulWidget {
  final int? cartId;
  final int? shopId;

  const CartTotalModal({Key? key, this.cartId, this.shopId}) : super(key: key);

  @override
  ConsumerState<CartTotalModal> createState() => _CartTotalModalState();
}

class _CartTotalModalState extends ConsumerState<CartTotalModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(cartTotalProvider.notifier)
          .fetchCartTotals(cartId: widget.cartId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.mainAppbarBack(),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            30.verticalSpace,
            Text(
              AppHelpers.getTranslation(TrKeys.cartSummary),
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                color: AppColors.iconAndTextColor(),
                letterSpacing: -1,
              ),
            ),
            18.verticalSpace,
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(cartTotalProvider);
                final stateProduct = ref.watch(cartProvider);
                return state.isLoading || state.calculateData == null
                    ? Padding(
                        padding: REdgeInsets.symmetric(vertical: 30),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3.r,
                            color: AppColors.green,
                          ),
                        ),
                      )
                    : Column(
                      children: [
                        if (state.calculateData != null)
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: stateProduct.cartData?.userCarts!.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CartTotalProductItem(
                                product:
                                stateProduct.cartData?.userCarts![index],
                              );
                            },
                          ),
                        18.verticalSpace,
                        const CustomSeparator(),
                        28.verticalSpace,
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppHelpers.getTranslation(
                                  TrKeys.totalProductPrice),
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
                              ).format(stateProduct.cartData?.totalPrice),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: AppColors.iconAndTextColor(),
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),
                        28.verticalSpace,
                        const CustomSeparator(),
                        28.verticalSpace,
                        PriceWithTitleWidget(
                          title:
                              AppHelpers.getTranslation(TrKeys.discount),
                          price: state.calculateData?.totalDiscount,
                        ),
                        28.verticalSpace,
                        PriceWithTitleWidget(
                          title:
                              AppHelpers.getTranslation(TrKeys.shopTax),
                          price: state.calculateData?.orderTax,
                        ),
                        28.verticalSpace,
                        PriceWithTitleWidget(
                          title: AppHelpers.getTranslation(TrKeys.vatTax),
                          price: state.calculateData?.productTax,
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
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppHelpers.getTranslation(TrKeys.total),
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
                              ).format(state.calculateData?.orderTotal),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.sp,
                                color: AppColors.iconAndTextColor(),
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),
                        36.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: CustomOutlinedButton(
                                title: AppHelpers.getTranslation(
                                    TrKeys.cancel),
                                onTap: context.popRoute,
                              ),
                            ),
                            24.horizontalSpace,
                            Expanded(
                              child: MainConfirmButton(
                                title: AppHelpers.getTranslation(
                                    TrKeys.orderNow),
                                onTap: () => context.pushRoute(
                                  CheckoutRoute(
                                    shopId: widget.shopId,
                                    cartId: widget.cartId,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
              },
            ),
            18.verticalSpace,
          ],
        ),
      ),
    );
  }
}
