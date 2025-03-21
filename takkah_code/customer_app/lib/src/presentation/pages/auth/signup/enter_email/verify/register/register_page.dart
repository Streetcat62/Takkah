import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';
import 'riverpod/provider/register_provider.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';

class RegisterPage extends StatefulWidget {
  final String email;

  const RegisterPage({Key? key, required this.email}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _password = '';

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
                        final state = ref.watch(registerProvider);
                        final event = ref.read(registerProvider.notifier);
                        return Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
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
                              30.verticalSpace,
                              MainInputField(
                                title:
                                    AppHelpers.getTranslation(TrKeys.firstname),
                                onChange: event.setFirstname,
                                inputType: TextInputType.name,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                validator: AppValidators.emptyCheck,
                              ),
                              15.verticalSpace,
                              MainInputField(
                                title:
                                    AppHelpers.getTranslation(TrKeys.lastname),
                                onChange: event.setLastname,
                                inputType: TextInputType.name,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                validator: AppValidators.emptyCheck,
                              ),
                              15.verticalSpace,
                              ProfileEditFieldButton(
                                onTap: () {
                                  AppHelpers.showCustomModalBottomSheet(
                                    context: context,
                                    modal: CustomDatePickerModal(
                                      initialDate: state.birthdate,
                                      onDateSaved: event.setBirthday,
                                      maxDate: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day,
                                        23,
                                        59,
                                        59,
                                      ),
                                    ),
                                  );
                                },
                                label: AppHelpers.getTranslation(
                                    TrKeys.dateOfBirth),
                                hintText: state.birthdate,
                                suffixIconData: FlutterRemix.arrow_right_s_line,
                              ),
                              15.verticalSpace,
                              MainInputField(
                                title:
                                    AppHelpers.getTranslation(TrKeys.password),
                                obscure: state.showPassword,
                                onChange: (text) {
                                  event.setPassword(text);
                                  _password = text.trim();
                                },
                                validator: AppValidators.passwordCheck,
                                suffixIcon: IconButton(
                                  splashRadius: 25,
                                  icon: Icon(
                                    state.showPassword
                                        ? FlutterRemix.eye_line
                                        : FlutterRemix.eye_close_line,
                                    color: AppColors.iconAndTextColor(),
                                    size: 20.r,
                                  ),
                                  onPressed: event.toggleShowPassword,
                                ),
                              ),
                              15.verticalSpace,
                              MainInputField(
                                title: AppHelpers.getTranslation(
                                    TrKeys.confirmPassword),
                                obscure: state.showConfirmPassword,
                                onChange: event.setConfirmPassword,
                                validator: (value) =>
                                    AppValidators.checkConfirmPassword(
                                        _password, value),
                                suffixIcon: IconButton(
                                  splashRadius: 25,
                                  icon: Icon(
                                    state.showConfirmPassword
                                        ? FlutterRemix.eye_line
                                        : FlutterRemix.eye_close_line,
                                    color: AppColors.iconAndTextColor(),
                                    size: 20.r,
                                  ),
                                  onPressed: event.toggleShowConfirmPassword,
                                ),
                              ),
                              40.verticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SignButton(
                                    title: AppHelpers.getTranslation(
                                        TrKeys.signUp),
                                    loading: state.isLoading,
                                    onClick: () {
                                      if ((_formKey.currentState?.validate() ??
                                              false) &&
                                          state.birthdate.isNotEmpty) {
                                        event.register(
                                          email: widget.email,
                                          checkYourNetwork: () =>
                                              AppHelpers.showCheckFlash(
                                            context,
                                            AppHelpers.getTranslation(TrKeys
                                                .checkYourNetworkConnection),
                                          ),
                                          success: () {
                                            context.router.popUntilRoot();
                                            context.replaceRoute(
                                              AddAddressRoute(isRequired: true),
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                  4.horizontalSpace,
                                  ExtendedSignButton(
                                    title: AppHelpers.getTranslation(
                                        TrKeys.registerWith),
                                    onSignInWithGoogle: () =>
                                        event.registerWithGoogle(
                                      context,
                                      errorOccurred: (message) =>
                                          AppHelpers.showCheckFlash(
                                        context,
                                        message,
                                      ),
                                    ),
                                    onSignInWithFacebook: () =>
                                        event.registerWithFacebook(
                                      context,
                                      checkYourNetwork: () =>
                                          AppHelpers.showCheckFlash(
                                              context,
                                              AppHelpers.getTranslation(TrKeys
                                                  .checkYourNetworkConnection)),
                                    ),
                                    isGoogleLoading: state.isGoogleLoading,
                                    isFacebookLoading: state.isFacebookLoading,
                                    isAppleLoading: state.isAppleLoading,
                                  ),
                                ],
                              ),
                              20.verticalSpace,
                            ],
                          ),
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
