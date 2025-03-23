import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default(false) bool isLoading,
    CartData? cartData,
  }) = _CartState;

  const CartState._();
}
