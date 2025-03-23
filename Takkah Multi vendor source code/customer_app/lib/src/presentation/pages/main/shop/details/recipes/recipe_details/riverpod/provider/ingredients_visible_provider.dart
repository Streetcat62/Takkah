import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/ingredients_visible_state.dart';
import '../notifier/ingredients_visible_notifier.dart';

final ingredientsVisibleProvider =
    StateNotifierProvider<IngredientsVisibleNotifier, IngredientsVisibleState>(
  (ref) => IngredientsVisibleNotifier(),
);
