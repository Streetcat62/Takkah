import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/accepted_orders_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class AcceptedOrdersNotifier extends StateNotifier<AcceptedOrdersState> {
  final OrdersRepository _ordersRepository;
  int _page = 0;

  AcceptedOrdersNotifier(this._ordersRepository)
      : super(const AcceptedOrdersState());

  void updateAcceptedOrders(BuildContext context) {
    _page = 0;
    fetchAcceptedOrders(
      checkYourNetwork: () {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
    );
  }

  Future<void> fetchAcceptedOrders({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true);
        final response = await _ordersRepository.getOrders(
          page: ++_page,
          status: OrderStatus.accepted,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              isLoading: false,
              acceptedOrders: data.data ?? [],
              totalAcceptedOrders: data.meta?.total ?? 0,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isLoading: false);
            debugPrint('==> get accepted orders failure: $fail');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _ordersRepository.getOrders(
          page: ++_page,
          status: OrderStatus.accepted,
        );
        response.when(
          success: (data) {
            final List<OrderData> newList = List.from(state.acceptedOrders);
            newList.addAll(data.data ?? []);
            state =
                state.copyWith(isMoreLoading: false, acceptedOrders: newList);
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get accepted orders failure: $fail');
          },
        );
      }
    } else {
      checkYourNetwork?.call();
    }
  }
}
