import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/order_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  final OrdersRepository _ordersRepository;
  final UserRepository _userRepository;

  OrderNotifier(this._ordersRepository, this._userRepository)
      : super(const OrderState());

  Future<int?> createAddress(LocalAddressData? address) async {
    final response = await _userRepository.createAddress(address);
    int? addressId;
    response.when(
      success: (data) {
        addressId = data.data?.id;
        final List<LocalAddressData> localAddresses =
            List.from(LocalStorage.instance.getLocalAddressesList());
        int index = 0;
        for (int i = 0; i < localAddresses.length; i++) {
          if (address?.location == localAddresses[i].location) {
            index = i;
            break;
          }
        }
        localAddresses[index] = LocalAddressData(
          id: data.data?.id,
          title: data.data?.title,
          address: data.data?.address,
          location: address?.location,
          isDefault: data.data?.isDefault,
          isSelected: address?.isSelected,
        );
        LocalStorage.instance.setLocalAddressesList(localAddresses);
      },
      failure: (fail, errorData) {
        debugPrint('==> address creating failure: $fail');
      },
    );
    return addressId;
  }

  Future<void> fetchProfileDetails() async {
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.instance.setUser(data.data);
        if (data.data?.wallet != null) {
          LocalStorage.instance.setWallet(data.data?.wallet);
        }
      },
      failure: (fail, errorData) {
        debugPrint('==> get profile details failure: $fail');
      },
    );
  }

  Future<void> createTransaction({int? orderId, int? paymentId}) async {
    final response = await _ordersRepository.createTransaction(
      orderId: orderId,
      paymentId: paymentId,
    );
    response.when(
      success: (data) {
        debugPrint('===> transaction created id: ${data.data?.id}');
      },
      failure: (fail, errorData) {
        debugPrint('===> transaction creation failed $fail');
      },
    );
  }

  Future<void> createOrder({
    VoidCallback? checkYourNetwork,
    VoidCallback? orderSuccess,
    int? shopId,
    double? total,
    double? deliveryFee,
    String? coupon,
    LocalAddressData? address,
    double? totalDiscount,
    int? deliveryTypeId,
    double? tax,
    String? deliveryDate,
    String? deliveryTime,
    int? cartId,
    int? paymentId,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _ordersRepository.createOrder(
        shopId: shopId,
        total: total,
        deliveryFee: deliveryFee,
        coupon: (coupon?.isEmpty ?? true) ? null : coupon,
        addressId: await createAddress(address),
        totalDiscount: totalDiscount,
        deliveryTypeId: deliveryTypeId,
        tax: tax,
        deliveryDate: deliveryDate,
        deliveryTime: deliveryTime,
        cartId: cartId,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false);
          createTransaction(orderId: data.data?.id, paymentId: paymentId);
          fetchProfileDetails();
          orderSuccess?.call();
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> creating order failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
