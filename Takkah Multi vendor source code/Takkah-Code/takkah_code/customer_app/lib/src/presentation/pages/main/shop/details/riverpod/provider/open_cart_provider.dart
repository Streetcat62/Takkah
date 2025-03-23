import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/open_cart_state.dart';
import '../notifier/open_cart_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final openCartProvider = StateNotifierProvider<OpenCartNotifier, OpenCartState>(
  (ref) => OpenCartNotifier(cartRepository),
);
