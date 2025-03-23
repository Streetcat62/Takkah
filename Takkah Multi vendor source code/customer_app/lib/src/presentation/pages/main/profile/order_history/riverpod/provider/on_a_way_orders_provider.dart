import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/on_a_way_orders_state.dart';
import '../notifier/on_a_way_orders_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final onAWayOrdersProvider =
    StateNotifierProvider.autoDispose<OnAWayOrdersNotifier, OnAWayOrdersState>(
  (ref) => OnAWayOrdersNotifier(ordersRepository),
);
