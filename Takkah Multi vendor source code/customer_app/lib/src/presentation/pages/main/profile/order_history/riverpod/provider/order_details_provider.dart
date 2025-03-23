import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/order_details_state.dart';
import '../notifier/order_details_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final orderDetailsProvider =
    StateNotifierProvider.autoDispose<OrderDetailsNotifier, OrderDetailsState>(
  (ref) => OrderDetailsNotifier(ordersRepository),
);

