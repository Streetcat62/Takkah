import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles/style.dart';
import 'home_approve_order_dialog.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/models/models.dart';
import '../../orders/widgets/approve_order_dialog.dart';
import '../../../../infrastructure/services/services.dart';

class OrderItemsModal extends ConsumerStatefulWidget {
  final OrderDetailData order;
  final bool fromHome;

  const OrderItemsModal({
    Key? key,
    required this.order,
    this.fromHome = true,
  }) : super(key: key);

  @override
  ConsumerState<OrderItemsModal> createState() => _OrderItemsModalState();
}

class _OrderItemsModalState extends ConsumerState<OrderItemsModal> {
  bool _hasData = true;

  @override
  void initState() {
    super.initState();
    if (widget.order.details?.isEmpty ?? true) {
      _hasData = false;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => ref
            .read(orderProvider.notifier)
            .showOrder(context, widget.order.id ?? 0),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderProvider);
    return state.isLoading
        ? Padding(
            padding: REdgeInsets.symmetric(vertical: 24),
            child: const Loading(),
          )
        : SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.products)),
                16.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Style.white,
                  ),
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _hasData
                            ? (widget.order.details?.length ?? 0)
                            : (state.order?.details?.length ?? 0),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 18.h),
                                child: ProductItem(
                                  productName: _hasData
                                      ? (widget
                                              .order
                                              .details?[index]
                                              .shopProduct
                                              ?.product
                                              ?.translation
                                              ?.title ??
                                          AppHelpers.getTranslation(
                                              TrKeys.noName))
                                      : (state
                                              .order
                                              ?.details?[index]
                                              .shopProduct
                                              ?.product
                                              ?.translation
                                              ?.title ??
                                          ''),
                                  amount: _hasData
                                      ? '${widget.order.details?[index].quantity}'
                                      : '${state.order?.details?[index].quantity} ',
                                  price: _hasData
                                      ? intl.NumberFormat.currency(
                                          symbol: LocalStorage.instance
                                              .getSelectedCurrency()!
                                              .symbol,
                                        ).format(widget.order.details?[index]
                                              .originPrice ??
                                          0)
                                      : intl.NumberFormat.currency(
                                          symbol: LocalStorage.instance
                                              .getSelectedCurrency()!
                                              .symbol,
                                        ).format(state.order?.details?[index]
                                              .originPrice ??
                                          0),
                                ),
                              ),
                              Divider(thickness: 1.r, height: 1.r),
                            ],
                          );
                        },
                      ),
                      18.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppHelpers.getTranslation(TrKeys.total),
                            style: Style.interSemi(
                                size: 16.sp, letterSpacing: -0.3),
                          ),
                          Text(
                            _hasData
                                ? intl.NumberFormat.currency(
                                    symbol: LocalStorage.instance
                                        .getSelectedCurrency()
                                        ?.symbol,
                                  ).format(widget.order.price ?? 0)
                                : intl.NumberFormat.currency(
                                    symbol: LocalStorage.instance
                                        .getSelectedCurrency()
                                        ?.symbol,
                                  ).format(state.order?.price ?? 0),
                            style: Style.interSemi(
                                size: 16.sp, letterSpacing: -0.3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                16.verticalSpace,
                CustomButton(
                  title: AppHelpers.getTranslation(TrKeys.order),
                  onPressed: () {
                    if (widget.fromHome) {
                      AppHelpers.showAlertDialog(
                        context: context,
                        child: HomeApproveOrderDialog(
                          order: widget.order,
                          doublePop: true,
                        ),
                      );
                    } else {
                      AppHelpers.showAlertDialog(
                        context: context,
                        child: ApproveOrderDialog(
                          order: widget.order,
                          doublePop: true,
                        ),
                      );
                    }
                  },
                ),
                16.verticalSpace,
              ],
            ),
          );
  }
}
