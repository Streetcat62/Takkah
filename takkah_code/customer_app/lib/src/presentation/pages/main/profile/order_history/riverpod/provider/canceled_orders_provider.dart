import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/canceled_orders_state.dart';
import '../notifier/canceled_orders_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final canceledOrdersProvider = StateNotifierProvider.autoDispose<
    CanceledOrdersNotifier, CanceledOrdersState>(
  (ref) => CanceledOrdersNotifier(ordersRepository),
);
