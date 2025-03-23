import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../component/components.dart';
import '../../../../../../application/providers.dart';
import '../../../../../../infrastructure/services/services.dart';
import '../../../../../component/helper/category_one_shimmer.dart';

class FoodCategoriesModal extends ConsumerStatefulWidget {
  const FoodCategoriesModal({Key? key}) : super(key: key);

  @override
  ConsumerState<FoodCategoriesModal> createState() =>
      _FoodCategoriesModalState();
}

class _FoodCategoriesModalState extends ConsumerState<FoodCategoriesModal> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref
            .read(addFoodCategoriesProvider.notifier)
            .setCategories(ref.watch(foodCategoriesProvider).category);
        ref
            .watch(foodCategoriesProvider.notifier)
            .fetchCategories(context: context);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(foodCategoriesProvider);
    final stateItem = ref.watch(addFoodCategoriesProvider);
    return ModalWrap(
      body:  Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: state.isLoading ? const CategoryOneShimmer() :Column(
          children: [
            const ModalDrag(),
            TitleAndIcon(title: AppHelpers.trans(TrKeys.categories), titleSize: 16),
            24.verticalSpace,
            Expanded(
              child:  Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(addFoodCategoriesProvider);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        FoodCategoryItem(
                          title: state.categories[index].category
                              ?.translation?.title,
                          onTap: () {
                            if (state.categories[index].category?.children
                                ?.isNotEmpty ??
                                false) {
                              ref
                                  .read(
                                  addFoodCategoriesProvider.notifier)
                                  .setActiveIndex(index);
                            } else {
                              AppHelpers.showCheckTopSnackBar(context,
                                  text: AppHelpers.trans(TrKeys.noChildren),
                                  type: SnackBarType.error);
                            }
                          },
                          isSelected: state.categories[index].category
                              ?.children?.isEmpty ??
                              false
                              ? false
                              : ref
                              .watch(addFoodCategoriesProvider)
                              .activeIndex ==
                              index,
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: ref
                              .watch(addFoodCategoriesProvider)
                              .activeIndex ==
                              index
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
                                isSelected: ref
                                    .watch(addFoodCategoriesProvider)
                                    .activeChildrenIndex ==
                                    i,
                                onTap: () {
                                  ref
                                      .read(addFoodCategoriesProvider
                                      .notifier)
                                      .setActiveChildrenIndex(index, i);
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
            ),
            24.verticalSpace,
            CustomButton(
              title: AppHelpers.trans(TrKeys.close),
              onPressed: () {
                if(stateItem.activeChildrenIndex == -1) {
                  AppHelpers.showCheckTopSnackBar(context,
                      text: AppHelpers.trans(TrKeys.selectCategory),
                      type: SnackBarType.error);
                }
                else {
                  context.popRoute();
                }
              },
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );

  }
}
