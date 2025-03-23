import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'search_brand_state.freezed.dart';

@freezed
class SearchBrandState with _$SearchBrandState {
  const factory SearchBrandState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<BrandData> searchedBrands,
    @Default('') String query,
  }) = _SearchBrandState;

  const SearchBrandState._();
}
