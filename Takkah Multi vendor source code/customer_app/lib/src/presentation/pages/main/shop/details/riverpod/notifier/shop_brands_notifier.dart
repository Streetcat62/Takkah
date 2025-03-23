import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_brands_state.dart';
import '../../../../../../../repository/repository.dart';

class ShopBrandsNotifier extends StateNotifier<ShopBrandsState> {
  final CatalogRepository _brandsRepository;

  ShopBrandsNotifier(this._brandsRepository) : super(const ShopBrandsState());

  Future<void> fetchBrands({int? shopId}) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _brandsRepository.getBrandsPaginate(shopId: shopId, page: 1);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, brands: data.data ?? []);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get shop brands failure: $fail');
      },
    );
  }
}
