import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';

import 'foods_state.dart';
import '../../domain/interface/interfaces.dart';

class FoodsNotifier extends StateNotifier<FoodsState> {
  final ProductsRepository _productsRepository;
  int _page = 0;
  bool _hasMore = true;
  Timer? _timer;
  String _query = '';
  int? _categoryId;

  FoodsNotifier(this._productsRepository) : super(const FoodsState());

  Future<void> fetchMoreProducts({RefreshController? refreshController}) async {
    if (!_hasMore) {
      refreshController?.loadNoData();
      return;
    }
    final response = await _productsRepository.getProducts(
      page: ++_page,
      query: _query.isEmpty ? null : _query.trim(),
      categoryId: _categoryId,
    );
    response.when(
      success: (data) {
        List<ProductModel> products = List.from(state.foods);
        final List<ProductModel> newProducts = data.data ?? [];
        products.addAll(newProducts);
        _hasMore = newProducts.length >= 10;
        refreshController?.loadComplete();
        state = state.copyWith(foods: products);
      },
      failure: (fail, status) {
        debugPrint('===> fetch more products fail $fail');
        refreshController?.loadFailed();
      },
    );
  }

  Future<void> fetchCategoryProducts({
    int? categoryId,
    RefreshController? refreshController,
  }) async {
    _categoryId = categoryId;
    refreshController?.resetNoData();
    _hasMore = true;
    _page = 0;
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.getProducts(
      categoryId: _categoryId,
      query: _query.isEmpty ? null : _query.trim(),
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<ProductModel> products = data.data ?? [];
        _hasMore = products.length >= 10;
        state = state.copyWith(foods: products, isLoading: false);
      },
      failure: (fail, status) {
        debugPrint('===> fetch category products fail $fail');
        state = state.copyWith(foods: [], isLoading: false);
      },
    );
  }

  Future<void> initialFetchFoods() async {
    if (state.foods.isNotEmpty) {
      return;
    }
    _page = 0;
    _hasMore = true;
    _query = '';
    _categoryId = null;
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.getProducts(page: ++_page);
    response.when(
      success: (data) {
        List<ProductModel> products = data.data ?? [];
        _hasMore = products.length >= 10;
        state = state.copyWith(isLoading: false, foods: products);
      },
      failure: (fail, status) {
        debugPrint('===> fetch products fail $fail');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> refreshProducts({RefreshController? refreshController}) async {
    refreshController?.resetNoData();
    _hasMore = true;
    _page = 0;
    final response = await _productsRepository.getProducts(
      page: ++_page,
      categoryId: _categoryId,
      query: _query.isEmpty ? null : _query.trim(),
    );
    response.when(
      success: (data) {
        final List<ProductModel> products = data.data ?? [];
        state = state.copyWith(foods: products);
        _hasMore = products.length >= 10;
        refreshController?.refreshCompleted();
      },
      failure: (error, status) {
        debugPrint('===> initial fetch products fail $error');
        refreshController?.refreshFailed();
      },
    );
  }

  void updateSingleProduct(ProductModel? product) {
    List<ProductModel> products = List.from(state.foods);
    int? index;
    for (int i = 0; i < products.length; i++) {
      if (product?.id == products[i].id) {
        index = i;
      }
    }
    if (index != null && product != null) {
      products[index] = product;
      state = state.copyWith(foods: products);
    }
  }

  void setQuery({required String query, int? categoryId}) {
    if (_query == query) {
      return;
    }
    _query = query.trim();
    if (_query.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          fetchProducts(isRefresh: true, categoryId: categoryId);
        },
      );
    } else {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          fetchProducts(isRefresh: true, categoryId: categoryId);
        },
      );
    }
  }

  Future<void> fetchProducts({
    RefreshController? refreshController,
    bool isRefresh = false,
    bool isOpeningPage = false,
    int? categoryId,
  }) async {
    if (isRefresh) {
      _page = 0;
      _hasMore = true;
      refreshController?.requestRefresh();
      refreshController?.resetNoData();
    } else {
      if (state.foods.isNotEmpty && isOpeningPage) {
        return;
      }
    }
    if (!_hasMore) {
      refreshController?.loadNoData();
      return;
    }
    if (_page == 0 && !isRefresh) {
      state = state.copyWith(isLoading: true);
    }
    final response = await _productsRepository.getProducts(
      page: ++_page,
      categoryId: categoryId,
      query: _query.isEmpty ? null : _query,
    );
    response.when(
      success: (data) {
        List<ProductModel> products = isRefresh ? [] : List.from(state.foods);
        final List<ProductModel> newProducts = data.data ?? [];
        products.addAll(newProducts);
        _hasMore = newProducts.length >= 10;
        if (_page == 1 && !isRefresh) {
          state = state.copyWith(isLoading: false, foods: products);
        } else {
          state = state.copyWith(foods: products);
        }
        if (isRefresh) {
          refreshController?.refreshCompleted();
        } else {
          refreshController?.loadComplete();
        }
      },
      failure: (failure, status) {
        debugPrint('====> fetch products fail $failure');
        _page--;
        if (_page == 0) {
          state = state.copyWith(isLoading: false);
        }
        if (isRefresh) {
          refreshController?.refreshFailed();
        } else {
          refreshController?.loadFailed();
        }
      },
    );
  }

  Future<void> fetchSubCategoryProducts({
    int? categoryId,
  }) async {
    state = state.copyWith(isCategoryLoading: true);

    final response = await _productsRepository.getProducts(
      categoryId: categoryId,
      query: _query.isEmpty ? null : _query,
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
