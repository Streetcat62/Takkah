import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_dates_widget.dart';
import 'order_refund_modal.dart';
import 'order_status_widget.dart';
import 'order_deliveryman_widget.dart';
import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../riverpod/provider/new_orders_provider.dart';
import '../../../../../../core/constants/constants.dart';
import '../riverpod/provider/ready_orders_provider.dart';
import '../riverpod/provider/order_cancel_provider.dart';
import '../riverpod/provider/order_details_provider.dart';
import '../riverpod/provider/accepted_orders_provider.dart';
import '../riverpod/provider/on_a_way_orders_provider.dart';

class OrderDetailsModal extends ConsumerStatefulWidget {
  final int activeTabIndex;
  final int? orderId;

  const OrderDetailsModal({
    Key? key,
    required this.activeTabIndex,
    this.orderId,
  }) : super(key: key);

  @override
  ConsumerState<OrderDetailsModal> createState() => _OrderDetailsModalState();
}

class _OrderDetailsModalState extends ConsumerState<OrderDetailsModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(orderDetailsProvider.notifier)
            .fetchOrderDetails(orderId: widget.orderId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderDetailsProvider);
     num totalPPrice = (state.orderData?.price ?? 0)
         + (state.orderData?.totalDiscount ?? 0)
         - (state.orderData?.deliveryFee ?? 0)
         - (state.orderData?.tax ?? 0);
    return state.isLoading || state.orderData == null
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r),
              ),
              color: AppColors.mainAppbarBack(),
            ),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.r,
                color: AppColors.green,
              ),
            ),
          )
        : Column(
            children: [
              // const OrderDetailsHeader(),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                    topLeft: Radius.circular(30.r),
                  ),
                  child: Container(
                    color: AppColors.mainAppbarBack(),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Container(
                        color: AppColors.mainAppbarBack(),
                        child: Column(
                          children: [
                            if (state.orderData?.deliveryman != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  42.verticalSpace,
                                  OrderDeliverymanWidget(
                                    deliveryman: state.orderData?.deliveryman,
                                  ),
                                ],
                              ),
                            54.verticalSpace,
                            OrderDatesWidget(orderData: state.orderData),
                            34.verticalSpace,
                            OrderStatusWidget(status: state.orderData?.status),
                            48.verticalSpace,
                            Padding(
                              padding: REdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        FlutterRemix.map_pin_2_fill,
                                        size: 20.r,
                                        color:
                                            AppColors.secondaryIconTextColor(),
                                      ),
                                      16.horizontalSpace,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppHelpers.getTranslation(
                                                  TrKeys.deliveryAddress),
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: AppColors
                                                    .secondaryIconTextColor(),
                                                letterSpacing: -0.4,
                                              ),
                                            ),
                                            6.verticalSpace,
                                            Text(
                                              '${state.orderData?.shop?.translation?.address}',
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp,
                                                color: AppColors
                                                    .iconAndTextColor(),
                                                letterSpacing: -0.4,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  16.verticalSpace,
                                  Divider(
                                    thickness: 1.r,
                                    height: 1.r,
                                    color: AppColors.iconAndTextColor()
                                        .withOpacity(0.04),
                                  ),
                                  40.verticalSpace,
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          '${AppHelpers.getTranslation(TrKeys.products)} — ',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.sp,
                                        letterSpacing: -0.4,
                                        color: AppColors.iconAndTextColor(),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              '${state.orderData?.details?.length} ${AppHelpers.getTranslation(TrKeys.items)}',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.sp,
                                            letterSpacing: -0.4,
                                            color: AppColors.iconAndTextColor(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (state.orderData != null &&
                                      state.orderData?.details != null)
                                    ListView.builder(
                                      shrinkWrap: true,
                                      padding:
                                          REdgeInsets.symmetric(vertical: 25),
                                      itemCount:
                                          state.orderData?.details?.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return OrderProductItem(
                                          orderDetail:
                                              state.orderData?.details?[index],
                                        );
                                      },
                                    ),
                                  const CustomSeparator(),
                                  28.verticalSpace,
                                  PriceWithTypeWidget(
                                    type: AppHelpers.getTranslation(
                                        TrKeys.totalProductPrice),
                                    price: totalPPrice,
                                  ),
                                  28.verticalSpace,
                                  const CustomSeparator(),
                                  28.verticalSpace,
                                  PriceWithTypeWidget(
                                    type: AppHelpers.getTranslation(
                                        TrKeys.discount),
                                    price: state.orderData?.totalDiscount,
                                  ),
                                  20.verticalSpace,
                                  PriceWithTypeWidget(
                                    type: AppHelpers.getTranslation(
                                        TrKeys.delivery),
                                    price: state.orderData?.deliveryFee,
                                  ),
                                  20.verticalSpace,
                                  PriceWithTypeWidget(
                                    type: AppHelpers.getTranslation(
                                        TrKeys.vatTax),
                                    price: state.orderData?.tax,
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
                                  24.verticalSpace,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppHelpers.getTranslation(
                                            TrKeys.totalAmount),
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
                                        ).format(state.orderData?.price),
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24.sp,
                                          color: AppColors.iconAndTextColor(),
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            40.verticalSpace,
                            if (state.orderData?.status == 'new' ||
                                state.orderData?.status == 'accepted' ||
                                state.orderData?.status == 'ready' ||
                                (state.orderData?.status == 'delivered')
                            )

                              Padding(
                                padding: REdgeInsets.only(
                                    left: 90, right: 90, bottom: 40),
                                child: Consumer(
                                  builder: (context, ref, child) {
                                    return CustomOutlinedButton(
                                      title: state.orderData?.status == 'delivered' ? AppHelpers.getTranslation(
                                          TrKeys.refund) :AppHelpers.getTranslation(
                                          TrKeys.cancelOrder),
                                      onTap: () => state.orderData?.status == 'delivered' ?
                                      AppHelpers.showCustomModalBottomSheet(context: context,
                                          modal:  OrderRefundModal()) :
                                      ref
                                          .read(orderCancelProvider.notifier)
                                          .cancelOrder(
                                            orderId: widget.orderId,
                                            checkYourNetwork: () {
                                              AppHelpers.showCheckFlash(
                                                context,
                                               AppHelpers.getTranslation(TrKeys
                                                    .checkYourNetworkConnection),
                                              );
                                            },
                                            canceled: () {
                                              context.popRoute();
                                              switch (widget.activeTabIndex) {
                                                case 0:
                                                  ref
                                                      .read(newOrdersProvider
                                                          .notifier)
                                                      .updateNewOrders();
                                                  break;
                                                case 1:
                                                  ref
                                                      .read(
                                                          acceptedOrdersProvider
                                                              .notifier)
                                                      .updateAcceptedOrders(
                                                          context);
                                                  break;
                                                case 2:
                                                  ref
                                                      .read(readyOrdersProvider
                                                          .notifier)
                                                      .updateReadyOrders(
                                                          context);
                                                  break;
                                                case 3:
                                                  ref
                                                      .read(onAWayOrdersProvider
                                                          .notifier)
                                                      .updateOnAWayOrders(
                                                          context);
                                                  break;
                                              }
                                            },
                                          ),
                                      isLoading: ref
                                          .watch(orderCancelProvider)
                                          .isLoading,
                                      borderColor: AppColors.red,
                                      textColor: AppColors.red,
                                    );
                                  },
                                ),
                              ),
                            // 90.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
