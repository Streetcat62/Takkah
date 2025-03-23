import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'search_product_in_category_details_state.freezed.dart';

@freezed
class SearchProductInCategoryDetailsState with _$SearchProductInCategoryDetailsState {
  const factory SearchProductInCategoryDetailsState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> searchedProducts,
    @Default('') String query,
  }) = _SearchProductInCategoryDetailsState;

  const SearchProductInCategoryDetailsState._();
}
