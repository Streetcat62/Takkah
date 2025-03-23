import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'shop_groups_in_delivery_state.freezed.dart';

@freezed
class ShopGroupsInDeliveryState with _$ShopGroupsInDeliveryState {
  const factory ShopGroupsInDeliveryState({
    @Default(false) bool isLoading,
    @Default([]) List<ShopGroupData> groups,
    @Default(0) int activeGroupIndex,
  }) = _ShopGroupsInDeliveryState;

  const ShopGroupsInDeliveryState._();
}