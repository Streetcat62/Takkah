import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'approve_order_dialog.dart';
import '../../../styles/style.dart';
import 'delivered_order_dialog.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';
import '../../home/widgets/order_items_modal.dart';
import '../../../../infrastructure/models/models.dart';
import '../../../../infrastructure/services/services.dart';

class OrderDetailModal extends ConsumerStatefulWidget {
  final OrderDetailData order;
  final bool isOrder;
  final bool isActiveButton;

  const OrderDetailModal({
    Key? key,
    required this.order,
    this.isOrder = false,
    this.isActiveButton = false,
  }) : super(key: key);

  @override
  ConsumerState<OrderDetailModal> createState() => _OrderDetailModalState();
}

class _OrderDetailModalState extends ConsumerState<OrderDetailModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) =>
          ref.read(orderDetailsProvider.notifier).setInitialOrder(widget.order),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderDetailsProvider);
    return state.order == null
        ? Padding(
            padding: REdgeInsets.symmetric(vertical: 24),
            child: const Center(
              child: CircularProgressIndicator(color: Style.greenColor),
            ),
          )
        : ListView(
            physics: const BouncingScrollPhysics(),
            padding: REdgeInsets.symmetric(horizontal: 16, vertical: 10),
            shrinkWrap: true,
            children: [
              OrderBottomSheet(
                order: state.order!,
                isSetCurrentOrder: widget.isOrder && widget.isActiveButton,
              ),
              widget.isOrder
                  ? Column(
                      children: [
                        if (state.order!.status == 'ready')
                          Column(
                            children: [
                              16.verticalSpace,
                              CustomButton(
                                title: AppHelpers.getTranslation(
                                    TrKeys.orderInformation),
                                onPressed: () =>
                                    AppHelpers.showCustomModalBottomSheet(
                                  context: context,
                                  modal: OrderItemsModal(
                                    order: state.order!,
                                    fromHome: false,
                                  ),
                                  isDarkMode: false,
                                ),
                                background: Style.transparent,
                                borderColor: Style.blackColor,
                                textColor: Style.blackColor,
                              ),
                            ],
                          ),
                        16.verticalSpace,
                        Consumer(
                          builder: (context, ref, child) {
                            return CustomButton(
                              isLoading: ref.watch(homeProvider).isLoading,
                              title: state.order!.status == 'on_a_way'
                                  ? AppHelpers.getTranslation(
                                      TrKeys.deliveredTheOrder)
                                  : AppHelpers.getTranslation(TrKeys.order),
                              onPressed: () {
                                if (state.order!.status == 'on_a_way') {
                                  AppHelpers.showAlertDialog(
                                    context: context,
                                    child: const DeliveredOrderDialog(),
                                  );
                                } else {
                                  AppHelpers.showAlertDialog(
                                    context: context,
                                    child:
                                        ApproveOrderDialog(order: state.order!),
                                  );
                                }
                              },
                            );
                          },
                        ),
                        16.verticalSpace,
                      ],
                    )
                  : const SizedBox.shrink()
            ],
          );
  }
}
