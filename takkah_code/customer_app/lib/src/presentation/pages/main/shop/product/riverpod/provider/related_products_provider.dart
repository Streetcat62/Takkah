import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/related_products_state.dart';
import '../notifier/related_products_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final relatedProductsProvider =
    StateNotifierProvider<RelatedProductsNotifier, RelatedProductsState>(
  (ref) => RelatedProductsNotifier(productsRepository, cartRepository),
);
