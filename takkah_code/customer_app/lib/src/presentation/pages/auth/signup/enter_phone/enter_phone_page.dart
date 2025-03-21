import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import 'riverpod/provider/enter_phone_provider.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';

class EnterPhonePage extends StatelessWidget {
  const EnterPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        onTap: () => context.replaceRoute(const LoginRoute()),
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.login),
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
                      left: 16.r,
                      right: 16.r,
                      bottom: 0.03.sh,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.mainAppbarBack(),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                    child: Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(enterPhoneProvider);
                        final notifier = ref.read(enterPhoneProvider.notifier);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              AppHelpers.getTranslation(TrKeys.signUp),
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 32.sp,
                                letterSpacing: -2,
                                color: AppColors.iconAndTextColor(),
                              ),
                            ),
                            40.verticalSpace,
                            MainInputField(
                              title: AppHelpers.getTranslation(TrKeys.phone),
                              onChange: notifier.setPhone,
                              inputType: TextInputType.phone,
                            ),
                            40.verticalSpace,
                            Row(
                              children: [
                                Checkbox(
                                  side: BorderSide(
                                    color: AppColors.iconAndTextColor(),
                                    width: 2.r,
                                  ),
                                  activeColor: AppColors.iconAndTextColor(),
                                  value: state.agreedToPrivacy,
                                  onChanged: (value) => notifier.toggleAgreed(),
                                ),
                                Text(
                                  AppHelpers.getTranslation(
                                      TrKeys.iAgreeToSendASms),
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: AppColors.iconAndTextColor(),
                                    letterSpacing: -0.4,
                                  ),
                                ),
                                6.horizontalSpace,
                                GestureDetector(
                                  child: Text(
                                    AppHelpers.getTranslation(
                                        TrKeys.privacyPolicy),
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      color: AppColors.iconAndTextColor(),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.4,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () async {
                                    if (!await launchUrl(Uri.parse(
                                        AppConstants.privacyPolicyUrl))) {
                                      throw 'Could not launch';
                                    }
                                  },
                                ),
                              ],
                            ),
                            40.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SignButton(
                                  title: AppHelpers.getTranslation(
                                      TrKeys.sendCode),
                                  loading: state.isLoading,
                                  onClick: () => notifier.sendOtp(
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
                                4.horizontalSpace,
                                ExtendedSignButton(
                                  title: AppHelpers.getTranslation(
                                      TrKeys.registerWith),
                                  onSignInWithGoogle: () {
                                    notifier.registerWithGoogle(
                                      context,
                                      errorOccurred: (message) {
                                        AppHelpers.showCheckFlash(
                                          context,
                                          message,
                                        );
                                      },
                                    );
                                  },
                                  onSignInWithFacebook: () {
                                    notifier.registerWithFacebook(context);
                                  },
                                  isGoogleLoading: state.isGoogleLoading,
                                  isFacebookLoading: state.isFacebookLoading,
                                  isAppleLoading: state.isAppleLoading,
                                ),
                              ],
                            ),
                            60.verticalSpace,
                          ],
                        );
                      },
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
