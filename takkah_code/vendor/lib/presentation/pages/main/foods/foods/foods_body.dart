import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/presentation/component/loading/grid_loading.dart';
import 'package:venderfoodyman/presentation/pages/main/create_order/shipping/widgets/gridview_container.dart';
import 'package:venderfoodyman/presentation/pages/main/foods/widgets/no_category.dart';
import 'package:venderfoodyman/presentation/routes/app_router.gr.dart';
import '../edit/edit_product_modal.dart';
import '../../../../component/components.dart';
import '../../../../../application/providers.dart';
import '../../../../../infrastructure/services/services.dart';

class FoodsBody extends StatelessWidget {
  final RefreshController categoryController;
  final RefreshController productController;
  final ScrollController scrollController;
  const FoodsBody({
    Key? key,
    required this.categoryController,
    required this.productController,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        Consumer(
          builder: (context, ref, child) {
            final categoriesState = ref.watch(foodCategoriesProvider);
            final categoriesEvent = ref.read(foodCategoriesProvider.notifier);
            final productsEvent = ref.read(foodsProvider.notifier);
            return categoriesState.isLoading
                ? const TabBarLoading()
                : SizedBox(
                    height: 36.h,
                    child: CategoriesTabBar(
                      categories: categoriesState.category,
                      activeIndex: categoriesState.activeIndex,
                      refreshController: categoryController,
                      onChangeTab: (index) {
                        categoriesEvent.setActiveIndex(index);
                        if (index != categoriesState.activeIndex) {
                          index == 1
                              ? productsEvent.fetchProducts()
                              : categoriesEvent.fetchChildrenCategories(
                                  parentId: categoriesState
                                          .category[index - 2].category?.id ??
                                      0,
                                );
                        }
                      },
                      onLoading: () => categoriesEvent.fetchCategories(
                        context: context,
                        refreshController: categoryController,
                      ),
                    ),
                  );
          },
        ),
        8.verticalSpace,
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final categoriesState = ref.watch(foodCategoriesProvider);
              final productsState = ref.watch(foodsProvider);
              final productsEvent = ref.read(foodsProvider.notifier);
              return categoriesState.activeIndex == 1
                  ? ProductsBody(
                      scrollController: scrollController,
                      itemSpacing: 10,
                      isLoading: productsState.isLoading,
                      products: productsState.foods,
                      refreshController: productController,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      onRefreshing: () => productsEvent.refreshProducts(
                        refreshController: productController,
                      ),
                      onLoading: () => productsEvent.fetchMoreProducts(
                        refreshController: productController,
                      ),
                      onProductTap: (index) {
                        ref
                            .read(editFoodDetailsProvider.notifier)
                            .setFoodDetails(productsState.foods[index]);
                        ref.read(editFoodUnitsProvider.notifier).setFoodUnit(
                            productsState.foods[index].product?.unit);
                        ref
                            .read(editFoodCategoriesProvider.notifier)
                            .setFoodCategory(
                                productsState.foods[index].product?.category);
                        AppHelpers.showCustomModalBottomSheet(
                          paddingTop: 60,
                          context: context,
                          modal: EditProductModal(
                            product: productsState.foods[index],
                          ),
                          isDarkMode: false,
                        );
                      },
                    )
                  : categoriesState.isMainLoading
                      ? const GridLoading()
                      : categoriesState.mainCategory.isNotEmpty
                          ? AnimationLimiter(
                              child: GridView.builder(
                                padding: const EdgeInsets.all(16),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        mainAxisSpacing: 16,
                                        crossAxisSpacing: 16,
                                        mainAxisExtent: 110.r,
                                        maxCrossAxisExtent: 110.r),
                                itemCount: categoriesState.mainCategory.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    columnCount: index,
                                    child: ScaleAnimation(
                                      child: GestureDetector(
                                        onTap: () {
                                          productsEvent
                                              .fetchSubCategoryProducts(
                                                  categoryId: categoriesState
                                                      .mainCategory[index].id);
                                          context.pushRoute(
                                              const SubCategoryProductsRoute());
                                        },
                                        child: ButtonsBouncingEffect(
                                            child: GridContainer(
                                                image: categoriesState
                                                        .mainCategory[index]
                                                        .img ??
                                                    '',
                                                title: categoriesState
                                                        .mainCategory[index]
                                                        .translation
                                                        ?.title ??
                                                    '')),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : const NoCategory();
            },
          ),
        ),
      ],
    );
  }
}
