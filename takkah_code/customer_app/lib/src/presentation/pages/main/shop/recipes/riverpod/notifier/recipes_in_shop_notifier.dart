import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../repository/repository.dart';
import '../../../recipes/riverpod/state/recipes_in_shop_state.dart';

class RecipesInShopNotifier extends StateNotifier<RecipesInShopState> {
  final RecipesRepository _recipesRepository;

  RecipesInShopNotifier(this._recipesRepository)
      : super(const RecipesInShopState());

  Future<void> fetchRecipes({int? shopId}) async {
    state = state.copyWith(isLoading: true);
    final response = await _recipesRepository.getRecipesPaginate(
      shopId: shopId,
      page: 1,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, recipes: data.data ?? []);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get recipes failure: $fail');
      },
    );
  }
}
