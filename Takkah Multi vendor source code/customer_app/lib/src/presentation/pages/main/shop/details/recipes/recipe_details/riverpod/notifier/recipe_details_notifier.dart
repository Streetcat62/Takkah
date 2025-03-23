import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/recipe_details_state.dart';
import '../../../../../../../../../models/models.dart';
import '../../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../../repository/repository.dart';

class RecipeDetailsNotifier extends StateNotifier<RecipeDetailsState> {
  final RecipesRepository _recipesRepository;

  RecipeDetailsNotifier(this._recipesRepository)
      : super(const RecipeDetailsState());

  void decreaseRecipeProductCount(int? index) {
    if (index == null) {
      return;
    }
    List<RecipeProduct> products =
        List.from(state.recipeData?.recipeProducts ?? []);
    if (products.length < index) {
      return;
    }
    final int qty = products[index].quantity ?? 0;
    final int measurement =
        int.tryParse(products[index].measurement ?? '0') ?? 0;
    if (qty <= measurement) {
      return;
    }
    products[index] = products[index].copyWith(quantity: qty - 1);
    state = state.copyWith(
      recipeData: state.recipeData?.copyWith(recipeProducts: products),
    );
  }

  void increaseRecipeProductCount(int? index) {
    if (index == null) {
      return;
    }
    List<RecipeProduct> products =
        List.from(state.recipeData?.recipeProducts ?? []);
    if (products.length < index) {
      return;
    }
    final int qty = products[index].quantity ?? 0;
    products[index] = products[index].copyWith(quantity: qty + 1);
    state = state.copyWith(
      recipeData: state.recipeData?.copyWith(recipeProducts: products),
    );
  }

  Future<void> fetchRecipeDetails({
    int? recipeId,
    VoidCallback? checkYourNetwork,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response =
          await _recipesRepository.getRecipeDetails(recipeId: recipeId);
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false, recipeData: data.data);
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get recipe details failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
