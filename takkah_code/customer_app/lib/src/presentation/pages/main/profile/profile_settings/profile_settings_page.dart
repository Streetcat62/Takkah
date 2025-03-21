import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import 'widgets/profile_info_percent.dart';
import 'widgets/update_password_modal.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import 'riverpod/provider/profile_edit_provider.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import 'riverpod/provider/profile_image_provider.dart';
import 'riverpod/provider/profile_settings_provider.dart';

class ProfileSettingsPage extends ConsumerStatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileSettingsPage> createState() =>
      _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends ConsumerState<ProfileSettingsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(profileSettingsProvider.notifier).fetchProfileDetails(
              imageNotifier: ref.read(profileImageProvider.notifier),
              editNotifier: ref.read(profileEditProvider.notifier),
              checkYourNetwork: () {
                AppHelpers.showCheckFlash(
                  context,
                  AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
                );
              },
              unauthorised: () {
                AppHelpers.showCheckFlash(
                  context,
                  AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
                );
                context.router.pushAndPopUntil(
                  const LoginRoute(),
                  predicate: (route) => false,
                );
              },
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: AppColors.mainBackground(),
        appBar: CommonAppBar(
          title: AppHelpers.getTranslation(TrKeys.profileSettings),
          onLeadingPressed: context.popRoute,
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Consumer(
            builder: (context, ref, child) {
              final profileState = ref.watch(profileSettingsProvider);
              return profileState.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3.r,
                        color: AppColors.green,
                      ),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          16.verticalSpace,
                          const ProfileInfoPercent(),
                          40.verticalSpace,
                          Consumer(
                            builder: (context, ref, child) {
                              final imageState =
                                  ref.watch(profileImageProvider);
                              final imageNotifier =
                                  ref.read(profileImageProvider.notifier);
                              return Row(
                                children: [
                                  Container(
                                    width: 90.r,
                                    height: 90.r,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.mainAppbarBack()
                                          .withOpacity(0.35),
                                    ),
                                    child: SelectableCircleImageButton(
                                      imageUrl: imageState.imageUrl,
                                      path: imageState.path,
                                    ),
                                  ),
                                  30.horizontalSpace,
                                  GestureDetector(
                                    onTap: () async {
                                      XFile? pickedFile;
                                      try {
                                        pickedFile = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                      } catch (ex) {
                                        debugPrint(
                                            '===> trying to select image $ex');
                                      }
                                      if (pickedFile != null) {
                                        imageNotifier.changePhoto(
                                          path: pickedFile.path,
                                          firstname:
                                              profileState.userData?.firstname,
                                        );
                                      }
                                    },
                                    child: Text(
                                      AppHelpers.getTranslation(
                                          TrKeys.uploadNewImage),
                                      style: GoogleFonts.inter(
                                        fontSize: 14.sp,
                                        color: AppColors.blue,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              final editState = ref.watch(profileEditProvider);
                              final editNotifier =
                                  ref.read(profileEditProvider.notifier);
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MainInputField(
                                    title: AppHelpers.getTranslation(
                                        TrKeys.firstname),
                                    initialText: editState.firstname,
                                    onChange: editNotifier.setFirstname,
                                  ),
                                  MainInputField(
                                    title: AppHelpers.getTranslation(
                                        TrKeys.lastname),
                                    initialText: editState.lastname,
                                    onChange: editNotifier.setLastname,
                                  ),
                                  MainInputField(
                                    title: AppHelpers.getTranslation(
                                        TrKeys.phoneNumber),
                                    initialText: editState.phone,
                                    readOnly: editState.phone.isNotEmpty,
                                    onChange: editNotifier.setPhone,
                                    inputType: TextInputType.phone,
                                  ),
                                  MainInputField(
                                    title:
                                        AppHelpers.getTranslation(TrKeys.email),
                                    initialText: editState.email,
                                    readOnly: !editState.isEmailEditable,
                                    onChange: editNotifier.setEmail,
                                    inputType: TextInputType.emailAddress,
                                  ),
                                  30.verticalSpace,
                                  ProfileEditFieldButton(
                                    onTap: () {
                                      AppHelpers.showCustomModalBottomSheet(
                                        context: context,
                                        modal: const UpdatePasswordModal(),
                                      );
                                    },
                                    label: AppHelpers.getTranslation(
                                        TrKeys.password),
                                    hintText: '********',
                                    suffixIconData: FlutterRemix.pencil_line,
                                  ),
                                  30.verticalSpace,
                                  ProfileEditFieldButton(
                                    onTap: () {
                                      AppHelpers.showCustomModalBottomSheet(
                                        context: context,
                                        modal: CustomDatePickerModal(
                                          initialDate: null,
                                          onDateSaved: editNotifier.setBirthday,
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
                                    hintText: editState.birthday,
                                    suffixIconData:
                                        FlutterRemix.arrow_right_s_line,
                                  ),
                                  30.verticalSpace,
                                  Text(
                                    AppHelpers.getTranslation(TrKeys.gender),
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      color: AppColors.secondaryIconTextColor(),
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.4,
                                    ),
                                  ),
                                  12.verticalSpace,
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                            editNotifier.setMale('male'),
                                        child: Container(
                                          width: 40.r,
                                          height: 40.r,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.blue,
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            FlutterRemix.men_fill,
                                            size: 18.r,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                      10.horizontalSpace,
                                      GestureDetector(
                                        onTap: () =>
                                            editNotifier.setMale('male'),
                                        child: Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.male),
                                          style: GoogleFonts.inter(
                                            fontSize: editState.male == 'male'
                                                ? 18.sp
                                                : 14.sp,
                                            color: editState.male == 'male'
                                                ? AppColors.iconAndTextColor()
                                                : AppColors
                                                    .secondaryIconTextColor(),
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.4,
                                          ),
                                        ),
                                      ),
                                      40.horizontalSpace,
                                      GestureDetector(
                                        onTap: () =>
                                            editNotifier.setMale('female'),
                                        child: Container(
                                          width: 40.r,
                                          height: 40.r,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.white,
                                            border: Border.all(
                                              color: AppColors.red,
                                              width: 2.r,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Icon(
                                            FlutterRemix.women_fill,
                                            size: 18.r,
                                            color: AppColors.red,
                                          ),
                                        ),
                                      ),
                                      10.horizontalSpace,
                                      GestureDetector(
                                        onTap: () =>
                                            editNotifier.setMale('female'),
                                        child: Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.female),
                                          style: GoogleFonts.inter(
                                            fontSize: editState.male == 'female'
                                                ? 18.sp
                                                : 14.sp,
                                            color: editState.male == 'female'
                                                ? AppColors.iconAndTextColor()
                                                : AppColors
                                                    .secondaryIconTextColor(),
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  30.verticalSpace,
                                  MainConfirmButton(
                                    title:
                                        AppHelpers.getTranslation(TrKeys.save),
                                    onTap: editState.phone.isEmpty
                                        ? null
                                        : () => editNotifier.updateGeneralInfo(
                                              checkYourNetwork: () {
                                                AppHelpers.showCheckFlash(
                                                  context,
                                                  AppHelpers.getTranslation(TrKeys
                                                      .checkYourNetworkConnection),
                                                );
                                              },
                                              updated: () {
                                                ref
                                                    .read(
                                                        profileSettingsProvider
                                                            .notifier)
                                                    .fetchProfileDetails(
                                                  checkYourNetwork: () {
                                                    AppHelpers.showCheckFlash(
                                                      context,
                                                      AppHelpers.getTranslation(
                                                          TrKeys
                                                              .checkYourNetworkConnection),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                    isLoading: editState.isLoading,
                                  ),
                                ],
                              );
                            },
                          ),
                          53.verticalSpace,
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
