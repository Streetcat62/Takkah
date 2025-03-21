import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:venderfoodyman/presentation/component/components.dart';

import '../../../../../../application/order_products/categories/product_categories_provider.dart';
import '../../../../../../infrastructure/services/app_assets.dart';
import '../../../../../../infrastructure/services/app_constants.dart';
import '../../../../../../infrastructure/services/app_helpers.dart';
import '../../../../../../infrastructure/services/tr_keys.dart';
import '../../../../../styles/style.dart';
import '../../details/food_details_modal.dart';

class SubCategoryProductsOrderPage extends ConsumerStatefulWidget {
  const SubCategoryProductsOrderPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubCategoryProductsState();
}

class _SubCategoryProductsState
    extends ConsumerState<SubCategoryProductsOrderPage> {
  @override
  Widget build(BuildContext context) {
    final categoriesState = ref.watch(productCategoriesProvider);

    return Scaffold(
      body: categoriesState.isCategoryLoading
          ? const LoadingList(
              itemPadding: 10,
              verticalPadding: 16,
              itemHeight: 188,
              itemCount: 10,
            )
          : categoriesState.categoryFoods.isNotEmpty
              ? AnimationLimiter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoriesState.categoryFoods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                            child: OrderFoodItem(
                                product: categoriesState.categoryFoods[index],
                                onTap: () =>
                                    AppHelpers.showCustomModalBottomSheet(
                                      paddingTop: 60,
                                      context: context,
                                      modal: FoodDetailsModal(
                                        product: categoriesState
                                            .categoryFoods[index],
                                      ),
                                      isDarkMode: false,
                                    ),
                                index: index)),
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
