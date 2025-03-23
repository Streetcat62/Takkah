import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/ready_orders_state.dart';
import '../notifier/ready_orders_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final readyOrdersProvider =
    StateNotifierProvider.autoDispose<ReadyOrdersNotifier, ReadyOrdersState>(
  (ref) => ReadyOrdersNotifier(ordersRepository),
);
