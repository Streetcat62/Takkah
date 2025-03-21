import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'new_alert_order_state.dart';
import '../../../domain/interface/interfaces.dart';
import '../../../infrastructure/services/services.dart';

class NewAlertOrderNotifier extends StateNotifier<NewAlertOrderState> {
  Timer? _timer;
  int _initialTime = AppHelpers.getAppDeliveryTime();
  final OrdersRepository _ordersRepository;

  NewAlertOrderNotifier(this._ordersRepository)
      : super(const NewAlertOrderState());

  Future<void> fetchOrderDetails({int? orderId}) async {
    state = state.copyWith(isLoading: true);
    final response = await _ordersRepository.showOrders(orderId);
    response.when(
      success: (data) {
        state = state.copyWith(order: data.data, isLoading: false);
        _startTimer();
      },
      failure: (fail, status) {
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> attachOrder(
    BuildContext context, {
    VoidCallback? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isSaving: true);
      final response =
          await _ordersRepository.acceptAlertOrder(state.order?.id);
      response.when(
        success: (data) {
          state = state.copyWith(isSaving: false);
          success?.call();
        },
        failure: (failure, status) {
          state = state.copyWith(isSaving: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  void disposeTimer() {
    _timer?.cancel();
  }

  void _startTimer() {
    _timer?.cancel();
    _initialTime = AppHelpers.getAppDeliveryTime();
    if (_timer != null) {
      _initialTime = AppHelpers.getAppDeliveryTime();
      _timer?.cancel();
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_initialTime < 1) {
          _timer?.cancel();
          state = state.copyWith(isTimeOut: true);
        } else {
          _initialTime--;
          state = state.copyWith(
            isTimeOut: false,
            timerText: '$_initialTime s',
          );
        }
      },
    );
  }
}
