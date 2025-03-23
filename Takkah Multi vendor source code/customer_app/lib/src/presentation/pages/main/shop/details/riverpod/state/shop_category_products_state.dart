import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'shop_category_products_state.freezed.dart';

@freezed
class ShopCategoryProductsState with _$ShopCategoryProductsState {
  const factory ShopCategoryProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(true) bool hasMore,
    @Default([]) List<ShopCategoryData> shopCategoryProducts,
    @Default(0) int count,
  }) = _ShopCategoryProductsState;

  const ShopCategoryProductsState._();
}
