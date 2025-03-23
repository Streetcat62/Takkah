import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'food_brands.dart';
import 'food_categories_modal.dart';
import 'create_food_units_modal.dart';
import '../../../../../styles/style.dart';
import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class CreateFoodDetailsBody extends StatefulWidget {
  final Function() onSave;

  const CreateFoodDetailsBody({Key? key, required this.onSave})
      : super(key: key);

  @override
  State<CreateFoodDetailsBody> createState() => _CreateFoodDetailsBodyState();
}

class _CreateFoodDetailsBodyState extends State<CreateFoodDetailsBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardDisable(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(createFoodDetailsProvider);
              final categoryState = ref.watch(addFoodCategoriesProvider);
              final unitState = ref.watch(createFoodUnitsProvider);
              final categoriesState = ref.watch(foodCategoriesProvider);
              final event = ref.read(createFoodDetailsProvider.notifier);
              final foodsEvent = ref.read(foodsProvider.notifier);
              return Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    24.verticalSpace,
                    HorizontalImagePicker(
                      isAdding: true,
                      imageFilePath: state.imageFile,
                      onImageChange: event.setImageFile,
                      onDelete: () => event.setImageFile(null),
                    ),
                    state.imageFile == null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              AppHelpers.trans(TrKeys.cannotBeEmpty),
                              style: Style.interNormal(
                                  color: Style.redColor, size: 12),
                            ),
                          )
                        : const SizedBox.shrink(),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.trans(TrKeys.productTitle)}*',
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: event.setTitle,
                      validator: AppValidators.emptyCheck,
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.trans(TrKeys.description)}*',
                      inputType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: event.setDescription,
                      validator: AppValidators.emptyCheck,
                    ),
                    24.verticalSpace,
                    Consumer(
                      builder: (context, ref, child) {
                        return UnderlinedTextField(
                          textController: categoryState.categoryController,
                          label: '${AppHelpers.trans(TrKeys.productCategory)}*',
                          suffixIcon: Icon(
                            FlutterRemix.arrow_down_s_line,
                            color: Style.blackColor,
                            size: 18.r,
                          ),
                          readOnly: true,
                          validator: AppValidators.emptyCheck,
                          onTap: () => AppHelpers.showCustomModalBottomSheet(
                            paddingTop:
                                MediaQuery.of(context).padding.top + 100.h,
                            context: context,
                            modal: const FoodCategoriesModal(),
                            isDarkMode: false,
                          ),
                        );
                      },
                    ),
                    24.verticalSpace,
                    Consumer(
                      builder: (context, ref, child) {
                        return UnderlinedTextField(
                          textController: unitState.unitController,
                          label: '${AppHelpers.trans(TrKeys.units)}*',
                          suffixIcon: Icon(
                            FlutterRemix.arrow_down_s_line,
                            color: Style.blackColor,
                            size: 18.r,
                          ),
                          readOnly: true,
                          validator: AppValidators.emptyCheck,
                          onTap: () => AppHelpers.showCustomModalBottomSheet(
                            paddingTop:
                                MediaQuery.of(context).padding.top + 300.h,
                            context: context,
                            modal: const CreateFoodUnitsModal(),
                            isDarkMode: false,
                          ),
                        );
                      },
                    ),
                    24.verticalSpace,
                    Consumer(
                      builder: (context, ref, child) {
                        return UnderlinedTextField(
                          textController: categoriesState.brandController,
                          label: '${AppHelpers.trans(TrKeys.brand)}*',
                          suffixIcon: Icon(
                            FlutterRemix.arrow_down_s_line,
                            color: Style.blackColor,
                            size: 18.r,
                          ),
                          readOnly: true,
                          validator: AppValidators.emptyCheck,
                          onTap: () => AppHelpers.showCustomModalBottomSheet(
                            paddingTop:
                                MediaQuery.of(context).padding.top + 300.h,
                            context: context,
                            modal: const CreateFoodBrandsModal(),
                            isDarkMode: false,
                          ),
                        );
                      },
                    ),
                    24.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: UnderlinedTextField(
                            label: '${AppHelpers.trans(TrKeys.minQuantity)}*',
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: event.setMinQty,
                            validator: AppValidators.priceCheck,
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: UnderlinedTextField(
                            label: '${AppHelpers.trans(TrKeys.maxQuantity)}*',
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onChanged: event.setMaxQty,
                            validator: (value) =>
                                AppValidators.maxQtyCheck(
                                    value, state.minQty),
                          ),
                        ),
                      ],
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.trans(TrKeys.price)}*',
                      inputType: TextInputType.datetime,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: event.setPrice,
                      validator: AppValidators.priceCheck,
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.trans(TrKeys.quantity)}*',
                      inputType: TextInputType.number,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.next,
                      onChanged: event.setQuantity,
                      validator: AppValidators.priceCheck,
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.trans(TrKeys.tax)}*',
                      inputType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      onChanged: event.setTax,
                      validator: AppValidators.priceCheck,
                    ),
                    24.verticalSpace,
                    UnderlinedTextField(
                      label: '${AppHelpers.trans(TrKeys.qrcode)}*',
                      inputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      onChanged: event.setQrcode,
                      validator: AppValidators.emptyCheck,
                    ),
                    24.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppHelpers.trans(TrKeys.showProduct),
                          style: Style.interNormal(
                            size: 14.sp,
                            letterSpacing: -0.3,
                            color: Style.blackColor,
                          ),
                        ),
                        CustomToggle(
                          controller: ValueNotifier<bool>(state.active),
                          onChange: event.setActive,
                        ),
                      ],
                    ),
                    40.verticalSpace,
                    CustomButton(
                      title: AppHelpers.trans(TrKeys.save),
                      isLoading: state.isCreating,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          event.createProduct(context,
                              brandId: categoriesState
                                  .brand[categoriesState.activeBrandIndex]
                                  .brand
                                  ?.id,
                              categoryId: categoryState
                                  .categories[categoryState.activeIndex]
                                  .category
                                  ?.children?[categoryState.activeChildrenIndex]
                                  .id,
                              unitId: unitState.units[unitState.activeIndex].id,
                              created: () {
                            widget.onSave();
                            AppHelpers.showCheckTopSnackBar(
                              context,
                              text:
                                  AppHelpers.trans(TrKeys.successfullyCreated),
                              type: SnackBarType.success,
                            );
                            foodsEvent.fetchProducts(
                              isRefresh: true,
                              categoryId: categoriesState.activeIndex == 1
                                  ? null
                                  : categoriesState
                                      .categories[
                                          categoriesState.activeIndex - 2]
                                      .id,
                            );
                          }, onError: () {});
                        }
                      },
                    ),
                    20.verticalSpace,
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
