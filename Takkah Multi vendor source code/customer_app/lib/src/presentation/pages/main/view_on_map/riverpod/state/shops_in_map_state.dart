import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'shops_in_map_state.freezed.dart';

@freezed
class ShopsInMapState with _$ShopsInMapState {
  const factory ShopsInMapState({
    @Default(false) bool isLoading,
    @Default([]) List<ShopData> shops,
  }) = _ShopsInMapState;

  const ShopsInMapState._();
}
