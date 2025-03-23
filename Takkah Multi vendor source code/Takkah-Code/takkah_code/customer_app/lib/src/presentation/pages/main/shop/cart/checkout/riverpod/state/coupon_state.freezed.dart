// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CouponState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get coupon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CouponStateCopyWith<CouponState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponStateCopyWith<$Res> {
  factory $CouponStateCopyWith(
          CouponState value, $Res Function(CouponState) then) =
      _$CouponStateCopyWithImpl<$Res, CouponState>;
  @useResult
  $Res call({bool isLoading, bool isSuccess, bool isError, String coupon});
}

/// @nodoc
class _$CouponStateCopyWithImpl<$Res, $Val extends CouponState>
    implements $CouponStateCopyWith<$Res> {
  _$CouponStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isError = null,
    Object? coupon = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CouponStateCopyWith<$Res>
    implements $CouponStateCopyWith<$Res> {
  factory _$$_CouponStateCopyWith(
          _$_CouponState value, $Res Function(_$_CouponState) then) =
      __$$_CouponStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isSuccess, bool isError, String coupon});
}

/// @nodoc
class __$$_CouponStateCopyWithImpl<$Res>
    extends _$CouponStateCopyWithImpl<$Res, _$_CouponState>
    implements _$$_CouponStateCopyWith<$Res> {
  __$$_CouponStateCopyWithImpl(
      _$_CouponState _value, $Res Function(_$_CouponState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isError = null,
    Object? coupon = null,
  }) {
    return _then(_$_CouponState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CouponState extends _CouponState {
  const _$_CouponState(
      {this.isLoading = false,
      this.isSuccess = false,
      this.isError = false,
      this.coupon = ''})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final String coupon;

  @override
  String toString() {
    return 'CouponState(isLoading: $isLoading, isSuccess: $isSuccess, isError: $isError, coupon: $coupon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.coupon, coupon) || other.coupon == coupon));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isSuccess, isError, coupon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponStateCopyWith<_$_CouponState> get copyWith =>
      __$$_CouponStateCopyWithImpl<_$_CouponState>(this, _$identity);
}

abstract class _CouponState extends CouponState {
  const factory _CouponState(
      {final bool isLoading,
      final bool isSuccess,
      final bool isError,
      final String coupon}) = _$_CouponState;
  const _CouponState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isError;
  @override
  String get coupon;
  @override
  @JsonKey(ignore: true)
  _$$_CouponStateCopyWith<_$_CouponState> get copyWith =>
      throw _privateConstructorUsedError;
}
