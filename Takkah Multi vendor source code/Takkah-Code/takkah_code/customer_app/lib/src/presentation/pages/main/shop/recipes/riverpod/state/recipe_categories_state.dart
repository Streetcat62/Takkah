import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'recipe_categories_state.freezed.dart';

@freezed
class RecipeCategoriesState with _$RecipeCategoriesState {
  const factory RecipeCategoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<RecipeCategoryData> recipeCategories,
  }) = _RecipeCategoriesState;

  const RecipeCategoriesState._();
}
