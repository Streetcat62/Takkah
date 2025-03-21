import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/canceled_orders_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class CanceledOrdersNotifier extends StateNotifier<CanceledOrdersState> {
  final OrdersRepository _ordersRepository;
  int _page = 0;

  CanceledOrdersNotifier(this._ordersRepository)
      : super(const CanceledOrdersState());

  Future<void> fetchCanceledOrders({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true);
        final response = await _ordersRepository.getOrders(
          page: ++_page,
          status: OrderStatus.canceled,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              isLoading: false,
              canceledOrders: data.data ?? [],
              totalCanceledOrders: data.meta?.total ?? 0,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isLoading: false);
            debugPrint('==> get canceled orders failure: $fail');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _ordersRepository.getOrders(
          page: ++_page,
          status: OrderStatus.canceled,
        );
        response.when(
          success: (data) {
            final List<OrderData> newList = List.from(state.canceledOrders);
            newList.addAll(data.data ?? []);
            state =
                state.copyWith(isMoreLoading: false, canceledOrders: newList);
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get canceled orders failure: $fail');
          },
        );
      }
    } else {
      checkYourNetwork?.call();
    }
  }
}
