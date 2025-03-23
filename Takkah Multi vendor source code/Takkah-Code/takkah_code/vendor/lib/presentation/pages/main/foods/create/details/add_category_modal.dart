import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class AddCategoryModal extends StatefulWidget {
  const AddCategoryModal({Key? key}) : super(key: key);

  @override
  State<AddCategoryModal> createState() => _AddCategoryModalState();
}

class _AddCategoryModalState extends State<AddCategoryModal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(addCategoryProvider);
            final event = ref.read(addCategoryProvider.notifier);
            return Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ModalDrag(),
                  TitleAndIcon(title: AppHelpers.trans(TrKeys.addNewCategory)),
                  24.verticalSpace,
                  UnderlinedTextField(
                    label: AppHelpers.trans(TrKeys.categoryName),
                    inputType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    onChanged: event.setTitle,
                    validator: AppValidators.emptyCheck,
                  ),
                  36.verticalSpace,
                  CustomButton(
                    title: AppHelpers.trans(TrKeys.save),
                    isLoading: state.isLoading,
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        event.createCategory(
                          context,
                          success: () {
                            ref
                                .read(addFoodCategoriesProvider.notifier)
                                .updateCategories(context);
                            context.popRoute();
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
    );
  }
}
