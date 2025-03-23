import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../component/components.dart';
import '../../routes/app_router.gr.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

class RegisterConfirmationModal extends ConsumerStatefulWidget {
  final String email;

  const RegisterConfirmationModal({Key? key, required this.email})
      : super(key: key);

  @override
  ConsumerState<RegisterConfirmationModal> createState() =>
      _RegisterConfirmationModalState();
}

class _RegisterConfirmationModalState
    extends ConsumerState<RegisterConfirmationModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(registerConfirmationProvider.notifier).startTimer(),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    ref.read(registerConfirmationProvider.notifier).disposeTimer();
  }

  @override
  Widget build(BuildContext context) {
    final event = ref.read(registerConfirmationProvider.notifier);
    final state = ref.watch(registerConfirmationProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading || state.isResending,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        AppBarBottomSheet(
                          title: AppHelpers.getTranslation(TrKeys.enterOtp),
                        ),
                        Text(
                          AppHelpers.getTranslation(TrKeys.sendOtp),
                          style: Style.interRegular(
                              size: 14.sp, color: Style.blackColor),
                        ),
                        Text(
                          widget.email,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Style.blackColor,
                          ),
                        ),
                        40.verticalSpace,
                        SizedBox(
                          height: 56,
                          child: PinFieldAutoFill(
                            codeLength: 6,
                            currentCode: state.confirmCode,
                            onCodeChanged: event.setCode,
                            cursor: Cursor(
                              width: 1,
                              height: 24,
                              color:
                                  isDarkMode ? Style.white : Style.blackColor,
                              enabled: true,
                            ),
                            decoration: BoxLooseDecoration(
                              gapSpace: 10.r,
                              textStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                color:
                                    isDarkMode ? Style.white : Style.blackColor,
                              ),
                              bgColorBuilder: FixedColorBuilder(
                                isDarkMode
                                    ? Style.transparent
                                    : Style.transparent,
                              ),
                              strokeColorBuilder: FixedColorBuilder(
                                state.isCodeError
                                    ? Style.redColor
                                    : isDarkMode
                                        ? Style.borderColor
                                        : Style.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom,
                        top: 120.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            title: state.isTimeExpired
                                ? AppHelpers.getTranslation(TrKeys.resend)
                                : state.timerText,
                            isLoading: state.isResending,
                            onPressed: () {
                              if (state.isTimeExpired) {
                                event.resendConfirmation(
                                  widget.email,
                                  checkYourNetwork: () =>
                                      AppHelpers.showCheckTopSnackBar(
                                          context,
                                          AppHelpers.getTranslation(TrKeys
                                              .checkYourNetworkConnection)),
                                  error: (message) =>
                                      AppHelpers.showCheckTopSnackBar(
                                          context, message),
                                );
                              }
                            },
                            width: (MediaQuery.of(context).size.width - 40) / 3,
                            background: Style.blackColor,
                            textColor: Style.white,
                          ),
                          CustomButton(
                            title:
                                AppHelpers.getTranslation(TrKeys.confirm),
                            isLoading: state.isLoading,
                            onPressed: () {
                              event.confirmCode(
                                checkYourNetwork: () =>
                                    AppHelpers.getTranslation(
                                        TrKeys.checkYourNetworkConnection),
                                success: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  context.replaceRoute(const HomeRoute());
                                },
                              );
                            },
                            width: 2 *
                                (MediaQuery.of(context).size.width - 40) /
                                3,
                            background: state.isConfirmEnabled
                                ? Style.primaryColor
                                : Style.white,
                            textColor: state.isConfirmEnabled
                                ? Style.blackColor
                                : Style.textColor,
                          ),
                        ],
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
