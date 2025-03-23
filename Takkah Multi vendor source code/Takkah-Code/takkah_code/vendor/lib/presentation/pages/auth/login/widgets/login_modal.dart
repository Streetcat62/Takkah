import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../styles/style.dart';
import '../../reset_password_page.dart';
import '../../../../component/components.dart';
import '../../../../routes/app_router.gr.dart';
import '../../../../../application/providers.dart';
import '../../../../../infrastructure/services/services.dart';

class LoginModal extends StatefulWidget {
  const LoginModal({Key? key}) : super(key: key);

  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
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
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Consumer(
                  builder: (context, ref, child) {
                    final event = ref.read(loginProvider.notifier);
                    final state = ref.watch(loginProvider);
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          children: [
                            8.verticalSpace,
                            AppBarBottomSheet(
                              title: AppHelpers.trans(TrKeys.login),
                            ),
                            30.verticalSpace,
                            UnderlinedTextField(
                              inputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.none,
                              label:
                                  AppHelpers.trans(TrKeys.email).toUpperCase(),
                              onChanged: event.setEmail,
                              validator: AppValidators.emailCheck,
                              isError: state.isLoginError,
                              descriptionText: state.isLoginError
                                  ? AppHelpers.trans(
                                  TrKeys.loginCredentialsAreNotValid)
                                  : null,
                            ),
                            34.verticalSpace,
                            UnderlinedTextField(
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.none,
                              label: AppHelpers.trans(TrKeys.password)
                                  .toUpperCase(),
                              obscure: state.showPassword,
                              validator: AppValidators.passwordCheck,
                              isError: state.isLoginError,
                              descriptionText: state.isLoginError
                                  ? AppHelpers.trans(
                                      TrKeys.loginCredentialsAreNotValid)
                                  : null,
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
                                      AppHelpers.trans(TrKeys.keepMeLoggedIn),
                                      style: Style.interNormal(
                                        size: 12.sp,
                                        color: Style.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                ForgotTextButton(
                                  title:
                                      AppHelpers.trans(TrKeys.forgotPassword),
                                  onPressed: () {
                                    //  forgetPassword
                                    context.popRoute();
                                    AppHelpers
                                        .showCustomModalBottomSheetWithoutIosIcon(
                                      context: context,
                                      modal: const ResetPasswordPage(),
                                      isDarkMode: isDarkMode,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        40.verticalSpace,
                        Column(
                          children: [
                            CustomButton(
                              title: AppHelpers.trans(TrKeys.login),
                              isLoading: state.isLoading,
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  event.login(
                                    checkYourNetwork: () =>
                                        AppHelpers.showCheckTopSnackBar(
                                      context,
                                      text: AppHelpers.trans(
                                          TrKeys.checkYourNetworkConnection),
                                    ),
                                    loginSuccess: () => ref
                                        .read(restaurantProvider.notifier)
                                        .fetchMyShop(
                                      afterFetched: () {
                                        Navigator.pop(context);
                                        context.router.popUntilRoot();
                                        context.replaceRoute(const MainRoute());
                                      },
                                    ),
                                    seller: () =>
                                        AppHelpers.showCheckTopSnackBar(
                                      context,
                                      text: AppHelpers.trans(
                                          TrKeys.youAreASeller),
                                      type: SnackBarType.success,
                                    ),
                                    admin: () =>
                                        AppHelpers.showCheckTopSnackBar(
                                      context,
                                      text: AppHelpers.trans(
                                          TrKeys.youAreAnAdmin),
                                      type: SnackBarType.success,
                                    ),
                                    accessDenied: () =>
                                        AppHelpers.showCheckTopSnackBar(
                                      context,
                                      text:
                                          AppHelpers.trans(TrKeys.accessDenied),
                                      type: SnackBarType.error,
                                    ),
                                  );
                                }
                              },
                            ),
                            32.verticalSpace,
                            Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Divider(color: Style.shimmerBase),
                                ),
                                Padding(
                                  padding:
                                      REdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    AppHelpers.trans(TrKeys.demoLoginPassword),
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
                                    text: '${AppHelpers.trans(TrKeys.login)}:',
                                    style:
                                        Style.interNormal(letterSpacing: -0.3),
                                    children: [
                                      TextSpan(
                                        text:
                                            ' ${AppConstants.demoSellerLogin}',
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
                                        '${AppHelpers.trans(TrKeys.password)}:',
                                    style:
                                        Style.interNormal(letterSpacing: -0.3),
                                    children: [
                                      TextSpan(
                                        text:
                                            ' ${AppConstants.demoSellerPassword}',
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
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: SocialButton(
                            //         iconData: FlutterRemix.apple_fill,
                            //         onPressed: () {},
                            //         title: 'Apple',
                            //       ),
                            //     ),
                            //     10.horizontalSpace,
                            //     Expanded(
                            //       child: SocialButton(
                            //         iconData: FlutterRemix.facebook_fill,
                            //         onPressed: () {},
                            //         title: 'Facebook',
                            //       ),
                            //     ),
                            //     10.horizontalSpace,
                            //     Expanded(
                            //       child: SocialButton(
                            //         iconData: FlutterRemix.google_fill,
                            //         isLoading: state.isGoogleLoading,
                            //         onPressed: () {
                            //           event.loginWithGoogle(
                            //             checkYourNetwork: () =>
                            //                 AppHelpers.showCheckTopSnackBar(
                            //               context,
                            //               text: AppHelpers.trans(
                            //                   TrKeys.checkYourNetworkConnection),
                            //             ),
                            //             loginSuccess: () {
                            //               ref
                            //                   .read(restaurantProvider.notifier)
                            //                   .fetchMyShop(
                            //                 afterFetched: () {
                            //                   Navigator.pop(context);
                            //                   context.router.popUntilRoot();
                            //                   context
                            //                       .replaceRoute(const MainRoute());
                            //                 },
                            //               );
                            //             },
                            //             errorOccurred: (text) =>
                            //                 AppHelpers.showCheckTopSnackBar(
                            //               context,
                            //               text: AppHelpers.trans(TrKeys
                            //                   .somethingWentWrongWithTheServer),
                            //             ),
                            //             seller: () =>
                            //                 AppHelpers.showCheckTopSnackBar(
                            //               context,
                            //               text: AppHelpers.trans(
                            //                   TrKeys.youAreASeller),
                            //               type: SnackBarType.success,
                            //             ),
                            //             admin: () =>
                            //                 AppHelpers.showCheckTopSnackBar(
                            //               context,
                            //               text: AppHelpers.trans(
                            //                   TrKeys.youAreAnAdmin),
                            //               type: SnackBarType.success,
                            //             ),
                            //             accessDenied: () =>
                            //                 AppHelpers.showCheckTopSnackBar(
                            //               context,
                            //               text:
                            //                   AppHelpers.trans(TrKeys.accessDenied),
                            //               type: SnackBarType.error,
                            //             ),
                            //           );
                            //         },
                            //         title: 'Google',
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            22.verticalSpace,
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
