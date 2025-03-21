import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'ready_orders_state.freezed.dart';

@freezed
class ReadyOrdersState with _$ReadyOrdersState {
  const factory ReadyOrdersState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<OrderData> readyOrders,
    @Default(0) int totalReadyOrders,
  }) = _ReadyOrdersState;

  const ReadyOrdersState._();
}
