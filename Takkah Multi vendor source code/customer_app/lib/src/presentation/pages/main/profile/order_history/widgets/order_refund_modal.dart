import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sundaymart/src/presentation/pages/main/profile/order_history/riverpod/provider/order_details_provider.dart';
import 'package:sundaymart/src/presentation/pages/main/profile/order_history/riverpod/provider/refund_orders_provider.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/app_helpers.dart';
import '../../../../../../core/utils/app_validators.dart';
import '../../../../../components/components.dart';

class OrderRefundModal extends ConsumerWidget {
   OrderRefundModal({Key? key}) : super(key: key);
    final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderDetailsProvider);
    final stateRefund = ref.watch(refundOrderProvider);
    final notifier = ref.read(refundOrderProvider.notifier);
    return Container(
      margin:
          REdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            13.verticalSpace,
            const ModalDrag(),
            30.verticalSpace,
            const Text(
              "Reason",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            30.verticalSpace,
            Form(
              key: formKey,
              child: MainInputField(
                  validator: AppValidators.emptyCheck,
                  title: AppHelpers.getTranslation(TrKeys.writeReason),
                  onChange: notifier.setMessage),
            ),
            30.verticalSpace,
            MainConfirmButton(
              title: AppHelpers.getTranslation(TrKeys.send),
              isLoading: stateRefund.isLoading,
              onTap: () {
                if (formKey.currentState?.validate() ?? false) {
                  notifier.refundOrder(
                      context: context,
                      orderId: state.orderData?.id,
                      success: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                }

              },
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
