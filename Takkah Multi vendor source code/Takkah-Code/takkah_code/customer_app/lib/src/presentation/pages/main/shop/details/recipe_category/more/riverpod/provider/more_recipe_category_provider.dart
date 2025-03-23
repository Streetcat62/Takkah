import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/more_recipe_category_state.dart';
import '../notifier/more_recipe_category_notifier.dart';
import '../../../../../../../../../core/di/dependency_manager.dart';

final moreRecipeCategoryProvider = StateNotifierProvider.autoDispose<
    MoreRecipeCategoryNotifier, MoreRecipeCategoryState>(
  (ref) => MoreRecipeCategoryNotifier(recipesRepository),
);
