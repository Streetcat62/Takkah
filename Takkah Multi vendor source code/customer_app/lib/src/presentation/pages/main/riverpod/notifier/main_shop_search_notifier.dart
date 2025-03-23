import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/main_shop_search_state.dart';
import '../../../../../repository/repository.dart';

class MainShopSearchNotifier extends StateNotifier<MainShopSearchState> {
  final ShopsRepository _shopsRepository;

  MainShopSearchNotifier(this._shopsRepository)
      : super(const MainShopSearchState());

  Future<void> searchShops({required String query}) async {
    state = state.copyWith(isLoading: true);
    final response = await _shopsRepository.searchShops(query: query);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, shops: data.data ?? []);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> search shops failure: $fail');
      },
    );
  }
}
