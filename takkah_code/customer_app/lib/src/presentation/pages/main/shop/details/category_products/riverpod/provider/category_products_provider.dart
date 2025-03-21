import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/category_products_state.dart';
import '../notifier/category_products_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final categoryProductsProvider =
    StateNotifierProvider<CategoryProductsNotifier, CategoryProductsState>(
  (ref) => CategoryProductsNotifier(productsRepository, cartRepository),
);
