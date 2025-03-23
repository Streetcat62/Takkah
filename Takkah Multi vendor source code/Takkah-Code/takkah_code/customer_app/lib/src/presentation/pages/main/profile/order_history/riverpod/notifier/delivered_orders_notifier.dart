import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/delivered_orders_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class DeliveredOrdersNotifier extends StateNotifier<DeliveredOrdersState> {
  final OrdersRepository _ordersRepository;
  int _page = 0;

  DeliveredOrdersNotifier(this._ordersRepository)
      : super(const DeliveredOrdersState());

  void updateDeliveredOrders(BuildContext context) {
    _page = 0;
    fetchDeliveredOrders(
      checkYourNetwork: () {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
    );
  }

  Future<void> fetchDeliveredOrders({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true);
        final response = await _ordersRepository.getOrders(
          page: ++_page,
          status: OrderStatus.delivered,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              isLoading: false,
              deliveredOrders: data.data ?? [],
              totalDeliveredOrders: data.meta?.total ?? 0,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isLoading: false);
            debugPrint('==> get delivered orders failure: $fail');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _ordersRepository.getOrders(
          page: ++_page,
          status: OrderStatus.delivered,
        );
        response.when(
          success: (data) {
            final List<OrderData> newList = List.from(state.deliveredOrders);
            newList.addAll(data.data ?? []);
            state =
                state.copyWith(isMoreLoading: false, deliveredOrders: newList);
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get delivered orders failure: $fail');
          },
        );
      }
    } else {
      checkYourNetwork?.call();
    }
  }
}
