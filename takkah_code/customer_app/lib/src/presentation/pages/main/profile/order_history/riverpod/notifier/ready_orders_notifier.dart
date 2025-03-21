import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/ready_orders_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class ReadyOrdersNotifier extends StateNotifier<ReadyOrdersState> {
  final OrdersRepository _ordersRepository;
  int _page = 0;

  ReadyOrdersNotifier(this._ordersRepository) : super(const ReadyOrdersState());

  void updateReadyOrders(BuildContext context) {
    _page = 0;
    fetchReadyOrders(
      checkYourNetwork: () {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
    );
  }

  Future<void> fetchReadyOrders({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true);
        final response = await _ordersRepository.getOrders(
          page: ++_page,
          status: OrderStatus.ready,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              isLoading: false,
              readyOrders: data.data ?? [],
              totalReadyOrders: data.meta?.total ?? 0,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isLoading: false);
            debugPrint('==> get ready orders failure: $fail');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _ordersRepository.getOrders(
          page: ++_page,
          status: OrderStatus.ready,
        );
        response.when(
          success: (data) {
            final List<OrderData> newList = List.from(state.readyOrders);
            newList.addAll(data.data ?? []);
            state = state.copyWith(isMoreLoading: false, readyOrders: newList);
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get ready orders failure: $fail');
          },
        );
      }
    } else {
      checkYourNetwork?.call();
    }
  }
}
