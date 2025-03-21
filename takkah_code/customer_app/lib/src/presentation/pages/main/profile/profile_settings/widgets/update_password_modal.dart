import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';
import '../riverpod/provider/update_password_provider.dart';

class UpdatePasswordModal extends ConsumerWidget {
  const UpdatePasswordModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(updatePasswordProvider);
    final notifier = ref.read(updatePasswordProvider.notifier);
    return AbsorbPointer(
      absorbing: state.isSaving,
      child: KeyboardDismisser(
        child: Container(
          margin: REdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  13.verticalSpace,
                  const ModalDrag(),
                  30.verticalSpace,
                  MainInputField(
                    title: AppHelpers.getTranslation(TrKeys.newPassword),
                    obscure: state.showNewPasswd,
                    onChange: notifier.setNewPasswd,
                    suffixIcon: IconButton(
                      splashRadius: 25,
                      icon: Icon(
                        state.showNewPasswd
                            ? FlutterRemix.eye_line
                            : FlutterRemix.eye_close_line,
                        color: AppColors.iconAndTextColor(),
                        size: 20.r,
                      ),
                      onPressed: () =>
                          notifier.setShowNewPasswd(!state.showNewPasswd),
                    ),
                  ),
                  30.verticalSpace,
                  MainInputField(
                    title: AppHelpers.getTranslation(TrKeys.confirmPassword),
                    obscure: state.showConfirmPasswd,
                    onChange: notifier.setConfirmPasswd,
                    suffixIcon: IconButton(
                      splashRadius: 25,
                      icon: Icon(
                        state.showConfirmPasswd
                            ? FlutterRemix.eye_line
                            : FlutterRemix.eye_close_line,
                        color: AppColors.iconAndTextColor(),
                        size: 20.r,
                      ),
                      onPressed: () => notifier
                          .setShowConfirmPasswd(!state.showConfirmPasswd),
                    ),
                  ),
                  30.verticalSpace,
                  MainConfirmButton(
                    title: AppHelpers.getTranslation(TrKeys.updatePassword),
                    isLoading: state.isSaving,
                    onTap: (state.newPassword.length > 7 &&
                            state.confirmPassword.length > 7 &&
                            state.newPassword == state.confirmPassword)
                        ? () => notifier.updatePassword(
                              checkYourNetwork: () {
                                AppHelpers.showCheckFlash(
                                  context,
                                  AppHelpers.getTranslation(
                                      TrKeys.checkYourNetworkConnection),
                                );
                              },
                              afterFailure: () {
                                AppHelpers.showCheckFlash(
                                  context,
                                  AppHelpers.getTranslation(
                                      TrKeys.somethingWentWrongWithTheServer),
                                );
                              },
                              afterUpdated: () {
                                context.popRoute();
                              },
                            )
                        : null,
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
