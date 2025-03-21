import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'brand_products_state.freezed.dart';

@freezed
class BrandProductsState with _$BrandProductsState {
  const factory BrandProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(true) bool hasMore,
    @Default([]) List<ProductData> products,
  }) = _BrandProductsState;

  const BrandProductsState._();
}
