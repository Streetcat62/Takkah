import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'search_product_in_category_products_state.freezed.dart';

@freezed
class SearchProductInCategoryProductsState
    with _$SearchProductInCategoryProductsState {
  const factory SearchProductInCategoryProductsState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> searchedProducts,
    @Default('') String query,
  }) = _SearchProductInCategoryProductsState;

  const SearchProductInCategoryProductsState._();
}
