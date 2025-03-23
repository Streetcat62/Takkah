import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'on_a_way_orders_state.freezed.dart';

@freezed
class OnAWayOrdersState with _$OnAWayOrdersState {
  const factory OnAWayOrdersState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<OrderData> onAWayOrders,
    @Default(0) int totalOnAWayOrders,
  }) = _OnAWayOrdersState;

  const OnAWayOrdersState._();
}
