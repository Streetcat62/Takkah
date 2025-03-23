import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../../models/models.dart';

part 'more_recipe_category_state.freezed.dart';

@freezed
class MoreRecipeCategoryState with _$MoreRecipeCategoryState {
  const factory MoreRecipeCategoryState({
    @Default(false) bool isLoading,
    RecipeCategoryData? categoryData,
  }) = _MoreRecipeCategoryState;

  const MoreRecipeCategoryState._();
}
