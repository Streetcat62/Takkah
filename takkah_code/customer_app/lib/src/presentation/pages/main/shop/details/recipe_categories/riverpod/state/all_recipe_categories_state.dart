import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'all_recipe_categories_state.freezed.dart';

@freezed
class AllRecipeCategoriesState with _$AllRecipeCategoriesState {
  const factory AllRecipeCategoriesState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(true) bool hasMore,
    @Default([]) List<RecipeCategoryData> recipeCategories,
  }) = _AllRecipeCategoriesState;

  const AllRecipeCategoriesState._();
}
