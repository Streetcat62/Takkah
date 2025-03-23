import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_banners_state.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class ShopBannersNotifier extends StateNotifier<ShopBannersState> {
  final ShopsRepository _shopsRepository;

  ShopBannersNotifier(this._shopsRepository) : super(const ShopBannersState());

  Future<void> fetchShopBanners({int? shopId}) async {
    state = state.copyWith(isLoading: true);
    final response = await _shopsRepository
        .getBannersPaginate(BannerType.banner, shopId: shopId);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, banners: data.data ?? []);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get shop banners failure: $fail');
      },
    );
  }
}
