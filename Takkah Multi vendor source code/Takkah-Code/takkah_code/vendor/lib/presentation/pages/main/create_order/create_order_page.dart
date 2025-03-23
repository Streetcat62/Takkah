import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venderfoodyman/presentation/component/loading/grid_loading.dart';
import 'package:venderfoodyman/presentation/pages/main/create_order/shipping/widgets/gridview_container.dart';
import 'package:venderfoodyman/presentation/pages/main/foods/widgets/no_category.dart';

import '../../../styles/style.dart';
import 'details/food_details_modal.dart';
import '../../../component/components.dart';
import '../../../routes/app_router.gr.dart';
import '../../../../application/providers.dart';
import '../../../../infrastructure/services/services.dart';

class CreateOrderPage extends ConsumerStatefulWidget {
  const CreateOrderPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends ConsumerState<CreateOrderPage> {
  late RefreshController _categoryController;
  late RefreshController _productController;
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController =
        TextEditingController(text: ref.read(orderProductsProvider).query);

    _categoryController = RefreshController();
    _productController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(orderProductsProvider.notifier).fetchProducts(
              categoryId: null,
              isRefresh: ref.watch(productCategoriesProvider).activeIndex != 1
                  ? true
                  : false,
              isOpeningPage: true,
              cartStocks: ref.watch(orderCartProvider).products,
            );
        ref.read(productCategoriesProvider.notifier).initialFetchCategories();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _categoryController.dispose();
    _productController.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDisable(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Style.greyColor,
          body: Column(
            children: [
              CustomAppBar(
                bottomPadding: 4.h,
                child: Consumer(
                  builder: (context, ref, child) {
                    final productsEvent =
                        ref.read(orderProductsProvider.notifier);
                    final categoriesState =
                        ref.watch(productCategoriesProvider);
                    return SearchTextField(
                      textEditingController: _searchController,
                      onChanged: (value) => productsEvent.setQuery(
                        query: value,
                        categoryId: categoriesState.activeIndex == 1
                            ? null
                            : categoriesState
                                .categories[categoriesState.activeIndex - 2].id,
                        cartStocks: ref.watch(orderCartProvider).products,
                      ),
                      suffixIcon: Icon(
                        FlutterRemix.equalizer_fill,
                        color: Style.blackColor,
                        size: 20.r,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    24.verticalSpace,
                    Consumer(
                      builder: (context, ref, child) {
                        final categoriesState =
                            ref.watch(productCategoriesProvider);
                        final categoriesEvent =
                            ref.read(productCategoriesProvider.notifier);
                        final productsEvent =
                            ref.read(orderProductsProvider.notifier);
                        return categoriesState.isLoading
                            ? const TabBarLoading()
                            : SizedBox(
                                height: 36.h,
                                child: CategoriesTabBar(
                                  categories: categoriesState.categories,
                                  activeIndex: categoriesState.activeIndex,
                                  refreshController: _categoryController,
                                  onChangeTab: (index) {
                                    categoriesEvent.setActiveIndex(index);
                                    if (index != categoriesState.activeIndex) {
                                      index == 1
                                          ? productsEvent.fetchProducts(
                                              refreshController:
                                                  _productController,
                                              cartStocks: ref
                                                  .watch(orderCartProvider)
                                                  .products,
                                            )
                                          : categoriesEvent
                                              .fetchChildrenCategories(
                                              parentId: categoriesState
                                                      .categories[index - 2]
                                                      .category
                                                      ?.id ??
                                                  0,
                                            );
                                    }
                                  },
                                  onLoading: () =>
                                      categoriesEvent.fetchMoreCategories(
                                    refreshController: _categoryController,
                                  ),
                                ),
                              );
                      },
                    ),
                    8.verticalSpace,
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final categoriesEvent =
                              ref.read(productCategoriesProvider.notifier);
                          final productsState =
                              ref.watch(orderProductsProvider);
                          final categoriesState =
                              ref.watch(productCategoriesProvider);
                          final productsEvent =
                              ref.read(orderProductsProvider.notifier);
                          return categoriesState.activeIndex == 1
                              ? ProductsBody(
                                  loadingHeight: 130,
                                  isOrderFoods: true,
                                  isLoading: productsState.isLoading,
                                  products: productsState.products,
                                  refreshController: _productController,
                                  onRefreshing: () =>
                                      productsEvent.fetchProducts(
                                          cartStocks: ref
                                              .watch(orderCartProvider)
                                              .products,
                                          refreshController: _productController,
                                          isRefresh: true,
                                          categoryId: null),
                                  onLoading: () => productsEvent.fetchProducts(
                                      refreshController: _productController,
                                      cartStocks:
                                          ref.watch(orderCartProvider).products,
                                      categoryId: null),
                                  onProductTap: (index) =>
                                      AppHelpers.showCustomModalBottomSheet(
                                    paddingTop: 60,
                                    context: context,
                                    modal: FoodDetailsModal(
                                      product: productsState.products[index],
                                    ),
                                    isDarkMode: false,
                                  ),
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
                                            itemCount: categoriesState
                                                .mainCategory.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return AnimationConfiguration
                                                  .staggeredGrid(
                                                position: index,
                                                duration: const Duration(
                                                    milliseconds: 375),
                                                columnCount: index,
                                                child: ScaleAnimation(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      categoriesEvent
                                                          .fetchSubCategoryProducts(
                                                              categoryId:
                                                                  categoriesState
                                                                      .mainCategory[
                                                                          index]
                                                                      .id);
                                                      context.pushRoute(
                                                          const SubCategoryProductsOrderRoute());
                                                    },
                                                    child:
                                                        ButtonsBouncingEffect(
                                                      child: GridContainer(
                                                          image: categoriesState
                                                                  .mainCategory[
                                                                      index]
                                                                  .img ??
                                                              '',
                                                          title: categoriesState
                                                                  .mainCategory[
                                                                      index]
                                                                  .translation
                                                                  ?.title ??
                                                              ''),
                                                    ),
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
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Padding(
            padding: REdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const PopButton(heroTag: AppConstants.heroTagAddOrderButton),
                Consumer(
                  builder: (context, ref, child) {
                    final cartState = ref.watch(orderCartProvider);
                    return cartState.products.isNotEmpty
                        ? ButtonsBouncingEffect(
                            child: GestureDetector(
                              onTap: () =>
                                  context.pushRoute(const OrderRoute()),
                              child: Container(
                                height: 48.r,
                                decoration: BoxDecoration(
                                  color: Style.primaryColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                padding: REdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Text(
                                      AppHelpers.trans(TrKeys.ordering),
                                      style: Style.interSemi(
                                        size: 16.sp,
                                        color: Style.blackColor,
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    Container(
                                      height: 32.r,
                                      padding:
                                          REdgeInsets.symmetric(horizontal: 14),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Style.blackColor,
                                        borderRadius:
                                            BorderRadius.circular(18.r),
                                      ),
                                      child: Text(
                                        intl.NumberFormat.currency(
                                          symbol: LocalStorage.instance
                                              .getSelectedCurrency()
                                              ?.symbol,
                                        ).format(cartState.totalPrice),
                                        style: Style.interSemi(
                                          size: 16.sp,
                                          color: Style.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
