import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'shop_groups_in_pickup_state.freezed.dart';

@freezed
class ShopGroupsInPickupState with _$ShopGroupsInPickupState {
  const factory ShopGroupsInPickupState({
    @Default(false) bool isLoading,
    @Default([]) List<ShopGroupData> groups,
    @Default(0) int activeGroupIndex,
  }) = _ShopGroupsInPickupState;

  const ShopGroupsInPickupState._();
}