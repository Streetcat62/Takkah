import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/checkout_deliveries_state.dart';
import '../notifier/checkout_deliveries_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final checkoutDeliveriesProvider =
    StateNotifierProvider<CheckoutDeliveriesNotifier, CheckoutDeliveriesState>(
  (ref) => CheckoutDeliveriesNotifier(shopsRepository),
);
