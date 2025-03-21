import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:venderfoodyman/presentation/component/components.dart';
import '../../../../../application/foods/edit/details/category/edit_food_categories_provider.dart';
import '../../../../../application/foods/edit/details/edit_food_details_provider.dart';
import '../../../../../application/foods/edit/details/units/edit_food_units_provider.dart';
import '../../../../../application/foods/foods_provider.dart';
import '../../../../../infrastructure/services/app_assets.dart';
import '../../../../../infrastructure/services/app_constants.dart';
import '../../../../../infrastructure/services/app_helpers.dart';
import '../../../../../infrastructure/services/tr_keys.dart';
import '../../../../styles/style.dart';
import '../edit/edit_product_modal.dart';

class SubCategoryProductsPage extends ConsumerStatefulWidget {
  const SubCategoryProductsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubCategoryProductsState();
}

class _SubCategoryProductsState extends ConsumerState<SubCategoryProductsPage> {
  @override
  Widget build(BuildContext context) {
    final productsState = ref.watch(foodsProvider);

    return Scaffold(
      body: productsState.isCategoryLoading
          ? const LoadingList(
              itemPadding: 10,
              verticalPadding: 16,
              itemHeight: 188,
              itemCount: 10,
            )
          : productsState.categoryFoods.isNotEmpty
              ? AnimationLimiter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: productsState.categoryFoods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          child: FoodItem(
                              spacing: 10,
                              product: productsState.categoryFoods[index],
                              onTap: () {
                                ref
                                    .read(editFoodDetailsProvider.notifier)
                                    .setFoodDetails(
                                        productsState.categoryFoods[index]);
                                ref
                                    .read(editFoodUnitsProvider.notifier)
                                    .setFoodUnit(productsState
                                        .categoryFoods[index].product?.unit);
                                ref
                                    .read(editFoodCategoriesProvider.notifier)
                                    .setFoodCategory(productsState
                                        .categoryFoods[index]
                                        .product
                                        ?.category);
                                AppHelpers.showCustomModalBottomSheet(
                                  paddingTop: 60,
                                  context: context,
                                  modal: EditProductModal(
                                    product: productsState.categoryFoods[index],
                                  ),
                                  isDarkMode: false,
                                );
                              }),
                        ),
                      );
                    },
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset(
                      AppAssets.noData,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      child: Text(
                        AppHelpers.trans(TrKeys.noProducts),
                        textAlign: TextAlign.center,
                        style: Style.interBold(),
                      ),
                    )
                  ],
                ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton:
          const PopButton(heroTag: AppConstants.heroTagAddOrderButton),
    );
  }
}
