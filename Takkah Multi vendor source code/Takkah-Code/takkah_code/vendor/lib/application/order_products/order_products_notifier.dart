import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';
import 'order_products_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/services/services.dart';

class OrderProductsNotifier extends StateNotifier<OrderProductsState> {
  final ProductsRepository _productsRepository;
  int _page = 0;
  bool _hasMore = true;
  Timer? _timer;

  OrderProductsNotifier(this._productsRepository)
      : super(const OrderProductsState());

  void updateProducts({required List<ProductModel> productStocks}) {
    List<ProductModel> products = List.from(state.products);
    for (int i = 0; i < products.length; i++) {
      products[i] = products[i].copyWith(cartCount: 0);
      int count = 0;
      int? index;
      for (final stock in productStocks) {
        if (stock.id == products[i].id) {
          count += stock.cartCount ?? 0;
          index = i;
        }
      }
      if (index != null) {
        products[index] = products[index].copyWith(cartCount: count);
      }
    }
    state = state.copyWith(products: products);
  }

  void setQuery({
    required String query,
    required List<ProductModel> cartStocks,
    int? categoryId,
  }) {
    if (state.query == query) {
      return;
    }
    state = state.copyWith(query: query.trim());
    if (state.query.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          fetchProducts(
            isRefresh: true,
            categoryId: categoryId,
            cartStocks: cartStocks,
          );
        },
      );
    } else {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          fetchProducts(
            isRefresh: true,
            categoryId: categoryId,
            cartStocks: cartStocks,
          );
        },
      );
    }
  }

  Future<void> fetchProducts({
    RefreshController? refreshController,
    bool isRefresh = false,
    bool isOpeningPage = false,
    int? categoryId,
    required List<ProductModel> cartStocks,
  }) async {
    if (isRefresh) {
      _page = 0;
      _hasMore = true;
      refreshController?.requestRefresh();
    } else {
      if (state.products.isNotEmpty && isOpeningPage) {
        List<ProductModel> products = List.from(state.products);
        for (int i = 0; i < products.length; i++) {
          products[i] = products[i].copyWith(cartCount: 0);
          for (final stock in cartStocks) {
            if (stock.id == products[i].id) {
              final int count = products[i].cartCount ?? 0;
              products[i] = products[i].copyWith(
                cartCount: count + (stock.cartCount ?? 0),
              );
            }
          }
        }
        state = state.copyWith(products: products);
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
      query: state.query.isEmpty ? null : state.query,
      status: ProductStatus.published,
    );
    response.when(
      success: (data) {
        List<ProductModel> products =
            isRefresh ? [] : List.from(state.products);
        final List<ProductModel> newProducts = data.data ?? [];
        products.addAll(newProducts);
        for (int i = 0; i < products.length; i++) {
          for (final stock in cartStocks) {
            if (stock.id == products[i].id) {
              final int count = products[i].cartCount ?? 0;
              products[i] = products[i].copyWith(
                cartCount: count + (stock.cartCount ?? 0),
              );
            }
          }
        }
        _hasMore = newProducts.length >= 10;
        if (_page == 1 && !isRefresh) {
          state = state.copyWith(isLoading: false, products: products);
        } else {
          state = state.copyWith(products: products);
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
}
