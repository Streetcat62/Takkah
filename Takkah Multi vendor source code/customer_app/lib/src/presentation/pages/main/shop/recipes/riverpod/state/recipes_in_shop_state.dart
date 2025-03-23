import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'recipes_in_shop_state.freezed.dart';

@freezed
class RecipesInShopState with _$RecipesInShopState {
  const factory RecipesInShopState({
    @Default(false) bool isLoading,
    @Default([]) List<RecipeData> recipes,
  }) = _RecipesInShopState;

  const RecipesInShopState._();
}
