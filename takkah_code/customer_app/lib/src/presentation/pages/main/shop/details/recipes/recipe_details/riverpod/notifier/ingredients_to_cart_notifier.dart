import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/ingredients_to_cart_state.dart';
import '../../../../../../../../../models/models.dart';
import '../../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../../repository/repository.dart';

class IngredientsToCartNotifier extends StateNotifier<IngredientsToCartState> {
  final CartsRepository _cartsRepository;

  IngredientsToCartNotifier(this._cartsRepository)
      : super(const IngredientsToCartState());

  void addedProducts(bool value) {
    state = state.copyWith(added: value);
  }

  Future<void> insertProducts({
    int? shopId,
    List<RecipeProduct>? products,
    VoidCallback? checkYourNetwork,
    VoidCallback? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await _cartsRepository.insertProducts(
        shopId: shopId,
        products: products,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false, added: true);
          success?.call();
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> insert products failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
