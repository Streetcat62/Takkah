import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/recipe_categories_state.dart';
import '../../../../../../../repository/repository.dart';

class RecipeCategoriesNotifier extends StateNotifier<RecipeCategoriesState> {
  final RecipesRepository _recipesRepository;

  RecipeCategoriesNotifier(this._recipesRepository)
      : super(const RecipeCategoriesState());

  Future<void> fetchRecipeCategories({int? shopId}) async {
    state = state.copyWith(isLoading: true);
    final response = await _recipesRepository.getRecipeCategoriesPaginate(
      shopId: shopId,
      page: 1,
    );
    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          recipeCategories: data.data ?? [],
        );
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get recipe categories failure: $fail');
      },
    );
  }
}
