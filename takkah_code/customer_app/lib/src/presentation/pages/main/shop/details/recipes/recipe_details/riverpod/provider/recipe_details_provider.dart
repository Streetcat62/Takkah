import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/recipe_details_state.dart';
import '../notifier/recipe_details_notifier.dart';
import '../../../../../../../../../core/di/dependency_manager.dart';

final recipeDetailsProvider = StateNotifierProvider.autoDispose<
    RecipeDetailsNotifier, RecipeDetailsState>(
  (ref) => RecipeDetailsNotifier(recipesRepository),
);
