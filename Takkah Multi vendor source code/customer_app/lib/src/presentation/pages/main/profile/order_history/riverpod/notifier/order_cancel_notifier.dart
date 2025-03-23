import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/order_cancel_state.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class OrderCancelNotifier extends StateNotifier<OrderCancelState> {
  final OrdersRepository _ordersRepository;

  OrderCancelNotifier(this._ordersRepository) : super(const OrderCancelState());

  Future<void> cancelOrder({
    int? orderId,
    VoidCallback? checkYourNetwork,
    VoidCallback? canceled,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _ordersRepository.cancelOrder(orderId: orderId);
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false);
          canceled?.call();
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> cancel order failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
