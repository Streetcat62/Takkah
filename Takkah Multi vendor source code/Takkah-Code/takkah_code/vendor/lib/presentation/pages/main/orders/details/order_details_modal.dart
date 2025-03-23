import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../infrastructure/models/data/order_data.dart';
import '../../../../styles/style.dart';
import '../../../../component/components.dart';
import '../../../../../application/providers.dart';
import '../../../../../infrastructure/services/services.dart';

class OrderDetailsModal extends ConsumerStatefulWidget {
  final OrderData order;
  final bool isHistoryOrder;
  final RefreshController? newOrdersController;
  final RefreshController? acceptedOrdersController;
  final RefreshController? readyOrdersController;
  final RefreshController? onAWayOrdersController;

  const OrderDetailsModal({
    Key? key,
    required this.order,
    this.isHistoryOrder = false,
    this.newOrdersController,
    this.acceptedOrdersController,
    this.readyOrdersController,
    this.onAWayOrdersController,
  }) : super(key: key);

  @override
  ConsumerState<OrderDetailsModal> createState() => _OrderDetailsModalState();
}

class _OrderDetailsModalState extends ConsumerState<OrderDetailsModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(orderDetailsProvider.notifier)
          .fetchOrderDetails(order: widget.order),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(orderDetailsProvider);
              final appbarState = ref.watch(homeAppbarProvider);
              final event = ref.read(orderDetailsProvider.notifier);
              final appbarEvent = ref.read(homeAppbarProvider.notifier);
              return Column(
                children: [
                  const ModalDrag(),
                  Container(
                    decoration: BoxDecoration(
                      color: Style.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding:
                        REdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              CommonImage(
                                imageUrl: widget.order.user?.img,
                                radius: 25,
                                width: 50,
                                height: 50,
                              ),
                              12.horizontalSpace,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.order.user?.firstname ?? AppHelpers.trans(TrKeys.noName)} ${widget.order.user?.lastname ?? ''}',
                                      style: Style.interRegular(
                                        size: 14.sp,
                                        color: Style.blackColor,
                                      ),
                                    ),
                                    4.verticalSpace,
                                    Text(
                                      widget.isHistoryOrder
                                          ? widget
                                                  .order
                                                  .transaction
                                                  ?.paymentSystem
                                                  ?.payment
                                                  ?.tag ??
                                              ''
                                          : '${AppHelpers.trans(TrKeys.order)} - №${widget.order.id}',
                                      style: Style.interNormal(
                                        size: 12.sp,
                                        color: Style.blackColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        6.horizontalSpace,
                        Icon(
                          FlutterRemix.bank_card_2_line,
                          size: 20.r,
                          color: Style.blackColor,
                        ),
                        6.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.order?.transaction?.paymentSystem?.payment
                                      ?.tag ??
                                  AppHelpers.trans(TrKeys.noTransaction),
                              style: Style.interNormal(
                                size: 12,
                                color: Style.blackColor,
                              ),
                            ),
                            4.verticalSpace,
                            Text(
                              NumberFormat.currency(
                                symbol: LocalStorage.instance
                                    .getSelectedCurrency()
                                    ?.symbol,
                              ).format(widget.order.price ?? 0),
                              style: Style.interSemi(
                                size: 14,
                                color: Style.blackColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  if (widget.isHistoryOrder)
                    Container(
                      margin: EdgeInsets.only(top: 8.h),
                      decoration: BoxDecoration(
                        color: Style.transparent,
                        border: Border.all(color: Style.white),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: REdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppHelpers.trans(TrKeys.order)} - №${widget.order.id}',
                            style: Style.interNormal(
                              size: 14.sp,
                              color: Style.blackColor,
                              letterSpacing: -0.3,
                            ),
                          ),
                          Text(
                            '${DateFormat('hh:mm, EE').format(DateTime.parse('${widget.order.createdAt}'))} — ${DateFormat('hh:mm, EE').format(DateTime.parse('${widget.order.updatedAt}'))}',
                            style: Style.interNormal(
                              size: 14.sp,
                              color: Style.blackColor,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (widget.isHistoryOrder)
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Style.transparent,
                              border: Border.all(color: Style.white),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: REdgeInsets.all(8.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Style.blackColor,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(12.r),
                                  child: Center(
                                    child: Icon(
                                      FlutterRemix.wallet_3_fill,
                                      color: Style.white,
                                      size: 18.r,
                                    ),
                                  ),
                                ),
                                12.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppHelpers.trans(TrKeys.yourBenefit),
                                      style: Style.interNormal(
                                        size: 12.sp,
                                        color: Style.blackColor,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        symbol: LocalStorage.instance
                                            .getSelectedCurrency()
                                            ?.symbol,
                                      ).format(widget.order.deliveryFee ?? 0),
                                      style: Style.interSemi(
                                        size: 14.sp,
                                        color: Style.blackColor,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Style.transparent,
                              border: Border.all(color: Style.white),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            padding: EdgeInsets.all(12.r),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Style.blackColor,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.all(6.r),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/svg/logoWhite.svg",
                                      width: 22.r,
                                    ),
                                  ),
                                ),
                                12.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppHelpers.trans(
                                          TrKeys.sundaymartBenefit),
                                      style: Style.interNormal(
                                        size: 11.sp,
                                        color: Style.blackColor,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.currency(
                                        symbol: LocalStorage.instance
                                            .getSelectedCurrency()
                                            ?.symbol,
                                      ).format(widget.order.commissionFee ?? 0),
                                      style: Style.interSemi(
                                        size: 14.sp,
                                        color: Style.blackColor,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  8.verticalSpace,
                  (state.order?.details != null &&
                          (state.order?.details?.isNotEmpty ?? false) &&
                          state.order != null)
                      ? Container(
                          decoration: BoxDecoration(
                            color: Style.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: REdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          child: state.isLoading
                              ? ListView.builder(
                                  itemCount: widget.order.details?.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      OrderProductItem(
                                    orderDetail: widget.order.details![index],
                                    isLoading: true,
                                    onToggle: () {},
                                    isLast: widget.order.details?.length ==
                                        index + 1,
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: state.order?.details?.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      OrderProductItem(
                                    orderDetail: state.order!.details![index],
                                    isLoading: false,
                                    isLast: widget.order.details?.length ==
                                        index + 1,
                                    onToggle: () => event
                                        .toggleOrderDetailChecked(index: index),
                                  ),
                                ),
                        )
                      : const SizedBox.shrink(),
                  widget.isHistoryOrder
                      ? const SizedBox.shrink()
                      : Column(
                          children: [
                            30.verticalSpace,
                            state.isUpdating
                                ? const Loading()
                                : SwipeButton.expand(
                                    height: 48.h,
                                    borderRadius: BorderRadius.circular(10.r),
                                    activeTrackColor: Style.primaryColor,
                                    activeThumbColor: Style.greenColor,
                                    thumb: Icon(
                                      Icons.double_arrow_rounded,
                                      color: Style.white,
                                      size: 24.r,
                                    ),
                                    child: MakeShimmer(
                                      child: Text(
                                        AppHelpers.changeStatusButtonText(
                                            widget.order.status),
                                        style: Style.interNormal(),
                                      ),
                                    ),
                                    onSwipe: () => event.updateOrderStatus(
                                      context,
                                      status: AppHelpers.getUpdatableStatus(
                                          widget.order.status),
                                      success: () {
                                        Navigator.pop(context);
                                        switch (AppHelpers.getOrderStatus(
                                            widget.order.status)) {
                                          case OrderStatus.newOrder:
                                            ref
                                                .read(
                                                    newOrdersProvider.notifier)
                                                .fetchNewOrders(
                                                  context: context,
                                                  isRefresh: true,
                                                  activeTabIndex:
                                                      appbarState.index,
                                                  updateTotal: (count) =>
                                                      appbarEvent
                                                          .setAppbarDetails(
                                                    AppHelpers.trans(
                                                        TrKeys.newOrders),
                                                    count,
                                                  ),
                                                );
                                            ref
                                                .read(acceptedOrdersProvider
                                                    .notifier)
                                                .fetchAcceptedOrders(
                                                  isRefresh: true,
                                                  refreshController: widget
                                                      .acceptedOrdersController,
                                                );
                                            break;
                                          case OrderStatus.accepted:
                                            ref
                                                .read(acceptedOrdersProvider
                                                    .notifier)
                                                .fetchAcceptedOrders(
                                                  isRefresh: true,
                                                  refreshController: widget
                                                      .acceptedOrdersController,
                                                  updateTotal: (count) =>
                                                      appbarEvent
                                                          .setAppbarDetails(
                                                    AppHelpers.trans(
                                                        TrKeys.acceptedOrders),
                                                    count,
                                                  ),
                                                );
                                            ref
                                                .read(readyOrdersProvider
                                                    .notifier)
                                                .fetchReadyOrders(
                                                  isRefresh: true,
                                                  refreshController: widget
                                                      .readyOrdersController,
                                                );
                                            break;
                                          case OrderStatus.ready:
                                            ref
                                                .read(readyOrdersProvider
                                                    .notifier)
                                                .fetchReadyOrders(
                                                  isRefresh: true,
                                                  refreshController: widget
                                                      .readyOrdersController,
                                                  updateTotal: (count) =>
                                                      appbarEvent
                                                          .setAppbarDetails(
                                                    AppHelpers.trans(
                                                        TrKeys.readyOrders),
                                                    count,
                                                  ),
                                                );
                                            ref
                                                .read(onAWayOrdersProvider
                                                    .notifier)
                                                .fetchOnAWayOrders(
                                                  isRefresh: true,
                                                  refreshController: widget
                                                      .onAWayOrdersController,
                                                );
                                            break;
                                          case OrderStatus.onAWay:
                                            ref
                                                .read(onAWayOrdersProvider
                                                    .notifier)
                                                .fetchOnAWayOrders(
                                                  isRefresh: true,
                                                  refreshController: widget
                                                      .onAWayOrdersController,
                                                  updateTotal: (count) =>
                                                      appbarEvent
                                                          .setAppbarDetails(
                                                    AppHelpers.trans(
                                                        TrKeys.onAWayOrders),
                                                    count,
                                                  ),
                                                );
                                            ref
                                                .read(onAWayOrdersProvider
                                                    .notifier)
                                                .fetchOnAWayOrders(
                                                  isRefresh: true,
                                                  refreshController: widget
                                                      .onAWayOrdersController,
                                                );
                                            break;
                                          default:
                                            ref
                                                .read(
                                                    newOrdersProvider.notifier)
                                                .fetchNewOrders(
                                                  context: context,
                                                  isRefresh: true,
                                                  activeTabIndex:
                                                      appbarState.index,
                                                  updateTotal: (count) =>
                                                      appbarEvent
                                                          .setAppbarDetails(
                                                    AppHelpers.trans(
                                                        TrKeys.newOrders),
                                                    count,
                                                  ),
                                                );
                                            break;
                                        }
                                      },
                                    ),
                                  ),
                          ],
                        ),
                  20.verticalSpace,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
