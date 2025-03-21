import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/ingredients_to_cart_state.dart';
import '../notifier/ingredients_to_cart_notifier.dart';
import '../../../../../../../../../core/di/dependency_manager.dart';

final ingredientsToCartProvider =
    StateNotifierProvider<IngredientsToCartNotifier, IngredientsToCartState>(
  (ref) => IngredientsToCartNotifier(cartRepository),
);
