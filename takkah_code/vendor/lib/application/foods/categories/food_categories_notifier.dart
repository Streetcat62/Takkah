import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/infrastructure/models/data/brand_data.dart';
import 'package:venderfoodyman/infrastructure/models/data/category.dart';
import 'package:venderfoodyman/infrastructure/models/data/main_category.dart';
import 'package:venderfoodyman/infrastructure/services/app_constants.dart';
import 'package:venderfoodyman/infrastructure/services/app_helpers.dart';
import 'food_categories_state.dart';
import '../../../../domain/interface/interfaces.dart';

class FoodCategoriesNotifier extends StateNotifier<FoodCategoriesState> {
  final CatalogRepository _catalogRepository;
  int _page = 0;
  bool _hasMore = true;

  FoodCategoriesNotifier(this._catalogRepository)
      : super(FoodCategoriesState(brandController: TextEditingController()));

  Future<void> initialFetchCategories() async {
    _page = 0;
    _hasMore = true;
    state = state.copyWith(activeIndex: 1, category: [], isLoading: true);
    final response = await _catalogRepository.getCategories(page: ++_page);
    response.when(
      success: (data) {
        final List<CategoryModel> categories = data.data ?? [];
        _hasMore = categories.length >= 10;
        state = state.copyWith(category: categories, isLoading: false);
      },
      failure: (failure, status) {
        debugPrint('====> initial fetch categories fail $failure');
        _page--;
        state = state.copyWith(isLoading: false);
      },
    );
  }

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    state = state.copyWith(activeIndex: index);
  }

  Future<void> fetchCategories({
    required BuildContext context,
    RefreshController? refreshController,
    bool openingPage = false,
  }) async {
    if (openingPage) {
      if (state.activeIndex != 1) {
        state = state.copyWith(activeIndex: 1);
      }
      if (state.category.isNotEmpty) {
        return;
      }
    }
    if (!_hasMore) {
      refreshController?.loadNoData();
      return;
    }
    if (_page == 0) {
      state = state.copyWith(isLoading: true);
    }
    final response = await _catalogRepository.getCategories(page: ++_page);
    response.when(
      success: (data) {
        List<CategoryModel> categories = List.from(state.category);
        final List<CategoryModel> newCategories = data.data ?? [];
        categories.addAll(newCategories);
        _hasMore = newCategories.length >= 10;
        if (_page == 1) {
          state = state.copyWith(isLoading: false, category: categories);
        } else {
          state = state.copyWith(category: categories);
        }
        refreshController?.loadComplete();
      },
      failure: (failure, status) {
        debugPrint('====> fetch categories fail $failure');
        _page--;
        if (_page == 0) {
          state = state.copyWith(isLoading: false);
        }
        AppHelpers.showCheckTopSnackBar(context,
            text: AppHelpers.trans(
              status.toString(),
            ),
            type: SnackBarType.error);
        refreshController?.loadFailed();
      },
    );
  }

  Future<void> fetchBrands(BuildContext context) async {
    if (state.brand.isNotEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _catalogRepository.getBrands();
    response.when(
      success: (data) {
        final List<MainBrand> brands = data.data ?? [];
        state = state.copyWith(brand: brands, isLoading: false);
        if (brands.isNotEmpty) {
          state.brandController?.text =
              brands[state.activeBrandIndex].brand?.title ?? '';
        }
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(context,
            text: AppHelpers.trans(
              status.toString(),
            ),
            type: SnackBarType.error);
        debugPrint('====> fetch units fail $failure');
      },
    );
  }

  void setActiveBrandIndex(int index) {
    if (state.activeBrandIndex == index) {
      return;
    }

    state = state.copyWith(activeBrandIndex: index);
    state.brandController?.text = state.brand[index].brand?.title ?? '';
  }

  void setBrands(List<MainBrand> brands) {
    if (state.brand.isEmpty) {
      _page = 0;
      state = state.copyWith(brand: brands, activeBrandIndex: 0);
      if (brands.isNotEmpty) {
        state.brandController?.text = state.brand[0].brand?.title ?? '';
      }
    }
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
        state = state.copyWith(mainCategory: [], isLoading: false);
      },
    );
  }
}
