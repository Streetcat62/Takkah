import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../styles/style.dart';
import '../../reset_password_modal.dart';
import '../../../../routes/app_router.gr.dart';
import '../../../../component/components.dart';
import '../../../../../application/providers.dart';
import '../../../../../infrastructure/services/services.dart';

class LoginModal extends ConsumerWidget {
  const LoginModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading,
        child: KeyboardDisable(
          child: Container(
            margin: MediaQuery.of(context).viewInsets,
            decoration: BoxDecoration(
              color: Style.greyColor.withOpacity(0.96),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            width: double.infinity,
            child: Padding(
              padding: REdgeInsets.all(16.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        AppBarBottomSheet(
                          title: AppHelpers.getTranslation(TrKeys.login),
                        ),
                        20.verticalSpace,
                        UnderlinedBorderTextField(
                          inputType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.next,
                          label: AppHelpers.getTranslation(TrKeys.email)
                              .toUpperCase(),
                          onChanged: event.setEmail,
                          isError: state.isEmailNotValid || state.isLoginError,
                          descriptionText: state.isLoginError
                              ? AppHelpers.getTranslation(
                                  TrKeys.loginCredentialsAreNotValid)
                              : (state.isEmailNotValid
                                  ? AppHelpers.getTranslation(
                                      TrKeys.emailIsNotValid)
                                  : null),
                        ),
                        34.verticalSpace,
                        UnderlinedBorderTextField(
                          textInputAction: TextInputAction.done,
                          textCapitalization: TextCapitalization.none,
                          label: AppHelpers.getTranslation(TrKeys.password)
                              .toUpperCase(),
                          obscure: state.showPassword,
                          suffixIcon: ButtonsBouncingEffect(
                            child: GestureDetector(
                              onTap: event.toggleShowPassword,
                              child: Icon(
                                state.showPassword
                                    ? FlutterRemix.eye_line
                                    : FlutterRemix.eye_close_line,
                                color: isDarkMode
                                    ? Style.blackColor
                                    : Style.textColor,
                                size: 20.r,
                              ),
                            ),
                          ),
                          onChanged: event.setPassword,
                          isError:
                              state.isPasswordNotValid || state.isLoginError,
                          descriptionText: state.isLoginError
                              ? AppHelpers.getTranslation(
                                  TrKeys.loginCredentialsAreNotValid)
                              : (state.isPasswordNotValid
                                  ? AppHelpers.getTranslation(TrKeys
                                      .passwordShouldContainMinimum6Characters)
                                  : null),
                        ),
                        30.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                  width: 20.w,
                                  child: Checkbox(
                                    side: BorderSide(
                                      color: Style.blackColor,
                                      width: 2.r,
                                    ),
                                    activeColor: Style.blackColor,
                                    value: state.isKeepLogin,
                                    onChanged: (value) =>
                                        event.toggleKeepLogin(),
                                  ),
                                ),
                                8.horizontalSpace,
                                Text(
                                  AppHelpers.getTranslation(TrKeys.keepLogged),
                                  style: Style.interNormal(
                                    size: 12.sp,
                                    color: Style.blackColor,
                                  ),
                                ),
                              ],
                            ),
                            ForgotTextButton(
                              title: AppHelpers.getTranslation(
                                TrKeys.forgotPassword,
                              ),
                              onPressed: () => AppHelpers
                                  .showCustomModalBottomSheetWithoutIosIcon(
                                context: context,
                                modal: const ResetPasswordModal(),
                                isDarkMode: isDarkMode,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    40.verticalSpace,
                    Column(
                      children: [
                        CustomButton(
                          title: AppHelpers.getTranslation(TrKeys.login),
                          isLoading: state.isLoading,
                          onPressed: () {
                            event.login(
                              context: context,
                              checkYourNetwork: () =>
                                  AppHelpers.showCheckTopSnackBar(
                                context,
                                AppHelpers.getTranslation(
                                    TrKeys.checkYourNetworkConnection),
                              ),
                              loginSuccess: () {
                                ref
                                    .read(splashProvider.notifier)
                                    .fetchDriverDetails();
                                Navigator.pop(context);
                                context.router.popUntilRoot();
                                context.replaceRoute(const HomeRoute());
                              },
                              youAreNotDeliveryman: () =>
                                  AppHelpers.showCheckTopSnackBar(
                                context,
                                AppHelpers.getTranslation(
                                    TrKeys.youAreNotADeliveryman),
                              ),
                            );
                          },
                        ),
                        32.verticalSpace,
                        Row(
                          children: <Widget>[
                            const Expanded(
                              child: Divider(color: Style.shimmerBase),
                            ),
                            Padding(
                              padding: REdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                AppHelpers.getTranslation(
                                    TrKeys.demoLoginPassword),
                                style: Style.interNormal(
                                  size: 12.sp,
                                  color: Style.textColor,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(color: Style.shimmerBase),
                            ),
                          ],
                        ),
                        22.verticalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    '${AppHelpers.getTranslation(TrKeys.login)}:',
                                style: Style.interNormal(letterSpacing: -0.3),
                                children: [
                                  TextSpan(
                                    text: ' ${AppConstants.demoSellerLogin}',
                                    style: Style.interRegular(
                                      letterSpacing: -0.3,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            6.verticalSpace,
                            RichText(
                              text: TextSpan(
                                text:
                                    '${AppHelpers.getTranslation(TrKeys.password)}:',
                                style: Style.interNormal(letterSpacing: -0.3),
                                children: [
                                  TextSpan(
                                    text: ' ${AppConstants.demoSellerPassword}',
                                    style: Style.interRegular(
                                      letterSpacing: -0.3,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        22.verticalSpace,
                      ],
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
