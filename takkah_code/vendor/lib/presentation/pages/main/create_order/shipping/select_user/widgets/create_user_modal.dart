import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../component/components.dart';
import '../../../../../../../application/providers.dart';
import '../../../../../../../infrastructure/services/services.dart';

class CreateUserModal extends StatefulWidget {
  const CreateUserModal({Key? key}) : super(key: key);

  @override
  State<CreateUserModal> createState() => _CreateUserModalState();
}

class _CreateUserModalState extends State<CreateUserModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final event = ref.read(createUserProvider.notifier);
            final state = ref.watch(createUserProvider);
            return Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ModalDrag(),
                    TitleAndIcon(
                      title: AppHelpers.trans(TrKeys.addUser),
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.trans(TrKeys.firstname)}*',
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: event.setFirstname,
                      validator: AppValidators.emptyCheck,
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.trans(TrKeys.lastname)}*',
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: event.setLastname,
                      validator: AppValidators.emptyCheck,
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.trans(TrKeys.phoneNumber)}*',
                      inputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      onChanged: event.setPhone,
                      validator: AppValidators.emptyCheck,
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.trans(TrKeys.email)}*',
                      inputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      textInputAction: TextInputAction.done,
                      onChanged: event.setEmail,
                      validator: AppValidators.emptyCheck,
                    ),
                    24.verticalSpace,
                    CustomButton(
                      title: AppHelpers.trans(TrKeys.save),
                      isLoading: state.isLoading,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          event.createUser(
                            context,
                            created: (user) {
                              context.popRoute();
                              ref
                                  .read(orderUserProvider.notifier)
                                  .addCreatedUser(user);
                            },
                            failed: () => AppHelpers.showCheckTopSnackBar(
                              context,
                              text: AppHelpers.trans(TrKeys.failed),
                              type: SnackBarType.error,
                            ),
                          );
                        }
                      },
                    ),
                    24.verticalSpace,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
