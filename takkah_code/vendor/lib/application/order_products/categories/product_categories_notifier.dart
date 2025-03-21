import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/infrastructure/models/data/category.dart';
import 'package:venderfoodyman/infrastructure/models/data/main_category.dart';
import '../../../infrastructure/models/data/product_model.dart';
import 'product_categories_state.dart';
import '../../../../domain/interface/interfaces.dart';

class ProductCategoriesNotifier extends StateNotifier<ProductCategoriesState> {
  final CatalogRepository _catalogRepository;
  final ProductsRepository _productsRepository;
  int _page = 0;
  bool _hasMore = true;

  ProductCategoriesNotifier(this._catalogRepository, this._productsRepository)
      : super(const ProductCategoriesState());

  Future<void> initialFetchCategories() async {
    if (state.categories.isNotEmpty) {
      if (state.activeIndex != 1) {
        state = state.copyWith(activeIndex: 1);
      }
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _catalogRepository.getCategories(page: ++_page);
    response.when(
      success: (data) {
        final List<CategoryModel> categories = data.data ?? [];
        _hasMore = categories.length >= 10;
        state = state.copyWith(categories: categories, isLoading: false);
      },
      failure: (fail, status) {
        debugPrint('===> initial fetch categories fail $fail');
        state = state.copyWith(isLoading: false);
        _page = 0;
      },
    );
  }

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    state = state.copyWith(activeIndex: index);
  }

  Future<void> fetchMoreCategories({
    RefreshController? refreshController,
    bool openingPage = false,
  }) async {
    if (!_hasMore) {
      refreshController?.loadNoData();
      return;
    }
    final response = await _catalogRepository.getCategories(page: ++_page);
    response.when(
      success: (data) {
        List<CategoryModel> categories = List.from(state.categories);
        final List<CategoryModel> newCategories = data.data ?? [];
        categories.addAll(newCategories);
        _hasMore = newCategories.length >= 10;
        state = state.copyWith(categories: categories);
        refreshController?.loadComplete();
      },
      failure: (failure, status) {
        debugPrint('====> fetch more categories fail $failure');
        _page--;
        refreshController?.loadFailed();
      },
    );
  }

  Future<void> fetchChildrenCategories({
    int? parentId,
    RefreshController? refreshController,
  }) async {
    refreshController?.resetNoData();
    _hasMore = true;
    _page = 0;
    state = state.copyWith(isMainLoading: true);
    final response = await _catalogRepository.getChildrenCategories(
      parentId: parentId ?? 0,
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<MainCategoryModel> categories = data.data ?? [];
        _hasMore = categories.length >= 10;
        state = state.copyWith(mainCategory: categories, isMainLoading: false);
      },
      failure: (fail, status) {
        debugPrint('===> fetch category products fail $fail');
        state = state.copyWith(mainCategory: [], isMainLoading: false);
      },
    );
  }
  Future<void> fetchSubCategoryProducts({
    int? categoryId,
  }) async {
    state = state.copyWith(isCategoryLoading: true);

    final response = await _productsRepository.getProducts(
      categoryId: categoryId,
     
    );
    response.when(
      success: (data) {
        state = state.copyWith(categoryFoods: []);
        List<ProductModel> products = List.from(state.categoryFoods);
        final List<ProductModel> newProducts = data.data ?? [];
        products.addAll(newProducts);

        state =
            state.copyWith(isCategoryLoading: false, categoryFoods: products);
      },
      failure: (failure, status) {
        debugPrint('====> fetch products fail $failure');
      },
    );
  }

}
