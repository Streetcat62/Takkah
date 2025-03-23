import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundaymart/src/models/data/shop_delivery_list.dart';

import '../state/checkout_deliveries_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';

class CheckoutDeliveriesNotifier
    extends StateNotifier<CheckoutDeliveriesState> {
  final ShopsRepository _shopsRepository;

  CheckoutDeliveriesNotifier(this._shopsRepository)
      : super(const CheckoutDeliveriesState());

  void setPickupDate(DateTime? date) {
    state = state.copyWith(pickupDate: date);
  }

  void setDeliveryTime(DateTime? date) {
    state = state.copyWith(deliveryTime: date);
  }

  void checkDeliveryTime(bool isValid) {
    state = state.copyWith(isValid : isValid);
  }

  void setDeliveryDate(DateTime? date) {
    state = state.copyWith(deliveryDate: date);
  }

  void setSelectedDeliveryTypeIndex(int index) {
    state = state.copyWith(selectedDeliveryTypeIndex: index);
  }

  void setIsPickup(bool value) {
    state = state.copyWith(isPickup: value);
  }

  Future<void> fetchShopDeliveries({int? shopId}) async {
    if (shopId == null) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _shopsRepository.getShopDeliveries([shopId]);
    response.when(
      success: (data) {
        final ShopDeliveryList shops = data;
        List<ShopDelivery> currentShop = shops.deliveries ?? [];
        final deliveries = currentShop;
        final List<LocalAddressData> addresses =
            LocalStorage.instance.getLocalAddressesList();
        int addressIndex = 0;
        for (int i = 0; i < addresses.length; i++) {
          if (addresses[i].isDefault ?? false) {
            addressIndex = i;
            break;
          }
        }
        ShopDelivery? pickupDelivery;
        for (final delivery in deliveries) {
          if (delivery.type == 'pickup') {
            pickupDelivery = delivery;
          }
        }

        state = state.copyWith(
          isLoading: false,
          shopDeliveries: deliveries,
          pickupDelivery: pickupDelivery,
          isPickup: AppHelpers.getDeliveries(deliveries).isEmpty &&
              AppHelpers.hasPickup(deliveries),
          selectedDeliveryAddressIndex: addressIndex,
        );
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get shop deliveries failure: $fail');
      },
    );
  }
}
