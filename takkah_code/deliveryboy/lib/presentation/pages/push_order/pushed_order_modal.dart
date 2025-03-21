import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../component/components.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/services/services.dart';

class PushedOrderModal extends ConsumerStatefulWidget {
  final OrderDetailData order;
  final bool isActive;

  const PushedOrderModal({
    Key? key,
    required this.order,
    required this.isActive,
  }) : super(key: key);

  @override
  ConsumerState<PushedOrderModal> createState() => _PushedOrderModalState();
}

class _PushedOrderModalState extends ConsumerState<PushedOrderModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(pushOrderProvider.notifier).startTimer(),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    ref.read(pushOrderProvider.notifier).disposeTimer();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      pushOrderProvider,
          (previous, next) {
        if (next.isTimeOut) {
          Navigator.pop(context);
        }
      },
    );
    return Container(
      height: widget.isActive ? 500.h : 400.h,
      width: double.infinity,
      color: Style.transparent,
      child: Stack(
        children: [
          Positioned(
            bottom: 64.h,
            child: Container(
              height: widget.isActive ? 400.h : 320.h,
              width: MediaQuery.of(context).size.width - 32.w,
              decoration: BoxDecoration(
                color: Style.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: widget.isActive ? 84.h : 42.h,
                  left: 16.w,
                  right: 16.w,
                ),
                child: Column(
                  children: [
                    _orderAvatar(),
                    const Spacer(),
                    const Divider(color: Style.borderColor),
                    16.verticalSpace,
                    Row(
                      children: [
                        Icon(FlutterRemix.money_dollar_box_fill, size: 20.sp),
                        10.horizontalSpace,
                        Text(
                          intl.NumberFormat.currency(
                            symbol: LocalStorage.instance
                                .getSelectedCurrency()!
                                .symbol,
                          ).format(widget.order.price ?? 0),
                          style: Style.interSemi(size: 12.sp),
                        ),
                        const Spacer(),
                        Icon(FlutterRemix.takeaway_fill, size: 18.sp),
                        10.horizontalSpace,
                        Text(
                          intl.NumberFormat.currency(
                            symbol: LocalStorage.instance
                                .getSelectedCurrency()!
                                .symbol,
                          ).format(widget.order.deliveryFee ?? 0),
                          style: Style.interSemi(size: 12.sp),
                        ),
                        const Spacer(),
                        Icon(FlutterRemix.bank_card_2_line, size: 18.sp),
                        10.horizontalSpace,
                        Text(
                          widget.order.transaction?.paymentSystem?.tag ?? '',
                          style: Style.interSemi(size: 12.sp),
                        ),
                      ],
                    ),
                    16.verticalSpace,
                    const Divider(
                      color: Style.borderColor,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            title: AppHelpers.getTranslation(TrKeys.skip),
                            onPressed: () => Navigator.pop(context),
                            textColor: Style.blackColor,
                            background: Style.transparent,
                            borderColor: Style.blackColor,
                          ),
                        ),
                        14.horizontalSpace,
                        Expanded(
                          child: CustomButton(
                            title: widget.isActive
                                ? AppHelpers.getTranslation(TrKeys.accept)
                                : AppHelpers.getTranslation(
                                    TrKeys.orderInformation),
                            onPressed: () async {
                              if (widget.isActive) {
                                Navigator.pop(context);
                                ref
                                    .read(homeProvider.notifier)
                                    .setAlertOrderToActive(widget.order);
                                ref.read(homeProvider.notifier).getRoutingAll(
                                      context,
                                      order: widget.order,
                                    );
                              } else {
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    24.verticalSpace
                  ],
                ),
              ),
            ),
          ),
          widget.isActive ? _timer() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _timer() {
    final state = ref.watch(pushOrderProvider);
    return Positioned(
      top: 0,
      right: (MediaQuery.of(context).size.width - 32.w) / 2 - 52.r,
      child: Container(
        padding: EdgeInsets.all(4.r),
        decoration:
            const BoxDecoration(color: Style.white, shape: BoxShape.circle),
        child: CircularPercentIndicator(
          radius: 48.r,
          lineWidth: 12.r,
          percent: double.parse(
                  state.timerText.substring(0, state.timerText.indexOf(' '))) /
              AppHelpers.getAppDeliveryTime(),
          center: Text(state.timerText, style: Style.interSemi(size: 18.sp)),
          fillColor: Style.transparent,
          backgroundColor: Style.shimmerBase,
          progressColor: Style.progressColor,
          circularStrokeCap: CircularStrokeCap.round,
        ),
      ),
    );
  }

  Widget _orderAvatar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 32.r,
              width: 32.r,
              decoration: const BoxDecoration(
                color: Style.white,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: CommonImage(imageUrl: widget.order.shop?.logoImg),
              ),
            ),
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.order.shop?.translation?.title ?? '',
                  style: Style.interSemi(size: 14.sp, letterSpacing: -0.3),
                ),
                2.verticalSpace,
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        '№ ${widget.order.id}',
                        style:
                            Style.interNormal(size: 14.sp, letterSpacing: -0.3),
                      ),
                      const VerticalDivider(),
                      Text(
                        intl.DateFormat('hh:mm').format(DateTime.parse(
                            widget.order.updatedAt ??
                                DateTime.now().toString())),
                        style:
                            Style.interNormal(size: 14.sp, letterSpacing: -0.3),
                      ),
                      16.horizontalSpace,
                      Icon(FlutterRemix.building_fill, size: 18.r),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4.r,
                height: 4.r,
                margin: EdgeInsets.only(bottom: 6.h, top: 6.h),
                decoration: const BoxDecoration(
                  color: Style.tabBarBorderColor,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 4.r,
                height: 4.r,
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: const BoxDecoration(
                  color: Style.tabBarBorderColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 32.r,
              width: 32.r,
              decoration: const BoxDecoration(
                color: Style.white,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: CommonImage(imageUrl: widget.order.user?.img),
              ),
            ),
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    widget.order.address?.address ?? '',
                    style: Style.interSemi(size: 14.sp, letterSpacing: -0.3),
                    maxLines: 1,
                  ),
                ),
                2.verticalSpace,
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        widget.order.user?.firstname ?? '',
                        style:
                            Style.interNormal(size: 14.sp, letterSpacing: -0.3),
                      ),
                      const VerticalDivider(),
                      Text(
                        widget.order.user?.phone ?? '',
                        style:
                            Style.interNormal(size: 14.sp, letterSpacing: -0.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
