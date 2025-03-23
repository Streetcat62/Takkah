import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'shop_details_state.freezed.dart';

@freezed
class ShopDetailsState with _$ShopDetailsState {
  const factory ShopDetailsState({
    @Default(false) bool isLoading,
    ShopData? shopData,
  }) = _ShopDetailsState;

  const ShopDetailsState._();
}
