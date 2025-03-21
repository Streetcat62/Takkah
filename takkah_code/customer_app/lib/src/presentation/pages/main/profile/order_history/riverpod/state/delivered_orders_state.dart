import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'delivered_orders_state.freezed.dart';

@freezed
class DeliveredOrdersState with _$DeliveredOrdersState {
  const factory DeliveredOrdersState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<OrderData> deliveredOrders,
    @Default(0) int totalDeliveredOrders,
  }) = _DeliveredOrdersState;

  const DeliveredOrdersState._();
}
