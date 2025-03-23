import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'search_product_in_brand_state.freezed.dart';

@freezed
class SearchProductInBrandState with _$SearchProductInBrandState {
  const factory SearchProductInBrandState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> searchedProducts,
    @Default('') String query,
  }) = _SearchProductInBrandState;

  const SearchProductInBrandState._();
}
