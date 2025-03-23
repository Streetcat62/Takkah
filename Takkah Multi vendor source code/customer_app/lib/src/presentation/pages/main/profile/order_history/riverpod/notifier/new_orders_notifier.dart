import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/new_orders_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class NewOrdersNotifier extends StateNotifier<NewOrdersState> {
  final OrdersRepository _ordersRepository;
  int _page = 0;

  NewOrdersNotifier(this._ordersRepository) : super(const NewOrdersState());

  void updateNewOrders() {
    _page = 0;
    fetchNewOrders();
  }

  Future<void> fetchNewOrders() async {
    if (_page == 0) {
      state = state.copyWith(isLoading: true);
      final response = await _ordersRepository.getOrders(
        page: ++_page,
        status: OrderStatus.newOrders,
      );
      response.when(
        success: (data) {
          state = state.copyWith(
            isLoading: false,
            newOrders: data.data ?? [],
            totalNewOrders: data.meta?.total ?? 0,
          );
        },
        failure: (fail, errorData) {
          _page--;
          state = state.copyWith(isLoading: false);
          debugPrint('==> get new orders failure: $fail');
        },
      );
    } else {
      state = state.copyWith(isMoreLoading: true);
      final response = await _ordersRepository.getOrders(
        page: ++_page,
        status: OrderStatus.newOrders,
      );
      response.when(
        success: (data) {
          final List<OrderData> newList = List.from(state.newOrders);
          newList.addAll(data.data ?? []);
          state = state.copyWith(isMoreLoading: false, newOrders: newList);
        },
        failure: (fail, errorData) {
          _page--;
          state = state.copyWith(isMoreLoading: false);
          debugPrint('==> get new orders failure: $fail');
        },
      );
    }
  }
}
