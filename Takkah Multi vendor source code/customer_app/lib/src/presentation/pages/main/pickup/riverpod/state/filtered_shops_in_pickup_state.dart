import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'filtered_shops_in_pickup_state.freezed.dart';

@freezed
class FilteredShopsInPickupState with _$FilteredShopsInPickupState {
  const factory FilteredShopsInPickupState({
    @Default(false) bool isFilteredShopsLoading,
    @Default(false) bool isMoreShopsLoading,
    @Default(true) bool hasMoreShops,
    @Default([]) List<ShopData> filteredShops,
  }) = _FilteredShopsInPickupState;

  const FilteredShopsInPickupState._();
}
