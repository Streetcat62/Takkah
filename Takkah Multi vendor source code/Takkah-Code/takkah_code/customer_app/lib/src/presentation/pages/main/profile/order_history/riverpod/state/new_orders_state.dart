import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'new_orders_state.freezed.dart';

@freezed
class NewOrdersState with _$NewOrdersState {
  const factory NewOrdersState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<OrderData> newOrders,
    @Default(0) int totalNewOrders,
  }) = _NewOrdersState;

  const NewOrdersState._();
}
