import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/checkout_payments_state.dart';
import '../../../../../../../../repository/repository.dart';

class CheckoutPaymentsNotifier extends StateNotifier<CheckoutPaymentsState> {
  final CartsRepository _cartsRepository;

  CheckoutPaymentsNotifier(this._cartsRepository)
      : super(const CheckoutPaymentsState());

  void setSelectedPayment(int index) {
    state = state.copyWith(selectedPaymentIndex: index);
  }

  Future<void> fetchPayments({int? shopId}) async {
    if (shopId == null) {
      return;
    }
    state =
        state.copyWith(isLoading: true, selectedPaymentIndex: 0, payments: []);
    final response = await _cartsRepository.getPayments(shopId: shopId);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, payments: data.data ?? []);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get payments failure: $fail');
      },
    );
  }

  void setPayment ( bool isValid) {
    state = state.copyWith(isValid: isValid);
  }
}
