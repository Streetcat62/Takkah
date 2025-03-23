import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/all_recipes_state.dart';
import '../notifier/all_recipes_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final allRecipesProvider =
    StateNotifierProvider.autoDispose<AllRecipesNotifier, AllRecipesState>(
  (ref) => AllRecipesNotifier(recipesRepository),
);
