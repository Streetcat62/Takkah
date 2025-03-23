import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'cart_total_state.freezed.dart';

@freezed
class CartTotalState with _$CartTotalState {
  const factory CartTotalState({
    @Default(false) bool isLoading,
    CartCalculateData? calculateData,
  }) = _CartTotalState;

  const CartTotalState._();
}
