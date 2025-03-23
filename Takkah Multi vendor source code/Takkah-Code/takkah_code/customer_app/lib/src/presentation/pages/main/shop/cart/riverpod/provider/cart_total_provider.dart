import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/cart_total_state.dart';
import '../notifier/cart_total_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final cartTotalProvider =
    StateNotifierProvider.autoDispose<CartTotalNotifier, CartTotalState>(
  (ref) => CartTotalNotifier(cartRepository),
);
