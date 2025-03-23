import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/cart_state.dart';
import '../notifier/cart_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final cartProvider = StateNotifierProvider.autoDispose<CartNotifier, CartState>(
  (ref) => CartNotifier(cartRepository),
);
