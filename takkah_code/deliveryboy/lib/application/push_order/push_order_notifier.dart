import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/interface/interfaces.dart';
import '../../infrastructure/models/models.dart';
import 'push_order_state.dart';
import '../../infrastructure/services/services.dart';

class PushOrderNotifier extends StateNotifier<PushOrderState> {
  Timer? _timer;
  int _initialTime = AppHelpers.getAppDeliveryTime();
  final UserRepository _userRepository;

  PushOrderNotifier(this._userRepository) : super(const PushOrderState());

  Future<void> attachOrder(
    BuildContext context, {
    String? orderId,
    OrderDetailData? order,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.setOrder(orderId ?? '0');
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
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

  void startTimer() {
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
