import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'recipe_category_state.freezed.dart';

@freezed
class RecipeCategoryState with _$RecipeCategoryState {
  const factory RecipeCategoryState({
    @Default(false) bool isLoading,
    RecipeCategoryData? categoryData,
  }) = _RecipeCategoryState;

  const RecipeCategoryState._();
}
