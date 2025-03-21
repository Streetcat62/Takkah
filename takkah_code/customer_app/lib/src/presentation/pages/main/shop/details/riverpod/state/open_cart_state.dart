import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'open_cart_state.freezed.dart';

@freezed
class OpenCartState with _$OpenCartState {
  const factory OpenCartState({
    @Default(false) bool isLoading,
    @Default(false) bool isDeleting,
    @Default('') String shareLink,
    CartData? cartData,
  }) = _OpenCartState;

  const OpenCartState._();
}
