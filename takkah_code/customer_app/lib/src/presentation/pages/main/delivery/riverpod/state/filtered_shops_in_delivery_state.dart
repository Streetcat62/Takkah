import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'filtered_shops_in_delivery_state.freezed.dart';

@freezed
class FilteredShopsInDeliveryState with _$FilteredShopsInDeliveryState {
  const factory FilteredShopsInDeliveryState({
    @Default(false) bool isFilteredShopsLoading,
    @Default(false) bool isMoreShopsLoading,
    @Default(true) bool hasMoreShops,
    @Default([]) List<ShopData> filteredShops,
  }) = _FilteredShopsInDeliveryState;

  const FilteredShopsInDeliveryState._();
}