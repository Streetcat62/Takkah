import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../state/saved_shops_in_delivery_state.dart';
import '../../../../../../repository/repository.dart';

class SavedShopsInDeliveryNotifier
    extends StateNotifier<SavedShopsInDeliveryState> {
  final ShopsRepository _shopsRepository;

  SavedShopsInDeliveryNotifier(this._shopsRepository)
      : super(const SavedShopsInDeliveryState());

  void addSavedShop(ShopData? data) {
    if (data == null) {
      return;
    }
    List<ShopData> shops = List.from(state.savedShops);
    for (int i = 0; i < shops.length; i++) {
      if (shops[i].id == data.id) {
        shops.removeAt(i);
      }
    }
    shops.insert(0, data);
    state = state.copyWith(savedShops: shops);
  }

  Future<void> fetchSavedShops({VoidCallback? checkYourNetwork}) async {
    final List<int> ids = LocalStorage.instance.getSavedShopsList();
    if (ids.isEmpty) {
      state = state.copyWith(savedShops: []);
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSavedShopsLoading: true);
      final response = await _shopsRepository.getShopsByIds(ids);
      response.when(
        success: (data) {
          final List<ShopData> shops = [];
          for (final shop in (data.data ?? <ShopData>[])) {
            if (AppHelpers.checkHasDelivery(shop.deliveries)) {
              shops.add(shop);
            }
          }
          state = state.copyWith(savedShops: shops, isSavedShopsLoading: false);
        },
        failure: (fail, errorData) {
          state = state.copyWith(isSavedShopsLoading: false);
          debugPrint('==> fetch saved shops failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
