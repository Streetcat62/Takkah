import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/product_state.dart';
import '../notifier/product_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final productProvider =
    StateNotifierProvider.autoDispose<ProductNotifier, ProductState>(
  (ref) => ProductNotifier(productsRepository, cartRepository),
);
