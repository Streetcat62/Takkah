import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/payment_item.dart';
import '../../../../../styles/style.dart';
import '../../order/widgets/title_price.dart';
import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class DeliveryTimePage extends ConsumerStatefulWidget {
  const DeliveryTimePage({Key? key}) : super(key: key);

  @override
  ConsumerState<DeliveryTimePage> createState() => _DeliveryTimePageState();
}

class _DeliveryTimePageState extends ConsumerState<DeliveryTimePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(orderPaymentProvider.notifier)
          ..fetchPayments()
          ..getCalculate(
            products: ref.watch(orderCartProvider).products,
            type: ref.watch(deliveryTypeProvider).type == DeliveryType.delivery
                ? 'delivery'
                : 'pickup',
            location: ref.watch(orderAddressProvider).location,
          )
          ..getDeliveryFee(location: ref.watch(orderAddressProvider).location);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Style.greyColor,
        body: Container(
          padding: MediaQuery.of(context).viewInsets,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).padding.bottom + 48.h,
            ),
            child: Column(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Style.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      padding: REdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 26,
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final timeState = ref.watch(deliveryTimeProvider);
                          final timeEvent =
                              ref.read(deliveryTimeProvider.notifier);
                          return Column(
                            children: [
                              TitleAndIcon(
                                title: AppHelpers.trans(TrKeys.deliveryTime),
                              ),
                              24.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppHelpers.trans(TrKeys.selectedTimeAndDay),
                                    style: Style.interSemi(
                                        size: 14.sp, letterSpacing: -0.3),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        AppHelpers.showCustomModalBottomSheet(
                                      paddingTop:
                                          MediaQuery.of(context).padding.top,
                                      context: context,
                                      radius: 12,
                                      modal: SelectDateModal(
                                        initialDate: timeState.deliveryDate,
                                        onDateSaved: (date) =>
                                            timeEvent.setDeliveryDate(
                                          date.toString().substring(0, 10),
                                        ),
                                      ),
                                      isDarkMode: true,
                                    ),
                                    child: Text(
                                      timeState.deliveryDate,
                                      style: Style.interNormal(
                                          size: 14.sp, letterSpacing: -0.3),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Style.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: REdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          TitleAndIcon(
                            title: AppHelpers.trans(TrKeys.payment),
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              final paymentState =
                                  ref.watch(orderPaymentProvider);
                              final paymentEvent =
                                  ref.watch(orderPaymentProvider.notifier);
                              return paymentState.isLoading
                                  ? Container(
                                      width: 30.r,
                                      height: 30.r,
                                      margin:
                                          REdgeInsets.symmetric(vertical: 20),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3.r,
                                          color: Style.primaryColor,
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: paymentState.payments.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          PaymentItem(
                                        payment: paymentState.payments[index],
                                        isSelected:
                                            paymentState.selectedIndex == index,
                                        isLast: paymentState.payments.length ==
                                            index + 1,
                                        onTap: () => paymentEvent
                                            .setSelectedIndex(index),
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Consumer(builder: (context, ref, child) {
                  final deliveryTypeState = ref.watch(deliveryTypeProvider);
                  final state = ref.watch(orderPaymentProvider);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Style.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: state.isCalculateLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 3.r,
                              color: Style.primaryColor,
                            ),
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: TitleAndIcon(
                                  title:
                                      "${AppHelpers.trans(TrKeys.payment)} - \$",
                                ),
                              ),
                              24.verticalSpace,
                              TitleAndPrice(
                                title: AppHelpers.trans(TrKeys.subtotal),
                                rightTitle: intl.NumberFormat.currency(
                                  symbol: LocalStorage.instance
                                      .getSelectedCurrency()
                                      ?.symbol,
                                ).format(
                                    state.orderCalculate?.productTotal ?? 0),
                                textStyle: Style.interRegular(
                                  size: 16,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              deliveryTypeState.type == DeliveryType.delivery
                                  ? 16.verticalSpace
                                  : 0.verticalSpace,
                              deliveryTypeState.type == DeliveryType.delivery
                                  ? TitleAndPrice(
                                      title: AppHelpers.trans(
                                          TrKeys.deliveryPrice),
                                      rightTitle: intl.NumberFormat.currency(
                                        symbol: LocalStorage.instance
                                            .getSelectedCurrency()
                                            ?.symbol,
                                      ).format(
                                          state.deliveryfee?.deliveryFee ?? 0),
                                      textStyle: Style.interRegular(
                                          size: 16, letterSpacing: -0.3),
                                    )
                                  : const SizedBox.shrink(),
                              16.verticalSpace,
                              TitleAndPrice(
                                title: AppHelpers.trans(TrKeys.totalTax),
                                rightTitle: intl.NumberFormat.currency(
                                  symbol: LocalStorage.instance
                                      .getSelectedCurrency()
                                      ?.symbol,
                                ).format(state.orderCalculate?.orderTax ?? 0),
                                textStyle: Style.interRegular(
                                    size: 16, letterSpacing: -0.3),
                              ),
                              16.verticalSpace,
                              const Divider(color: Style.shimmerBase),
                              16.verticalSpace,
                              TitleAndPrice(
                                title: AppHelpers.trans(TrKeys.total),
                                rightTitle: intl.NumberFormat.currency(
                                  symbol: LocalStorage.instance
                                      .getSelectedCurrency()
                                      ?.symbol,
                                ).format((state.orderCalculate?.orderTotal ??
                                        0) +
                                    (deliveryTypeState.type ==
                                            DeliveryType.delivery
                                        ? state.deliveryfee?.deliveryFee ?? 0
                                        : 0)),
                                textStyle: Style.interSemi(
                                    size: 20, letterSpacing: -0.3),
                              ),
                            ],
                          ),
                  );
                }),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: REdgeInsets.all(16),
          child: Row(
            children: [
              const PopButton(heroTag: AppConstants.heroTagAddOrderButton),
              8.horizontalSpace,
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final addressState = ref.watch(orderAddressProvider);
                    final paymentState = ref.watch(orderPaymentProvider);
                    final userState = ref.watch(orderUserProvider);
                    return CustomButton(
                      title: AppHelpers.trans(TrKeys.next),
                      isLoading: ref.watch(createOrderProvider).isCreating,
                      onPressed: () {
                        if (paymentState.payments[paymentState.selectedIndex]
                                .payment?.tag ==
                            'wallet') {
                          final num walletPrice =
                              userState.selectedUser?.wallet?.price ?? 0;
                          final num orderPrice =
                              paymentState.orderCalculate?.orderTotal ?? 0;
                          if (walletPrice < orderPrice) {
                            AppHelpers.showCheckTopSnackBar(
                              context,
                              type: SnackBarType.error,
                              text: AppHelpers.trans(TrKeys.notEnoughMoney),
                            );
                            return;
                          }
                        }
                        ref.read(createOrderProvider.notifier).createOrder(
                              addressId: addressState.selectedAddress?.id ?? 0,
                              deliveryType:
                                  ref.watch(deliveryTypeProvider).type,
                              user: userState.selectedUser,
                              stocks: ref.watch(orderCartProvider).products,
                              deliveryDate:
                                  ref.watch(deliveryTimeProvider).deliveryDate,
                              orderSuccess: (int orderId) {
                                context.router.popUntilRoot();
                                ref.read(orderCartProvider.notifier).clearAll();
                                ref
                                    .read(orderUserProvider.notifier)
                                    .clearSelectedUserInfo();
                                ref
                                    .read(newOrdersProvider.notifier)
                                    .fetchNewOrders(
                                      context: context,
                                      isRefresh: true,
                                      activeTabIndex:
                                          ref.watch(homeAppbarProvider).index,
                                    );
                                ref
                                    .read(orderPaymentProvider.notifier)
                                    .createTransaction(
                                        context,
                                        orderId,
                                        paymentState
                                            .payments[
                                                paymentState.selectedIndex]
                                            .id);
                              },
                              failed: (message) =>
                                  AppHelpers.showCheckTopSnackBar(
                                context,
                                text: message,
                                type: SnackBarType.error,
                              ),
                            );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
