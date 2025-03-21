import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'products_state.dart';
import 'products_notifier.dart';

final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) => ProductsNotifier(),
);
