import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'shop_categories_state.freezed.dart';

@freezed
class ShopCategoriesState with _$ShopCategoriesState {
  const factory ShopCategoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryData> categories,
  }) = _ShopCategoriesState;

  const ShopCategoriesState._();
}
