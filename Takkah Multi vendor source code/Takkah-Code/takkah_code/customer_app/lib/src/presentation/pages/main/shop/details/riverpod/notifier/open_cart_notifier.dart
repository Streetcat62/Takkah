import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/open_cart_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class OpenCartNotifier extends StateNotifier<OpenCartState> {
  final CartsRepository _cartsRepository;
  Timer? _timer;

  OpenCartNotifier(this._cartsRepository) : super(const OpenCartState());

  Future<void> deleteMember({
    String? uuid,
    VoidCallback? checkYourNetwork,
  }) async {
    if (await AppConnectivity.connectivity()) {
      final response = await _cartsRepository.deleteCartMember(
        memberUuid: uuid,
        cartId: state.cartData?.id,
      );
      response.when(
        success: (data) {
          debugPrint('==> successfully deleted member');
        },
        failure: (fail, errorData) {
          debugPrint('==> delete cart member failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  Future<void> getCartDetails({int? shopId}) async {
    final response = await _cartsRepository.getUserCart(shopId: shopId);
    response.when(
      success: (data) {
        state = state.copyWith(cartData: data.data);
      },
      failure: (fail, errorData) {
        debugPrint('==> get cart failure: $fail');
      },
    );
  }

  Future<void> deleteCart({VoidCallback? checkYourNetwork}) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isDeleting: true);
      final response =
          await _cartsRepository.deleteCart(cartId: state.cartData?.id);
      response.when(
        success: (data) {
          state = state.copyWith(isDeleting: false, cartData: null);
          cancelTimer();
        },
        failure: (fail, errorData) {
          state = state.copyWith(isDeleting: false);
          debugPrint('==> delete cart failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setCartData({CartData? cartData}) {
    if (state.cartData == null) {
      state = state.copyWith(cartData: cartData);
    }
    if (state.cartData?.together ?? false) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer.periodic(
        const Duration(seconds: 5),
        (timer) {
          getCartDetails(shopId: cartData?.shopId);
        },
      );
    }
  }

  Future<void> openCart({
    int? shopId,
    VoidCallback? checkYourNetwork,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _cartsRepository.openCart(shopId: shopId);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, cartData: data.data);
        debugPrint('===> open cart modal success ${data.data?.together}');
        if (data.data?.together ?? false) {
          if (_timer?.isActive ?? false) {
            _timer?.cancel();
          }
          _timer = Timer.periodic(
            const Duration(seconds: 5),
            (timer) {
              debugPrint('===> open cart modal success periodic started');
              getCartDetails(shopId: shopId);
            },
          );
        }
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> open cart failure: $fail');
      },
    );
  }
}
