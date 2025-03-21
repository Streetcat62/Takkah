import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'accepted_orders_state.freezed.dart';

@freezed
class AcceptedOrdersState with _$AcceptedOrdersState {
  const factory AcceptedOrdersState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<OrderData> acceptedOrders,
    @Default(0) int totalAcceptedOrders,
  }) = _AcceptedOrdersState;

  const AcceptedOrdersState._();
}
