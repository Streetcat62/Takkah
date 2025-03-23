import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'discount_products_state.freezed.dart';

@freezed
class DiscountProductsState with _$DiscountProductsState {
  const factory DiscountProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(true) bool hasMore,
    @Default([]) List<ProductData> discountProducts,
  }) = _DiscountProductsState;

  const DiscountProductsState._();
}
