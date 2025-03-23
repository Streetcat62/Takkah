import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/cart_total_state.dart';
import '../../../../../../../repository/repository.dart';

class CartTotalNotifier extends StateNotifier<CartTotalState> {
  final CartsRepository _cartsRepository;

  CartTotalNotifier(this._cartsRepository) : super(const CartTotalState());

  Future<void> fetchCartTotals({int? cartId}) async {
    state = state.copyWith(isLoading: true, calculateData: null);
    final response = await _cartsRepository.getCartCalculate(cartId: cartId);
    response.when(
      success: (data) {
        state = state.copyWith(calculateData: data.data, isLoading: false);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get cart calculate failure: $fail');
      },
    );
  }
}
