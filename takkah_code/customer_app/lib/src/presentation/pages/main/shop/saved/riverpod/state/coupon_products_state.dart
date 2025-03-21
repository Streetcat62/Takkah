import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'coupon_products_state.freezed.dart';

@freezed
class CouponProductsState with _$CouponProductsState {
  const factory CouponProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(true) bool hasMore,
    @Default([]) List<ProductData> couponProducts,
  }) = _CouponProductsState;

  const CouponProductsState._();
}
