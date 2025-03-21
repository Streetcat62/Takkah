import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../styles/style.dart';
import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class EditFoodDetailsBody extends StatefulWidget {
  final Function() onSave;

  const EditFoodDetailsBody({Key? key, required this.onSave}) : super(key: key);

  @override
  State<EditFoodDetailsBody> createState() => _EditFoodDetailsBodyState();
}

class _EditFoodDetailsBodyState extends State<EditFoodDetailsBody> {
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
              final state = ref.watch(editFoodDetailsProvider);
              final event = ref.read(editFoodDetailsProvider.notifier);

              return state.product == null
                  ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3.r,
                        color: Style.primaryColor,
                      ),
                    )
                  : Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          2.verticalSpace,
                          Text(
                            AppHelpers.trans(TrKeys.editProduct),
                            style: Style.interSemi(),
                          ),
                          24.verticalSpace,
                          HorizontalImagePicker(
                            imageUrl: state.product?.product?.img,
                            imageFilePath: state.imageFilePath,
                            onImageChange: event.setImageFile,
                            onDelete: () => event.setImageFile(null),
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            readOnly: true,
                            label: AppHelpers.trans(TrKeys.productTitle),
                            inputType: TextInputType.text,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: event.setTitle,
                            initialText:
                                state.product?.product?.translation?.title,
                            validator: AppValidators.emptyCheck,
                          ),
                          24.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: UnderlinedTextField(
                                  label:
                                      '${AppHelpers.trans(TrKeys.minQuantity)}*',
                                  inputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  initialText:
                                      state.product?.minQty.toString() ?? '',
                                  onChanged: event.setMinQty,
                                  validator: AppValidators.priceCheck,
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: UnderlinedTextField(
                                  label:
                                      '${AppHelpers.trans(TrKeys.maxQuantity)}*',
                                  inputType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  initialText:
                                      state.product?.maxQty.toString() ?? '',
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
                            initialText: '${state.product?.quantity}',
                            label: '${AppHelpers.trans(TrKeys.quantity)}*',
                            inputType: TextInputType.number,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: event.setQuantity,
                            validator: AppValidators.priceCheck,
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            initialText: '${state.product?.price}',
                            label: '${AppHelpers.trans(TrKeys.price)}*',
                            inputType: TextInputType.number,
                            textCapitalization: TextCapitalization.sentences,
                            textInputAction: TextInputAction.next,
                            onChanged: event.setPrice,
                            validator: AppValidators.priceCheck,
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            label: '${AppHelpers.trans(TrKeys.tax)}*',
                            inputType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            initialText: state.product?.tax.toString(),
                            onChanged: event.setTax,
                            validator: AppValidators.priceCheck,
                          ),
                          24.verticalSpace,
                          UnderlinedTextField(
                            readOnly: true,
                            label: AppHelpers.trans(TrKeys.qrcode),
                            inputType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            onChanged: event.setBarcode,
                            initialText: state.product?.product?.qrCode ?? '',
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
                                controller: ValueNotifier<bool>(
                                    state.product?.active == 0 ? false : true),
                                onChange: event.setActive,
                              ),
                            ],
                          ),
                          40.verticalSpace,
                          CustomButton(
                            title: AppHelpers.trans(TrKeys.save),
                            isLoading: state.isLoading,
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                event.updateProduct(
                                  context,
                                  failed: () => AppHelpers.showCheckTopSnackBar(
                                    context,
                                    text: AppHelpers.trans(TrKeys.updateFailed),
                                    type: SnackBarType.error,
                                  ),
                                  onSuccess: () {
                                    AppHelpers.showCheckTopSnackBar(
                                      context,
                                      text: AppHelpers.trans(
                                          TrKeys.successfullyUpdated),
                                      type: SnackBarType.success,
                                    );
                                    ref
                                        .read(foodsProvider.notifier)
                                        .refreshProducts();
                                    widget.onSave();
                                  },
                                );
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
