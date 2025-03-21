import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'new_alert_order_state.dart';
import 'new_alert_order_notifier.dart';
import '../../../domain/di/dependency_manager.dart';

final newAlertOrderProvider = StateNotifierProvider.autoDispose<
    NewAlertOrderNotifier, NewAlertOrderState>(
  (_) => NewAlertOrderNotifier(orderRepository),
);
