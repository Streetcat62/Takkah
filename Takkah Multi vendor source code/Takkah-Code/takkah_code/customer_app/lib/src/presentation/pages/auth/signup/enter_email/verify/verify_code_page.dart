import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import 'riverpod/provider/verify_code_provider.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';

class VerifyCodePage extends ConsumerStatefulWidget {
  final String email;

  const VerifyCodePage({Key? key, required this.email}) : super(key: key);

  @override
  ConsumerState<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends ConsumerState<VerifyCodePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(verifyCodeProvider.notifier).startTimer();
      },
    );
  }

  @override
  void deactivate() {
    ref.read(verifyCodeProvider.notifier).disposeTimer();
    super.deactivate();
  }

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
                  child: Text(
                    '${AppHelpers.getAppName()}',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      letterSpacing: -1,
                      color: AppColors.iconAndTextColor(),
                    ),
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
                        final state = ref.watch(verifyCodeProvider);
                        final event = ref.read(verifyCodeProvider.notifier);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            16.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppHelpers.getTranslation(TrKeys.verify),
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 32.sp,
                                    letterSpacing: -2,
                                    color: AppColors.iconAndTextColor(),
                                  ),
                                ),
                                Text(
                                  state.isTimeExpired
                                      ? AppHelpers.getTranslation(
                                          TrKeys.expired)
                                      : state.timerText,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    letterSpacing: -0.3,
                                    color: AppColors.iconAndTextColor(),
                                  ),
                                ),
                              ],
                            ),
                            60.verticalSpace,
                            SizedBox(
                              height: 56.r,
                              child: PinFieldAutoFill(
                                codeLength: 6,
                                currentCode: state.confirmCode,
                                onCodeChanged: event.setCode,
                                cursor: Cursor(
                                  width: 1,
                                  height: 24,
                                  color: AppColors.iconAndTextColor(),
                                  enabled: true,
                                ),
                                decoration: BoxLooseDecoration(
                                  gapSpace: 10.r,
                                  textStyle: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    color: AppColors.iconAndTextColor(),
                                  ),
                                  bgColorBuilder: FixedColorBuilder(
                                    AppColors.mainAppbarBack(),
                                  ),
                                  strokeColorBuilder: FixedColorBuilder(
                                    state.isCodeError
                                        ? AppColors.red
                                        : AppColors.secondaryIconTextColor(),
                                  ),
                                ),
                              ),
                            ),
                            90.verticalSpace,
                            CommonMaterialButton(
                              text: AppHelpers.getTranslation(TrKeys.sendCode),
                              height: 50,
                              isLoading: state.isLoading,
                              color: AppColors.green,
                              onTap: state.confirmCode.length < 6
                                  ? () {
                                      event.setValidation();
                                    }
                                  : () {
                                      event.checkOtp(
                                        context,
                                        success: () {
                                          context.pushRoute(
                                            RegisterRoute(email: widget.email),
                                          );
                                        },
                                      );
                                    },
                            ),
                            30.verticalSpace,
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
