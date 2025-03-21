// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderState {
  bool get paymentType => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<OrderData> get orders => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get deliveryTime => throw _privateConstructorUsedError;
  int get deliveryType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call(
      {bool paymentType,
      bool isLoading,
      List<OrderData> orders,
      int totalCount,
      int deliveryTime,
      int deliveryType});
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentType = null,
    Object? isLoading = null,
    Object? orders = null,
    Object? totalCount = null,
    Object? deliveryTime = null,
    Object? deliveryType = null,
  }) {
    return _then(_value.copyWith(
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryType: null == deliveryType
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrdrStateCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$_OrdrStateCopyWith(
          _$_OrdrState value, $Res Function(_$_OrdrState) then) =
      __$$_OrdrStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool paymentType,
      bool isLoading,
      List<OrderData> orders,
      int totalCount,
      int deliveryTime,
      int deliveryType});
}

/// @nodoc
class __$$_OrdrStateCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$_OrdrState>
    implements _$$_OrdrStateCopyWith<$Res> {
  __$$_OrdrStateCopyWithImpl(
      _$_OrdrState _value, $Res Function(_$_OrdrState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentType = null,
    Object? isLoading = null,
    Object? orders = null,
    Object? totalCount = null,
    Object? deliveryTime = null,
    Object? deliveryType = null,
  }) {
    return _then(_$_OrdrState(
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryType: null == deliveryType
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OrdrState extends _OrdrState {
  const _$_OrdrState(
      {this.paymentType = false,
      this.isLoading = false,
      final List<OrderData> orders = const [],
      this.totalCount = 0,
      this.deliveryTime = 0,
      this.deliveryType = 0})
      : _orders = orders,
        super._();

  @override
  @JsonKey()
  final bool paymentType;
  @override
  @JsonKey()
  final bool isLoading;
  final List<OrderData> _orders;
  @override
  @JsonKey()
  List<OrderData> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int deliveryTime;
  @override
  @JsonKey()
  final int deliveryType;

  @override
  String toString() {
    return 'OrderState(paymentType: $paymentType, isLoading: $isLoading, orders: $orders, totalCount: $totalCount, deliveryTime: $deliveryTime, deliveryType: $deliveryType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrdrState &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime) &&
            (identical(other.deliveryType, deliveryType) ||
                other.deliveryType == deliveryType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentType,
      isLoading,
      const DeepCollectionEquality().hash(_orders),
      totalCount,
      deliveryTime,
      deliveryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrdrStateCopyWith<_$_OrdrState> get copyWith =>
      __$$_OrdrStateCopyWithImpl<_$_OrdrState>(this, _$identity);
}

abstract class _OrdrState extends OrderState {
  const factory _OrdrState(
      {final bool paymentType,
      final bool isLoading,
      final List<OrderData> orders,
      final int totalCount,
      final int deliveryTime,
      final int deliveryType}) = _$_OrdrState;
  const _OrdrState._() : super._();

  @override
  bool get paymentType;
  @override
  bool get isLoading;
  @override
  List<OrderData> get orders;
  @override
  int get totalCount;
  @override
  int get deliveryTime;
  @override
  int get deliveryType;
  @override
  @JsonKey(ignore: true)
  _$$_OrdrStateCopyWith<_$_OrdrState> get copyWith =>
      throw _privateConstructorUsedError;
}
