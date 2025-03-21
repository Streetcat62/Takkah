import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../application/order/shipping/address/select_address_provider.dart';
import '../../../../../../../application/order/shipping/user/order_user_provider.dart';
import '../../../../../../../infrastructure/services/app_helpers.dart';
import '../../../../../../../infrastructure/services/tr_keys.dart';
import '../../../../../../component/buttons/custom_button.dart';
import '../../../../../../component/text_fields/underlined_text_field.dart';
import '../../../../../../routes/app_router.gr.dart';
import '../../../../../../styles/style.dart';

class AddTitleDialog extends ConsumerWidget {
  const AddTitleDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectAddressProvider);
    final event = ref.read(selectAddressProvider.notifier);
    final userState = ref.watch(orderUserProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppHelpers.trans(TrKeys.enterTitle),
          style: Style.interNormal(),
        ),
        5.verticalSpace,
        UnderlinedTextField(
          label: '',
          hint: AppHelpers.trans(TrKeys.title),
          onChanged: event.setTitle,
        ),
        20.verticalSpace,
        CustomButton(
            isLoading: state.isAddAddressLoading,
            title: AppHelpers.trans(TrKeys.save),
            onPressed: () {
              event.addAddressToUser(context,
                  uuId: userState.selectedUser?.uuid ?? '',
                  onSuccess: () =>
                      context.pushRoute(const SelectAddressFromListRoute()));
            })
      ],
    );
  }
}
