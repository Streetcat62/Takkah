import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../component/components.dart';
import 'register_confirmation_modal.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

class ResetPasswordModal extends StatefulWidget {
  const ResetPasswordModal({Key? key}) : super(key: key);

  @override
  State<ResetPasswordModal> createState() => _ResetPasswordModalState();
}

class _ResetPasswordModalState extends State<ResetPasswordModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDisable(
        child: Container(
          padding: MediaQuery.of(context).viewInsets,
          decoration: BoxDecoration(
            color: Style.greyColor.withOpacity(0.96),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Consumer(
                builder: (context, ref, child) {
                  final event = ref.read(resetPasswordProvider.notifier);
                  final state = ref.watch(resetPasswordProvider);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          AppBarBottomSheet(
                            title:
                                AppHelpers.getTranslation(TrKeys.resetPassword),
                          ),
                          12.verticalSpace,
                          Text(
                            AppHelpers.getTranslation(TrKeys.resetPasswordText),
                            style: Style.interRegular(
                                size: 14.sp, color: Style.blackColor),
                          ),
                          40.verticalSpace,
                          Form(
                            key: _formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: UnderlinedBorderTextField(
                              label: AppHelpers.getTranslation(TrKeys.email)
                                  .toUpperCase(),
                              onChanged: event.setEmail,
                              validator: AppValidators.emailCheck,
                              isError: state.isEmailError,
                              descriptionText: state.isEmailError
                                  ? AppHelpers.getTranslation(
                                      TrKeys.userNotFound)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom,
                          top: 120.h,
                        ),
                        child: CustomButton(
                          title: AppHelpers.getTranslation(TrKeys.send),
                          isLoading: state.isLoading,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              event.sendCode(
                                checkYourNetwork: () =>
                                    AppHelpers.showCheckTopSnackBar(
                                        context,
                                        AppHelpers.getTranslation(
                                            TrKeys.checkYourNetworkConnection)),
                                error: (message) =>
                                    AppHelpers.showCheckTopSnackBar(
                                        context, message),
                                success: (email) => AppHelpers
                                    .showCustomModalBottomSheetWithoutIosIcon(
                                  context: context,
                                  modal: RegisterConfirmationModal(email: email),
                                  isDarkMode: isDarkMode,
                                ),
                              );
                            }
                          },
                          background: Style.primaryColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
