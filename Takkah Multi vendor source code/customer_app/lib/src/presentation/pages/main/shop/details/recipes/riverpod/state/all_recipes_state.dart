import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'all_recipes_state.freezed.dart';

@freezed
class AllRecipesState with _$AllRecipesState {
  const factory AllRecipesState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(true) bool hasMore,
    @Default([]) List<RecipeData> recipes,
  }) = _AllRecipesState;

  const AllRecipesState._();
}
