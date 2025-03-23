import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'search_shop_in_map_state.freezed.dart';

@freezed
class SearchShopInMapState with _$SearchShopInMapState {
  const factory SearchShopInMapState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ShopData> searchedShops,
    @Default('') String shopQuery,
  }) = _SearchShopInMapState;

  const SearchShopInMapState._();
}
