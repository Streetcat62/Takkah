import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/all_recipe_categories_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';

class AllRecipeCategoriesNotifier
    extends StateNotifier<AllRecipeCategoriesState> {
  final RecipesRepository _recipesRepository;
  int _page = 0;

  AllRecipeCategoriesNotifier(this._recipesRepository)
      : super(const AllRecipeCategoriesState());

  Future<void> fetchRecipeCategories({
    VoidCallback? checkYourNetwork,
    int? shopId,
  }) async {
    if (!state.hasMore) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true);
        final response = await _recipesRepository.getRecipeCategoriesPaginate(
          page: ++_page,
          shopId: shopId,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              isLoading: false,
              recipeCategories: data.data ?? [],
              hasMore: (data.data ?? []).length >= 14,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isLoading: false, hasMore: false);
            debugPrint('==> get recipe categories failure: $fail');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response =
            await _recipesRepository.getRecipeCategoriesPaginate(page: ++_page);
        response.when(
          success: (data) {
            final List<RecipeCategoryData> newList =
                List.from(state.recipeCategories);
            newList.addAll(data.data ?? []);
            state = state.copyWith(
              isMoreLoading: false,
              recipeCategories: newList,
              hasMore: (data.data ?? []).length >= 14,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get recipe categories failure: $fail');
          },
        );
      }
    } else {
      checkYourNetwork?.call();
    }
  }
}
