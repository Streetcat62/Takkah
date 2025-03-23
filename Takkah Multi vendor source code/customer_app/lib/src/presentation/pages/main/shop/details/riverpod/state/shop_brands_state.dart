import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'shop_brands_state.freezed.dart';

@freezed
class ShopBrandsState with _$ShopBrandsState {
  const factory ShopBrandsState({
    @Default(false) bool isLoading,
    @Default([]) List<BrandData> brands,
  }) = _ShopBrandsState;

  const ShopBrandsState._();
}
