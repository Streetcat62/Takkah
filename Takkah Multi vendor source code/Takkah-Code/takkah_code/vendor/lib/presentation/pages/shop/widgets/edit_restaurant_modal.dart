import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'working_time_modal.dart';
import '../../../styles/style.dart';
import '../../../component/components.dart';
import '../../../routes/app_router.gr.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/models/models.dart';
import '../../../../infrastructure/services/services.dart';

class EditRestaurantModal extends ConsumerStatefulWidget {
  const EditRestaurantModal({Key? key}) : super(key: key);

  @override
  ConsumerState<EditRestaurantModal> createState() =>
      _EditRestaurantModalState();
}

class _EditRestaurantModalState extends ConsumerState<EditRestaurantModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: ModalWrap(
        body: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(restaurantProvider);
            final event = ref.read(restaurantProvider.notifier);
            final workingDayEvent = ref.read(workingDaysProvider.notifier);
            return state.shop == null
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3.r,
                      color: Style.primaryColor,
                    ),
                  )
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                const ModalDrag(),
                                TitleAndIcon(
                                  title: AppHelpers.trans(TrKeys.shopSettings),
                                ),
                                24.verticalSpace,
                                HorizontalImagePicker(
                                  onImageChange: event.setBackgroundImageFile,
                                  onDelete: () =>
                                      event.setBackgroundImageFile(null),
                                  imageFilePath: state.backgroundImageFile,
                                  imageUrl: state.shop?.backgroundImg,
                                ),
                                24.verticalSpace,
                                Row(
                                  children: [
                                    ButtonsBouncingEffect(
                                      child: GestureDetector(
                                        onTap: () async {
                                          XFile? file;
                                          try {
                                            file = await ImagePicker()
                                                .pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                          } catch (ex) {
                                            debugPrint(
                                                '===> trying to select image $ex');
                                          }
                                          if (file != null) {
                                            event.setLogoImageFile(file.path);
                                          }
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            state.logoImageFile != null
                                                ? BlurWrap(
                                                    radius:
                                                        BorderRadius.circular(
                                                            16),
                                                    child: Container(
                                                      width: 50.r,
                                                      height: 50.r,
                                                      color: Style.blackColor
                                                          .withOpacity(0.27),
                                                      alignment:
                                                          Alignment.center,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.r),
                                                        child: Image.file(
                                                          File(state
                                                              .logoImageFile!),
                                                          width: 40.r,
                                                          height: 40.r,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : ShopBorderedAvatar(
                                                    size: 50,
                                                    imageSize: 40,
                                                    imageUrl:
                                                        state.shop?.logoImg,
                                                    borderRadius: 16,
                                                    bgColor: Style.blackColor
                                                        .withOpacity(0.27),
                                                  ),
                                            Icon(
                                              FlutterRemix.camera_fill,
                                              color: Style.white,
                                              size: 20.r,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    16.horizontalSpace,
                                    Expanded(
                                      child: UnderlinedTextField(
                                        initialText:
                                            state.shop?.translation?.title,
                                        label:
                                            AppHelpers.trans(TrKeys.shopName),
                                        onChanged: event.setTitle,
                                        validator: AppValidators.emptyCheck,
                                      ),
                                    ),
                                  ],
                                ),
                                24.verticalSpace,
                                UnderlinedTextField(
                                  initialText:
                                      state.shop?.translation?.description,
                                  label: AppHelpers.trans(TrKeys.description),
                                  onChanged: event.setDescription,
                                  validator: AppValidators.emptyCheck,
                                ),
                                24.verticalSpace,
                                UnderlinedTextField(
                                  initialText: state.shop?.phone,
                                  label: AppHelpers.trans(TrKeys.phoneNumber),
                                  onChanged: event.setPhone,
                                  validator: AppValidators.emptyCheck,
                                ),
                                24.verticalSpace,
                              ],
                            ),
                          ),
                          24.verticalSpace,
                          const Divider(),
                          GestureDetector(
                            onTap: () {
                              workingDayEvent.changeIndex(null);
                              AppHelpers.showCustomModalBottomSheet(
                                paddingTop: MediaQuery.of(context).padding.top,
                                context: context,
                                modal: const WorkingTimeModal(),
                                isDarkMode: false,
                              );
                            },
                            child: Container(
                              color: Style.transparent,
                              child: Padding(
                                padding: REdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Icon(
                                      FlutterRemix.time_fill,
                                      size: 18.r,
                                      color: Style.blackColor,
                                    ),
                                    8.horizontalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppHelpers.trans(TrKeys.workingHours),
                                          style: Style.interNormal(
                                            size: 12.sp,
                                            color: Style.blackColor,
                                          ),
                                        ),
                                        4.verticalSpace,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ...(state.shop?.shopWorkingDays ??
                                                    [])
                                                .map(
                                              (ShopWorkingDays day) => Padding(
                                                padding:
                                                    REdgeInsets.only(right: 4),
                                                child: SmallWeekdayItem(
                                                  isSelected:
                                                      !(day.disabled ?? false),
                                                  day: day,
                                                  size: 30,
                                                  fontSize: 11,
                                                  borderRadius: 6,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Icon(
                                      FlutterRemix.arrow_right_s_line,
                                      size: 24.r,
                                      color: Style.blackColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                          GestureDetector(
                            onTap: () =>
                                context.pushRoute(const DeliveryZoneRoute()),
                            child: Container(
                              color: Style.transparent,
                              child: Padding(
                                padding: REdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Icon(
                                      FlutterRemix.navigation_fill,
                                      size: 20.r,
                                    ),
                                    8.horizontalSpace,
                                    Text(
                                      AppHelpers.trans(TrKeys.deliveryZone),
                                      style: Style.interNormal(
                                        size: 12.sp,
                                        color: Style.blackColor,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      FlutterRemix.arrow_right_s_line,
                                      size: 24.r,
                                      color: Style.blackColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Divider(),
                          24.verticalSpace,
                          Padding(
                            padding: REdgeInsets.all(16),
                            child: CustomButton(
                              title: AppHelpers.trans(TrKeys.save),
                              isLoading: state.isLoading,
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  event.updateShop(context,
                                      updateSuccess: context.popRoute);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
