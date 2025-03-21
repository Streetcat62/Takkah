import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class AddFoodCategoryModal extends StatelessWidget {
  const AddFoodCategoryModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(addCategoryProvider);
          final event = ref.read(addCategoryProvider.notifier);
          return Column(
            children: [
              TitleAndIcon(title: AppHelpers.trans(TrKeys.addNewCategory)),
              24.verticalSpace,
              UnderlinedTextField(
                label: AppHelpers.trans(TrKeys.categoryName),
                inputType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                onChanged: event.setTitle,
              ),
              36.verticalSpace,
              CustomButton(
                title: AppHelpers.trans(TrKeys.save),
                isLoading: state.isLoading,
                onPressed: () => event.createCategory(
                  context,
                  success: () {
                    ref
                        .read(addFoodCategoriesProvider.notifier)
                        .updateCategories(context);
                    context.popRoute();
                  },
                ),
              ),
              20.verticalSpace,
            ],
          );
        },
      ),
    );
  }
}
