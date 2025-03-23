import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'search_product_in_banner_state.freezed.dart';

@freezed
class SearchProductInBannerState with _$SearchProductInBannerState {
  const factory SearchProductInBannerState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> searchedProducts,
    @Default('') String query,
  }) = _SearchProductInBannerState;

  const SearchProductInBannerState._();
}
