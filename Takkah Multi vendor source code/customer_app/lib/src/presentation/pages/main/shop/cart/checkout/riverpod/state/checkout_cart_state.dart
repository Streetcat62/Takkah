import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'checkout_cart_state.freezed.dart';

@freezed
class CheckoutCartState with _$CheckoutCartState {
  const factory CheckoutCartState({
    @Default(false) bool isLoading,
    @Default(0) double deliveryFee,
    @Default(0) double couponPrice,
    CartCalculateData? calculateData,
  }) = _CheckoutCartState;

  const CheckoutCartState._();
}
