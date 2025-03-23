import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/coupon_state.dart';
import '../../../../../../../../repository/repository.dart';

class CouponNotifier extends StateNotifier<CouponState> {
  final CartsRepository _cartsRepository;

  CouponNotifier(this._cartsRepository) : super(const CouponState());

  void setCoupon(String value) {
    state = state.copyWith(coupon: value.trim());
  }

  Future<void> checkCoupon({int? shopId}) async {
    state = state.copyWith(isLoading: true);
    final response = await _cartsRepository.checkCoupon(
      coupon: state.coupon,
      shopId: shopId,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, isSuccess: true);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false, isError: true);
        debugPrint('==> check coupon failure: $fail');
      },
    );
  }
}
