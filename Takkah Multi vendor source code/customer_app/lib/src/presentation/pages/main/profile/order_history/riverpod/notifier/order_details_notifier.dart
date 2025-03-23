import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/order_details_state.dart';
import '../../../../../../../repository/repository.dart';

class OrderDetailsNotifier extends StateNotifier<OrderDetailsState> {
  final OrdersRepository _ordersRepository;

  OrderDetailsNotifier(this._ordersRepository)
      : super(const OrderDetailsState());

  Future<void> fetchOrderDetails({int? orderId}) async {
    state = state.copyWith(isLoading: true);
    final response = await _ordersRepository.getOrderDetails(orderId: orderId);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, orderData: data.data,isRefunded: data.data?.refundID != null);
      },
      failure: (fail, errorData) {
        debugPrint(errorData.toString());
        state = state.copyWith(isLoading: false);
        debugPrint('==> get order details failure: $fail');
      },
    );
  }
}
