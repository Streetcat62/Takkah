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
import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/services/services.dart';

class RegisterConfirmationPage extends ConsumerStatefulWidget {
  final UserData userModel;

  const RegisterConfirmationPage({Key? key, required this.userModel})
      : super(key: key);

  @override
  ConsumerState<RegisterConfirmationPage> createState() =>
      _RegisterConfirmationPageState();
}

class _RegisterConfirmationPageState
    extends ConsumerState<RegisterConfirmationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(registerConfirmationProvider.notifier).startTimer();
    });
  }

  @override
  void deactivate() {
    ref.read(registerConfirmationProvider.notifier).disposeTimer();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(registerConfirmationProvider.notifier);
    final state = ref.watch(registerConfirmationProvider);
    final bool isLtr = LocalStorage.instance.getLangLtr();
    final isDarkMode  = LocalStorage.instance.getAppThemeMode();
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        AppBarBottomSheet(
                          title: AppHelpers.trans(TrKeys.enterOtp),
                        ),
                        Text(
                          AppHelpers.trans(TrKeys.sendOtp),
                          style: Style.interRegular(
                              size: 14.sp, color: Style.blackColor),
                        ),
                        Text(
                          widget.userModel.phone ?? "",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: Style.blackColor,
                          ),
                        ),
                        40.verticalSpace,
                         SizedBox(
                          height: 75,
                          child: PinFieldAutoFill(
                            codeLength: 4,
                            currentCode: state.confirmCode,
                            onCodeChanged: notifier.setCode,
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
                                ? AppHelpers.trans(TrKeys.resendOtp)
                                : state.timerText,
                            onPressed: () {
                              if (state.isTimeExpired) {
                                notifier.startTimer();
                                // resend
                              }
                            },
                            width: (MediaQuery.of(context).size.width - 40) / 3,
                            background: Style.blackColor,
                            textColor: Style.white,
                          ),
                          CustomButton(
                            title:
                                AppHelpers.trans(TrKeys.confirmation),
                            onPressed: () {
                              // confirm
                              context.replaceRoute(const MainRoute());
                            },
                            width: 2 *
                                (MediaQuery.of(context).size.width - 40) /
                                3,
                            background: state.isConfirm
                                ? Style.primaryColor
                                : Style.white,
                            textColor: state.isConfirm
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
