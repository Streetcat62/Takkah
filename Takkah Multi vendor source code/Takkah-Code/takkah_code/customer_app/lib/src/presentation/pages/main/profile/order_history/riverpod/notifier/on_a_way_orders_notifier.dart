import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/on_a_way_orders_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class OnAWayOrdersNotifier extends StateNotifier<OnAWayOrdersState> {
  final OrdersRepository _ordersRepository;
  int _page = 0;

  OnAWayOrdersNotifier(this._ordersRepository)
      : super(const OnAWayOrdersState());

  void updateOnAWayOrders(BuildContext context) {
    _page = 0;
    fetchOnAWayOrders(
      checkYourNetwork: () {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
    );
  }

  Future<void> fetchOnAWayOrders({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true);
        final response = await _ordersRepository.getOrders(
          page: ++_page,
          status: OrderStatus.onAWay,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              isLoading: false,
              onAWayOrders: data.data ?? [],
              totalOnAWayOrders: data.meta?.total ?? 0,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isLoading: false);
            debugPrint('==> get on a way orders failure: $fail');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _ordersRepository.getOrders(
          page: ++_page,
          status: OrderStatus.onAWay,
        );
        response.when(
          success: (data) {
            final List<OrderData> newList = List.from(state.onAWayOrders);
            newList.addAll(data.data ?? []);
            state = state.copyWith(isMoreLoading: false, onAWayOrders: newList);
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get on a way orders failure: $fail');
          },
        );
      }
    } else {
      checkYourNetwork?.call();
    }
  }
}
