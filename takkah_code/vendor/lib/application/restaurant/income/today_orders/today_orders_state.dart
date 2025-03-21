import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../infrastructure/models/data/order_data.dart';
import '../../../../infrastructure/models/models.dart';

part 'today_orders_state.freezed.dart';

@freezed
class TodayOrdersState with _$TodayOrdersState {
  const factory TodayOrdersState({
    @Default(false) bool isLoading,
    @Default([]) List<OrderData> todayOrders,
    OrdersStatistic? ordersStatistic,
    OrderData? lastOrder,
  }) = _TodayOrdersState;

  const TodayOrdersState._();
}
