import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import 'riverpod/provider/login_provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: AppColors.mainBackground(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: REdgeInsets.only(top: 0.05.sh),
                  child: Image(
                    image: AssetImage(
                      LocalStorage.instance.getAppThemeMode()
                          ? AppAssets.pngDarkModeImage9
                          : AppAssets.pngLightModeImage9,
                    ),
                    height: 0.42.sh,
                    width: 1.sw,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  width: 1.sw,
                  height: 22,
                  margin: EdgeInsets.only(top: 0.075.sh, right: 16, left: 30),
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${AppHelpers.getAppName()}',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          letterSpacing: -1,
                          color: AppColors.iconAndTextColor(),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            context.replaceRoute(const EnterEmailRoute()),
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.signUp),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                            letterSpacing: -1,
                            color: AppColors.green,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 1.sw,
                    padding: EdgeInsets.only(
                      top: 0.022.sh,
                      left: 16,
                      right: 26,
                      bottom: 0.03.sh,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mainAppbarBack(),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 0.023.sh),
                          child: Text(
                            AppHelpers.getTranslation(TrKeys.login),
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 32.sp,
                              letterSpacing: -2,
                              color: AppColors.iconAndTextColor(),
                            ),
                          ),
                        ),
                        40.verticalSpace,
                        CommonInputField(
                          label: AppHelpers.getTranslation(TrKeys.login),
                          hintText: 'example@gmail.com',
                          onChanged: notifier.setEmail,
                          inputType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          isError: state.isLoginError || state.isEmailNotValid,
                          textInputAction: TextInputAction.next,
                          descriptionText: state.isEmailNotValid
                              ? AppHelpers.getTranslation(
                                  TrKeys.emailIsNotValid)
                              : (state.isLoginError
                                  ? AppHelpers.getTranslation(
                                      TrKeys.loginCredentialsAreNotValid)
                                  : null),
                        ),
                        24.verticalSpace,
                        Divider(
                          color: AppColors.iconAndTextColor(),
                          height: 1.r,
                          thickness: 1.r,
                        ),
                        22.verticalSpace,
                        CommonInputField(
                          obscure: state.showPassword,
                          label: AppHelpers.getTranslation(TrKeys.password),
                          hintText: '* * * * * * * *',
                          onChanged: notifier.setPassword,
                          textCapitalization: TextCapitalization.none,
                          isError:
                              state.isLoginError || state.isPasswordNotValid,
                          descriptionText: state.isPasswordNotValid
                              ? AppHelpers.getTranslation(TrKeys
                                  .passwordShouldContainMinimum6Characters)
                              : (state.isLoginError
                                  ? AppHelpers.getTranslation(
                                      TrKeys.loginCredentialsAreNotValid)
                                  : null),
                          suffixIcon: IconButton(
                            splashRadius: 25,
                            icon: Icon(
                              state.showPassword
                                  ? FlutterRemix.eye_line
                                  : FlutterRemix.eye_close_line,
                              color: AppColors.iconAndTextColor(),
                              size: 20.r,
                            ),
                            onPressed: () =>
                                notifier.setShowPassword(!state.showPassword),
                          ),
                        ),
                        Container(
                          margin:
                              REdgeInsets.only(top: 0.01.sh, bottom: 0.046.sh),
                          child: TextButton(
                            onPressed: () {
                              // Get.toNamed("/forgotPassword");
                            },
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.zero),
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: REdgeInsets.only(right: 12),
                                  child: Icon(
                                    FlutterRemix.lock_password_fill,
                                    color: AppColors.green,
                                    size: 20.r,
                                  ),
                                ),
                                Text(
                                  AppHelpers.getTranslation(
                                      TrKeys.forgotPassword),
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    letterSpacing: -0.5,
                                    color: AppColors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SignButton(
                              title: AppHelpers.getTranslation(TrKeys.login),
                              loading: state.isLoading,
                              onClick: () => notifier.login(
                                context,
                                checkYourNetwork: () {
                                  AppHelpers.showCheckFlash(
                                    context,
                                    AppHelpers.getTranslation(
                                        TrKeys.checkYourNetworkConnection),
                                  );
                                },
                              ),
                            ),
                            ExtendedSignButton(
                              title:
                                  AppHelpers.getTranslation(TrKeys.loginWith),
                              isGoogleLoading: state.isGoogleLoading,
                              isFacebookLoading: state.isFacebookLoading,
                              isAppleLoading: state.isAppleLoading,
                              onSignInWithGoogle: () =>
                                  notifier.loginWithGoogle(
                                context,
                                checkYourNetwork: () =>
                                    AppHelpers.showCheckFlash(
                                  context,
                                  AppHelpers.getTranslation(
                                      TrKeys.checkYourNetworkConnection),
                                ),
                                errorOccurred: (message) =>
                                    AppHelpers.showCheckFlash(context, message),
                              ),
                              onSignInWithFacebook: () =>
                                  notifier.loginWithFacebook(
                                context,
                                checkYourNetwork: () =>
                                    AppHelpers.showCheckFlash(
                                  context,
                                  AppHelpers.getTranslation(
                                      TrKeys.checkYourNetworkConnection),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 1.sw,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 0.02.sh),
                          child: TextButton(
                            onPressed: () => notifier.skipForNow(context),
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.zero,
                              ),
                            ),
                            child: Text(
                              AppHelpers.getTranslation(TrKeys.loginAsAGuest),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                letterSpacing: -0.5,
                                color: AppColors.secondaryIconTextColor(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
