import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/order_state.dart';
import '../notifier/order_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final orderProvider = StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(ordersRepository, userRepository),
);
