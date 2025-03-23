import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';

import '../../../../infrastructure/models/data/user_address_model.dart';
import '../../../../infrastructure/services/services.dart';
import 'order_payment_state.dart';
import '../../../../domain/interface/interfaces.dart';
import '../../../../infrastructure/models/models.dart';

class OrderPaymentNotifier extends StateNotifier<OrderPaymentState> {
  final OrdersRepository _ordersRepository;

  OrderPaymentNotifier(this._ordersRepository)
      : super(const OrderPaymentState());

  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  void clearSelectedPaymentInfo() {
    state = state.copyWith(selectedIndex: 0);
  }

  void setSelectedPayment(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> fetchPayments() async {
    if (state.payments.isNotEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _ordersRepository.getPayments();
    response.when(
      success: (data) {
        final List<Payment> payments = data.data ?? [];
        List<Payment> filtered = [];
        for (final payment in payments) {
          if (payment.payment?.tag?.toLowerCase() == 'wallet' ||
              payment.payment?.tag?.toLowerCase() == 'cash') {
            filtered.add(payment);
          }
        }
        state = state.copyWith(
          payments: filtered,
          selectedIndex: 0,
          isLoading: false,
        );
      },
      failure: (error, status) {
        debugPrint('====> fetch payments fail $error');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> createTransaction(
      BuildContext context, int orderId, int? paymentId) async {
    var response = await _ordersRepository.createTransaction(
        orderId: orderId, paymentId: paymentId ?? 0);
    response.when(
      success: (data) {},
      failure: (error, status) {
        debugPrint('====> fetch payments fail $error');
        AppHelpers.showCheckTopSnackBar(context,
            text: AppHelpers.trans(
              status.toString(),
            ),
            type: SnackBarType.error);
      },
    );
  }

  Future<void> getCalculate({
    required List<ProductModel> products,
    required String type,
    required Location? location,
  }) async {
    state = state.copyWith(isCalculateLoading: true);
    final response = await _ordersRepository.getCalculate(
      stocks: products,
      type: type,
      location: location,
    );
    response.when(
      success: (data) {
        state = state.copyWith(
          orderCalculate: data.data,
          isCalculateLoading: false,
        );
      },
      failure: (error, status) {
        debugPrint('====> get calculate fail $error');
        state = state.copyWith(isCalculateLoading: false);
      },
    );
  }

  Future<void> getDeliveryFee({
    required Location? location,
  }) async {
    state = state.copyWith(isCalculateLoading: true);
    final response = await _ordersRepository.getDeliveryFee(
      location: location,
    );
    response.when(
      success: (data) {
        state = state.copyWith(
          deliveryfee: data.data,
          isCalculateLoading: false,
        );
      },
      failure: (error, status) {
        debugPrint('====> get deliveryFee fail $error');
        state = state.copyWith(isCalculateLoading: false);
      },
    );
  }
}
