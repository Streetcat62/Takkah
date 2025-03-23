import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'canceled_orders_state.freezed.dart';

@freezed
class CanceledOrdersState with _$CanceledOrdersState {
  const factory CanceledOrdersState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<OrderData> canceledOrders,
    @Default(0) int totalCanceledOrders,
  }) = _CanceledOrdersState;

  const CanceledOrdersState._();
}
