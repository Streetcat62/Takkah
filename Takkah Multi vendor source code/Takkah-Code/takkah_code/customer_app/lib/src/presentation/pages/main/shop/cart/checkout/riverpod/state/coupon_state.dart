import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_state.freezed.dart';

@freezed
class CouponState with _$CouponState {
  const factory CouponState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    @Default('') String coupon,
  }) = _CouponState;

  const CouponState._();
}
