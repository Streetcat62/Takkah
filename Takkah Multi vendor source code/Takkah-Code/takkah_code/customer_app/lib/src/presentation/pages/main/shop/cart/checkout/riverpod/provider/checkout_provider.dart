import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/checkout_state.dart';
import '../notifier/checkout_notifier.dart';

final checkoutProvider =
    StateNotifierProvider.autoDispose<CheckoutNotifier, CheckoutState>(
  (ref) => CheckoutNotifier(),
);
