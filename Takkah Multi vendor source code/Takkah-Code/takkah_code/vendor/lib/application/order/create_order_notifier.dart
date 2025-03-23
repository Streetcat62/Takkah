import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';
import 'create_order_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/models/models.dart';
import '../../infrastructure/services/services.dart';

class CreateOrderNotifier extends StateNotifier<CreateOrderState> {
  final OrdersRepository _ordersRepository;

  CreateOrderNotifier(this._ordersRepository,)
      : super(const CreateOrderState());

  Future<void> createOrder({
    required DeliveryType deliveryType,
    UserData? user,
    required List<ProductModel> stocks,
    required String deliveryDate,
    required int addressId,
    ValueChanged<int>? orderSuccess,
    Function(String)? failed,
  }) async {

    state = state.copyWith(isCreating: true);
    final response = await _ordersRepository.createOrder(
      deliveryType: deliveryType,
      user: user,
      stocks: stocks,
      deliveryTime: deliveryDate, addressId: addressId,

    );
    response.when(
      success: (data) async {
        state = state.copyWith(isCreating: false);
        orderSuccess?.call(data.data?.id ?? 0);
      },
      failure: (failure,status) {
        debugPrint('===> create order fail $failure');
        failed?.call(failure.toString());
        state = state.copyWith(isCreating: false);
      },
    );
  }
}
