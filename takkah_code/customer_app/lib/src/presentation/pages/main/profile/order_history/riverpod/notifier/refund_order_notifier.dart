import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundaymart/src/presentation/pages/main/profile/order_history/riverpod/state/refund_order_state.dart';

import '../../../../../../../core/utils/app_connectivity.dart';
import '../../../../../../../core/utils/local_storage.dart';
import '../../../../../../../repository/orders_repository.dart';

class RefundOrderNotifier extends StateNotifier<RefundOrdersState> {
  final OrdersRepository _ordersRepository;

  RefundOrderNotifier(this._ordersRepository) : super(const RefundOrdersState());

  void setMessage(String text) {
    if(mounted) {
      state = state.copyWith(message: text.trim());
    }

  }

  Future<void> refundOrder({
    int? orderId,
    required BuildContext context,
    VoidCallback? checkYourNetwork,
    VoidCallback? success,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
        state = state.copyWith(isLoading: true);
        final response = await _ordersRepository.refundOrder(
            orderId: orderId,
            messageUser: state.message,
            userImage: LocalStorage.instance.getUser()?.img
        );
        response.when(
          success: (data) {
              state = state.copyWith(isLoading: false);
              success?.call();
          },
          failure: (fail, errorData) {
              state = state.copyWith(isLoading: false);
            debugPrint('==> refund order failure: $fail');
          },
        );


    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> fetchRefundOrder({VoidCallback? checkYourNetwork, int? orderID}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
        state = state.copyWith(isLoadingInfo: true);
        final response = await _ordersRepository.getOrderRefundInfo(
          orderId: orderID
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              isLoadingInfo: false,
              orderData: data
            );
          },
          failure: (fail, errorData) {
            state = state.copyWith(isLoadingInfo: false);
            debugPrint('==> get accepted orders failure: $fail');
          },
        );

    } else {
      checkYourNetwork?.call();
    }
  }


}