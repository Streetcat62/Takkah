import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_categories_state.dart';
import '../../../../../../../repository/repository.dart';

class ShopCategoriesNotifier extends StateNotifier<ShopCategoriesState> {
  final CatalogRepository _catalogRepository;

  ShopCategoriesNotifier(this._catalogRepository)
      : super(const ShopCategoriesState());

  Future<void> fetchShopCategories({int? shopId}) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _catalogRepository.getCategoriesPaginate(shopId: shopId);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, categories: data.data ?? []);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get shop categories failure: $fail');
      },
    );
  }
}
