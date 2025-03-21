import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/models.dart';

part 'main_shop_search_state.freezed.dart';

@freezed
class MainShopSearchState with _$MainShopSearchState {
  const factory MainShopSearchState({
    @Default(false) bool isLoading,
    @Default([]) List<ShopData> shops,
  }) = _MainShopSearchState;

  const MainShopSearchState._();
}
