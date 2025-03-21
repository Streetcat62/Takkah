import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'saved_shops_in_pickup_state.freezed.dart';

@freezed
class SavedShopsInPickupState with _$SavedShopsInPickupState {
  const factory SavedShopsInPickupState({
    @Default(false) bool isSavedShopsLoading,
    @Default([]) List<ShopData> savedShops,
  }) = _SavedShopsInPickupState;

  const SavedShopsInPickupState._();
}