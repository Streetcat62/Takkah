import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/viewed_products_state.dart';
import '../notifier/viewed_products_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final viewedProductsProvider = StateNotifierProvider.autoDispose<
    ViewedProductsNotifier, ViewedProductsState>(
  (ref) => ViewedProductsNotifier(productsRepository, cartRepository),
);
