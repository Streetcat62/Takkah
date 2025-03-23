import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_details_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class ShopDetailsNotifier extends StateNotifier<ShopDetailsState> {
  final ShopsRepository _shopsRepository;

  ShopDetailsNotifier(this._shopsRepository) : super(const ShopDetailsState());

  Future<void> fetchShopDetails({
    int? shopId,
    VoidCallback? checkYourNetwork,
    required Function(ShopData?) updateSavedShops,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response =
          await _shopsRepository.getShopDetailsById(shopId: shopId);
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false, shopData: data.data);
          saveToViewedStore(data.data?.id);
          updateSavedShops(data.data);
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get shop details failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void saveToViewedStore(int? id) {
    final List<int> ids = LocalStorage.instance.getSavedShopsList();
    ids.insert(0, id ?? 0);
    final setList = ids.toSet().toList();
    final subList = setList.length > 5 ? setList.sublist(0, 5) : setList;
    LocalStorage.instance.setSavedShopsList(subList);
  }
}
