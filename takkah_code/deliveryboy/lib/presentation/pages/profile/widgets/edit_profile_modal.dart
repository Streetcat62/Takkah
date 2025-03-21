import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../edit_car_modal.dart';
import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/services/services.dart';

class EditProfileModal extends ConsumerStatefulWidget {
  const EditProfileModal({Key? key}) : super(key: key);

  @override
  ConsumerState<EditProfileModal> createState() => _EditProfileModalState();
}

class _EditProfileModalState extends ConsumerState<EditProfileModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(profileSettingsProvider.notifier).fetchProfileDetails(
            checkYourNetwork: () => AppHelpers.showCheckTopSnackBar(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            ),
            setImage: ref.read(profileImageProvider.notifier).setUrl,
            setUserData: ref.read(profileEditProvider.notifier).setInitialInfo,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileSettingsProvider);
    return state.isLoading || state.userData == null
        ? Padding(
            padding: REdgeInsets.symmetric(vertical: 30),
            child: const Loading(),
          )
        : KeyboardDisable(
            child: Consumer(
              builder: (context, ref, child) {
                final editState = ref.watch(profileEditProvider);
                final editNotifier = ref.read(profileEditProvider.notifier);
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding (
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              TitleAndIcon(
                                title: AppHelpers.getTranslation(
                                    TrKeys.profileSettings),
                              ),
                              24.verticalSpace,
                              Row(
                                children: [
                                  Consumer(
                                    builder: (context, ref, child) {
                                      final imageState =
                                          ref.watch(profileImageProvider);
                                      return Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          ShopAvatar(
                                            radius: 16,
                                            imageUrl: imageState.imageUrl,
                                            path: imageState.path,
                                            size: 50,
                                            padding: 6,
                                            bgColor: Style.blackColor
                                                .withOpacity(0.27),
                                          ),
                                          Container(
                                            width: 50.r,
                                            height: 50.r,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              color: Style.blackColor
                                                  .withOpacity(0.27),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              FlutterRemix.camera_fill,
                                              color: Style.white,
                                              size: 20.r,
                                            ),
                                            onPressed: () async {
                                              final XFile? pickedFile =
                                                  await ImagePicker().pickImage(
                                                source: ImageSource.gallery,
                                                maxWidth: 1000,
                                                maxHeight: 1000,
                                                imageQuality: 90,
                                              );
                                              if (pickedFile != null) {
                                                // ignore: use_build_context_synchronously
                                                ref
                                                    .read(profileImageProvider
                                                        .notifier)
                                                    .changePhoto(
                                                      context: context,
                                                      path: pickedFile.path,
                                                      firstname: state
                                                          .userData?.firstname,
                                                    );
                                              }
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                  16.horizontalSpace,
                                  Expanded(
                                    child: UnderlinedBorderTextField(
                                      label: AppHelpers.getTranslation(
                                          TrKeys.firstname),
                                      initialText: editState.firstname,
                                      onChanged: editNotifier.setFirstname,
                                      descriptionText: editState.isFirstnameError
                                          ? AppHelpers.getTranslation(
                                              TrKeys.firstnameCannotBeEmpty)
                                          : null,
                                      isError: editState.isFirstnameError,
                                      validator: AppValidators.emptyCheck,
                                    ),
                                  ),
                                ],
                              ),
                              24.verticalSpace,
                              UnderlinedBorderTextField(
                                label: AppHelpers.getTranslation(TrKeys.lastname),
                                initialText: editState.lastname,
                                onChanged: editNotifier.setLastname,
                                descriptionText: editState.isLastnameError
                                    ? AppHelpers.getTranslation(
                                        TrKeys.lastnameCannotBeEmpty)
                                    : null,
                                isError: editState.isLastnameError,
                                validator: AppValidators.emptyCheck,
                              ),
                              24.verticalSpace,
                              UnderlinedBorderTextField(
                                label:
                                    AppHelpers.getTranslation(TrKeys.phoneNumber),
                                initialText: editState.phone,
                                inputType: TextInputType.phone,
                                readOnly: !editState.isPhoneEditable,
                                onChanged: editNotifier.setPhone,
                              ),
                              24.verticalSpace,
                              UnderlinedBorderTextField(
                                label: AppHelpers.getTranslation(TrKeys.email),
                                initialText: editState.email,
                                inputType: TextInputType.emailAddress,
                                readOnly: !editState.isEmailEditable,
                                onChanged: editNotifier.setEmail,
                              ),
                              24.verticalSpace,
                              UnderlinedBorderTextField(
                                label: AppHelpers.getTranslation(TrKeys.password),
                                obscure: editState.showPassword,
                                onChanged: editNotifier.setPassword,
                                isError: editState.isPasswordError,
                                descriptionText: editState.isPasswordError
                                    ? AppHelpers.getTranslation(TrKeys
                                        .passwordShouldContainMinimum6Characters)
                                    : null,
                                suffixIcon: IconButton(
                                  splashRadius: 25,
                                  icon: Icon(
                                    editState.showPassword
                                        ? FlutterRemix.eye_line
                                        : FlutterRemix.eye_close_line,
                                    color: Style.blackColor,
                                    size: 20.r,
                                  ),
                                  onPressed: editNotifier.toggleShowPassword,
                                ),
                              ),
                              24.verticalSpace,
                              UnderlinedBorderTextField(
                                label: AppHelpers.getTranslation(
                                    TrKeys.confirmPassword),
                                obscure: editState.showConfirmPassword,
                                onChanged: editNotifier.setConfirmPassword,
                                isError: editState.isConfirmPasswordError,
                                descriptionText: editState.isConfirmPasswordError
                                    ? AppHelpers.getTranslation(TrKeys
                                        .confirmPasswordDoesntMatchWithNewPassword)
                                    : null,
                                suffixIcon: IconButton(
                                  splashRadius: 25.r,
                                  icon: Icon(
                                    editState.showConfirmPassword
                                        ? FlutterRemix.eye_line
                                        : FlutterRemix.eye_close_line,
                                    color: Style.blackColor,
                                    size: 20.r,
                                  ),
                                  onPressed:
                                      editNotifier.toggleShowConfirmPassword,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      const Divider(),
                      GestureDetector(
                        onTap: () => AppHelpers.showCustomModalBottomSheet(
                          paddingTop: 120.h,
                          context: context,
                          modal: const EditCarModal(),
                          isDarkMode: false,
                          isExpanded: true,
                        ),
                        child: Container(
                          color: Style.transparent,
                          child: Padding(
                            padding: EdgeInsets.all(16.r),
                            child: Row(
                              children: [
                                Icon(
                                  FlutterRemix.time_fill,
                                  size: 20.r,
                                ),
                                8.horizontalSpace,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppHelpers.getTranslation(
                                          TrKeys.deliveryVehicle),
                                      style: Style.interNormal(
                                          size: 12.sp, color: Style.blackColor),
                                    ),
                                    Text(
                                      '${LocalStorage.instance.getDriverInfo()?.data?.number} — ${LocalStorage.instance.getDriverInfo()?.data?.model}, ${LocalStorage.instance.getDriverInfo()?.data?.color}',
                                      style: Style.interNormal(
                                          size: 12.sp, color: Style.blackColor),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(FlutterRemix.arrow_right_s_line)
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.all(16.r),
                        child: CustomButton(
                          title: AppHelpers.getTranslation(TrKeys.save),
                          isLoading: editState.isLoading,
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              editNotifier.updateGeneralInfo(
                                context,
                                checkYourNetwork: () =>
                                    AppHelpers.showCheckTopSnackBar(
                                  context,
                                  AppHelpers.getTranslation(
                                      TrKeys.checkYourNetworkConnection),
                                ),
                                updated: () {
                                  ref.read(profileSettingsProvider.notifier).updateState();
                                  context.popRoute();
                                },
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}
