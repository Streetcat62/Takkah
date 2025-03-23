import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/style.dart';
import '../../component/components.dart';
import '../../../application/providers.dart';
import '../../../infrastructure/services/services.dart';

class EditCarModal extends ConsumerStatefulWidget {
  const EditCarModal({Key? key}) : super(key: key);

  @override
  ConsumerState<EditCarModal> createState() => _EditCarModalState();
}

class _EditCarModalState extends ConsumerState<EditCarModal> {
  late TextEditingController brand;
  late TextEditingController model;
  late TextEditingController number;
  late TextEditingController color;
  String? dropdownValue;
  final _formKey = GlobalKey<FormState>();

  final List<String> items = [
    AppHelpers.getTranslation(TrKeys.benzine),
    AppHelpers.getTranslation(TrKeys.diesel),
    AppHelpers.getTranslation(TrKeys.gas),
    AppHelpers.getTranslation(TrKeys.motorbike),
    AppHelpers.getTranslation(TrKeys.bike),
    AppHelpers.getTranslation(TrKeys.foot),
  ];

  @override
  void initState() {
    super.initState();
    brand = TextEditingController(
      text: LocalStorage.instance.getDriverInfo()?.data?.brand ?? '',
    );
    model = TextEditingController(
      text: LocalStorage.instance.getDriverInfo()?.data?.model ?? '',
    );
    number = TextEditingController(
      text: LocalStorage.instance.getDriverInfo()?.data?.number ?? '',
    );
    color = TextEditingController(
      text: LocalStorage.instance.getDriverInfo()?.data?.color ?? '',
    );
    dropdownValue = AppHelpers.getInitialTypeOfTechnique();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(profileImageProvider.notifier).setUrlCar(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    brand.dispose();
    model.dispose();
    number.dispose();
    color.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileEditProvider);
    final imageState = ref.watch(profileImageProvider);
    final event = ref.read(profileEditProvider.notifier);
    final imageEvent = ref.read(profileImageProvider.notifier);
    return KeyboardDisable(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TitleAndIcon(
                    title: AppHelpers.getTranslation(TrKeys.carSettings),
                  ),
                  24.verticalSpace,
                  DropdownButtonFormField(
                    value: dropdownValue,
                    items: items
                        .map(
                          (String item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) => setState(
                      () {
                        dropdownValue = newValue!;
                      },
                    ),
                    decoration: InputDecoration(
                      labelText: AppHelpers.getTranslation(TrKeys.typeTechnique)
                          .toUpperCase(),
                      labelStyle: Style.interNormal(
                        size: 14.sp,
                        color: Style.blackColor,
                      ),
                      contentPadding:
                          REdgeInsets.symmetric(horizontal: 0, vertical: 8),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.shimmerBase),
                      ),
                      errorBorder: InputBorder.none,
                      border: const UnderlineInputBorder(),
                      focusedErrorBorder: const UnderlineInputBorder(),
                      disabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Style.shimmerBase),
                      ),
                      focusedBorder: const UnderlineInputBorder(),
                    ),
                  ),
                  24.verticalSpace,
                  UnderlinedBorderTextField(
                    label: AppHelpers.getTranslation(TrKeys.carBrand),
                    textController: brand,
                    validator: AppValidators.emptyCheck,
                  ),
                  24.verticalSpace,
                  UnderlinedBorderTextField(
                    label: AppHelpers.getTranslation(TrKeys.carModel),
                    textController: model,
                    validator: AppValidators.emptyCheck,
                  ),
                  24.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: UnderlinedBorderTextField(
                          label: AppHelpers.getTranslation(TrKeys.stateNumber),
                          textController: number,
                          validator: AppValidators.emptyCheck,
                          textCapitalization: TextCapitalization.characters,
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        flex: 1,
                        child: UnderlinedBorderTextField(
                          label: AppHelpers.getTranslation(TrKeys.color),
                          textController: color,
                          validator: AppValidators.emptyCheck,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          24.verticalSpace,
          InkWell(
            onTap: () async {
              final XFile? pickedFile = await ImagePicker().pickImage(
                source: ImageSource.gallery,
              );
              if (pickedFile?.path != null) {
                imageEvent.setCarImagePath(pickedFile!.path);
              }
            },
            child: Container(
              height: 160.h,
              margin: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Style.blackColor),
              ),
              child: imageState.carImageUrl == null
                  ? imageState.carImagePath.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FlutterRemix.upload_cloud_2_line,
                              size: 36.sp,
                              color: Style.blueColor,
                            ),
                            16.verticalSpace,
                            Text(
                              AppHelpers.getTranslation(TrKeys.carPicture),
                              style: Style.interSemi(size: 14.sp),
                            ),
                            Text(
                              AppHelpers.getTranslation(TrKeys.recommendedSize),
                              style: Style.interRegular(size: 14.sp),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.file(
                            File(imageState.carImagePath),
                            fit: BoxFit.cover,
                            height: 160.r,
                            width: double.infinity,
                          ),
                        )
                  : CommonImage(
                      imageUrl: imageState.carImageUrl,
                      height: 160,
                      radius: 20,
                    ),
            ),
          ),
          24.verticalSpace,
          Padding(
            padding: EdgeInsets.all(16.r),
            child: CustomButton(
              textColor: Style.white,
              background: (dropdownValue?.isNotEmpty ?? false)
                  ? Style.primaryColor
                  : Style.shadowColor,
              isLoading: state.isLoading,
              title: AppHelpers.getTranslation(TrKeys.save),
              onPressed: () {
                if ((dropdownValue?.isNotEmpty ?? false) &&
                    (_formKey.currentState?.validate() ?? false)) {
                  event.editCarInfo(
                    context,
                    type: AppHelpers.getTranslationReverse(dropdownValue!),
                    brand: brand.text,
                    model: model.text,
                    number: number.text,
                    color: color.text,
                    path: imageState.carImagePath,
                    carImageUrl: imageState.carImageUrl,
                    updated: context.popRoute,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
