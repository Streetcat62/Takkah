import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_main_bottom_state.freezed.dart';

@freezed
class ShopMainBottomState with _$ShopMainBottomState {
  const factory ShopMainBottomState({@Default(true) bool isVisible}) =
      _ShopMainBottomState;

  const ShopMainBottomState._();
}
