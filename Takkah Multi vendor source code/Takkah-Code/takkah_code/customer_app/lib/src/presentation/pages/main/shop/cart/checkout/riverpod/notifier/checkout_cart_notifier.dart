import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/checkout_cart_state.dart';
import '../../../../../../../../repository/repository.dart';

class CheckoutCartNotifier extends StateNotifier<CheckoutCartState> {
  final CartsRepository _cartsRepository;

  CheckoutCartNotifier(this._cartsRepository)
      : super(const CheckoutCartState());

  void setDeliveryFee(num? price) {
    debugPrint('===> set delivery fee $price');
    debugPrint('===> set delivery fee ${price?.toDouble()}');
    state = state.copyWith(deliveryFee: price?.toDouble() ?? 0);
  }

  Future<void> fetchCartCalculations({int? cartId}) async {
    if (cartId == null) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _cartsRepository.getCartCalculate(cartId: cartId);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, calculateData: data.data);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get cart calculations failure: $fail');
      },
    );
  }
}
