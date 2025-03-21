import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_groups_in_view_map_state.freezed.dart';

@freezed
class ShopGroupsInViewMapState with _$ShopGroupsInViewMapState {
  const factory ShopGroupsInViewMapState({
    @Default(0) int activeGroupIndex,
  }) = _ShopGroupsInViewMapState;

  const ShopGroupsInViewMapState._();
}
