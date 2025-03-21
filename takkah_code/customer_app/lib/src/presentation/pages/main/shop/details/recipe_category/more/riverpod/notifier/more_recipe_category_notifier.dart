import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/more_recipe_category_state.dart';
import '../../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../../repository/repository.dart';

class MoreRecipeCategoryNotifier
    extends StateNotifier<MoreRecipeCategoryState> {
  final RecipesRepository _recipesRepository;

  MoreRecipeCategoryNotifier(this._recipesRepository)
      : super(const MoreRecipeCategoryState());

  Future<void> fetchRecipeCategoryDetails({
    int? categoryId,
    VoidCallback? checkYourNetwork,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _recipesRepository.getRecipeCategoryDetails(
        recipeCategoryId: categoryId,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false, categoryData: data.data);
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get recipe category details failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
