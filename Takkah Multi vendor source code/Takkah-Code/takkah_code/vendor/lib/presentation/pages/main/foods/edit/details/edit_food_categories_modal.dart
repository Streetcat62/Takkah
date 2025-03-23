import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';

class EditFoodCategoriesModal extends ConsumerStatefulWidget {
  const EditFoodCategoriesModal({Key? key}) : super(key: key);

  @override
  ConsumerState<EditFoodCategoriesModal> createState() =>
      _EditFoodCategoriesScreenState();
}

class _EditFoodCategoriesScreenState
    extends ConsumerState<EditFoodCategoriesModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(editFoodCategoriesProvider.notifier)
          .setCategories(ref.watch(foodCategoriesProvider).category),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalWrap(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const ModalDrag(),
              TitleAndIcon(
                title: AppHelpers.trans(TrKeys.categories),
                titleSize: 16,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(editFoodCategoriesProvider);
                  final event = ref.read(editFoodCategoriesProvider.notifier);
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        FoodCategoryItem(
                          title: state
                              .categories[index].category?.translation?.title,
                          onTap: () => event.setActiveIndex(index),
                          isSelected: state.activeIndex == index,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.activeIndex == index
                              ? state.categories[index].category?.children
                                      ?.length ??
                                  0
                              : 0,
                          itemBuilder: (BuildContext context, int i) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: FoodCategoryItem(
                                title: state.categories[index].category
                                    ?.children?[i].translation?.title,
                                isSelected: state.activeChildrenIndex == i,
                                onTap: () {
                                  event.setActiveChildrenIndex(index, i);
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
