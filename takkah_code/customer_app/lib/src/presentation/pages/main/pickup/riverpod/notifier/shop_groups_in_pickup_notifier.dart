import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/utils.dart';
import '../state/shop_groups_in_pickup_state.dart';
import '../../../../../../repository/repository.dart';

class ShopGroupsInPickupNotifier
    extends StateNotifier<ShopGroupsInPickupState> {
  final ShopsRepository _shopsRepository;

  ShopGroupsInPickupNotifier(this._shopsRepository)
      : super(const ShopGroupsInPickupState());

  Future<void> fetchShopGroups({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _shopsRepository.getShopGroups(page: 1);
      response.when(
        success: (data) {
          state = state.copyWith(groups: data.data ?? [], isLoading: false);
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> fetch shop groups failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setActiveIndex(int index) {
    state = state.copyWith(activeGroupIndex: index);
  }
}
