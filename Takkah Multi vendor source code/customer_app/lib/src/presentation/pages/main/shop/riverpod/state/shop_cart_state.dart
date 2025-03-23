import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'shop_cart_state.freezed.dart';

@freezed
class ShopCartState with _$ShopCartState {
  const factory ShopCartState({CartData? cartData}) = _ShopCartState;

  const ShopCartState._();
}
