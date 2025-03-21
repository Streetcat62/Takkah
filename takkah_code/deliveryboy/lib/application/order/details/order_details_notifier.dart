import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_details_state.dart';
import '../../../domain/interface/interfaces.dart';
import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/services/services.dart';

class OrderDetailsNotifier extends StateNotifier<OrderDetailsState> {
  final UserRepository _userRepository;

  OrderDetailsNotifier(this._userRepository) : super(const OrderDetailsState());

  Future<void> updateToDelivered(
    BuildContext context, {
    VoidCallback? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response =
          await _userRepository.updateOrder(state.order?.id ?? 0, 'delivered');
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false);
          success?.call();
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

  void setInitialOrder(OrderDetailData order) {
    state = state.copyWith(order: order);
  }

  Future<void> updateToOnAWay(
    BuildContext context, {
    VoidCallback? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response =
          await _userRepository.updateOrder(state.order?.id ?? 0, 'on_a_way');
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false, order: data.data);
          success?.call();
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
}
