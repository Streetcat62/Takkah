import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import 'register_confirmation_page.dart';
import '../../component/components.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/services/services.dart';

class ResetPasswordPage extends ConsumerWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(resetPasswordProvider.notifier);
    final state = ref.watch(resetPasswordProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading,
        child: KeyboardDisable(
          child: Container(
            padding: MediaQuery.of(context).viewInsets,
            decoration: BoxDecoration(
                color: Style.greyColor.withOpacity(0.96),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                )),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        AppBarBottomSheet(
                          title: AppHelpers.trans(TrKeys.resetPassword),
                        ),
                        Text(
                          AppHelpers.trans(TrKeys.resetPasswordText),
                          style: Style.interRegular(
                              size: 14.sp, color: Style.blackColor),
                        ),
                        40.verticalSpace,
                        UnderlinedTextField(
                          label: AppHelpers.trans(TrKeys.email).toUpperCase(),
                          onChanged: notifier.setEmail,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom,
                        top: 120.h,
                      ),
                      child: CustomButton(
                        title: AppHelpers.trans(TrKeys.send),
                        onPressed: () {
                          //  sendCode
                          context.popRoute();
                          AppHelpers.showCustomModalBottomSheetWithoutIosIcon(
                            context: context,
                            modal:
                                RegisterConfirmationPage(userModel: UserData()),
                            isDarkMode: isDarkMode,
                          );
                        },
                        background: Style.primaryColor,
                        textColor: Style.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
