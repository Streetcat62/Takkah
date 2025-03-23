import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'saved_shops_in_delivery_state.freezed.dart';

@freezed
class SavedShopsInDeliveryState with _$SavedShopsInDeliveryState {
  const factory SavedShopsInDeliveryState({
    @Default(false) bool isSavedShopsLoading,
    @Default([]) List<ShopData> savedShops,
  }) = _SavedShopsInDeliveryState;

  const SavedShopsInDeliveryState._();
}