// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutCartState {
  bool get isLoading => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get couponPrice => throw _privateConstructorUsedError;
  CartCalculateData? get calculateData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutCartStateCopyWith<CheckoutCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutCartStateCopyWith<$Res> {
  factory $CheckoutCartStateCopyWith(
          CheckoutCartState value, $Res Function(CheckoutCartState) then) =
      _$CheckoutCartStateCopyWithImpl<$Res, CheckoutCartState>;
  @useResult
  $Res call(
      {bool isLoading,
      double deliveryFee,
      double couponPrice,
      CartCalculateData? calculateData});
}

/// @nodoc
class _$CheckoutCartStateCopyWithImpl<$Res, $Val extends CheckoutCartState>
    implements $CheckoutCartStateCopyWith<$Res> {
  _$CheckoutCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? deliveryFee = null,
    Object? couponPrice = null,
    Object? calculateData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      couponPrice: null == couponPrice
          ? _value.couponPrice
          : couponPrice // ignore: cast_nullable_to_non_nullable
              as double,
      calculateData: freezed == calculateData
          ? _value.calculateData
          : calculateData // ignore: cast_nullable_to_non_nullable
              as CartCalculateData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckoutCartStateCopyWith<$Res>
    implements $CheckoutCartStateCopyWith<$Res> {
  factory _$$_CheckoutCartStateCopyWith(_$_CheckoutCartState value,
          $Res Function(_$_CheckoutCartState) then) =
      __$$_CheckoutCartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      double deliveryFee,
      double couponPrice,
      CartCalculateData? calculateData});
}

/// @nodoc
class __$$_CheckoutCartStateCopyWithImpl<$Res>
    extends _$CheckoutCartStateCopyWithImpl<$Res, _$_CheckoutCartState>
    implements _$$_CheckoutCartStateCopyWith<$Res> {
  __$$_CheckoutCartStateCopyWithImpl(
      _$_CheckoutCartState _value, $Res Function(_$_CheckoutCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? deliveryFee = null,
    Object? couponPrice = null,
    Object? calculateData = freezed,
  }) {
    return _then(_$_CheckoutCartState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      couponPrice: null == couponPrice
          ? _value.couponPrice
          : couponPrice // ignore: cast_nullable_to_non_nullable
              as double,
      calculateData: freezed == calculateData
          ? _value.calculateData
          : calculateData // ignore: cast_nullable_to_non_nullable
              as CartCalculateData?,
    ));
  }
}

/// @nodoc

class _$_CheckoutCartState extends _CheckoutCartState {
  const _$_CheckoutCartState(
      {this.isLoading = false,
      this.deliveryFee = 0,
      this.couponPrice = 0,
      this.calculateData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final double couponPrice;
  @override
  final CartCalculateData? calculateData;

  @override
  String toString() {
    return 'CheckoutCartState(isLoading: $isLoading, deliveryFee: $deliveryFee, couponPrice: $couponPrice, calculateData: $calculateData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckoutCartState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.couponPrice, couponPrice) ||
                other.couponPrice == couponPrice) &&
            (identical(other.calculateData, calculateData) ||
                other.calculateData == calculateData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, deliveryFee, couponPrice, calculateData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckoutCartStateCopyWith<_$_CheckoutCartState> get copyWith =>
      __$$_CheckoutCartStateCopyWithImpl<_$_CheckoutCartState>(
          this, _$identity);
}

abstract class _CheckoutCartState extends CheckoutCartState {
  const factory _CheckoutCartState(
      {final bool isLoading,
      final double deliveryFee,
      final double couponPrice,
      final CartCalculateData? calculateData}) = _$_CheckoutCartState;
  const _CheckoutCartState._() : super._();

  @override
  bool get isLoading;
  @override
  double get deliveryFee;
  @override
  double get couponPrice;
  @override
  CartCalculateData? get calculateData;
  @override
  @JsonKey(ignore: true)
  _$$_CheckoutCartStateCopyWith<_$_CheckoutCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
