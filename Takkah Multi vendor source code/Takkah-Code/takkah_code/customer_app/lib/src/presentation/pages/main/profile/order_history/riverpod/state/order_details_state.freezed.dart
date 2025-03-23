// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRefunded => throw _privateConstructorUsedError;
  OrderData? get orderData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailsStateCopyWith<OrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsStateCopyWith(
          OrderDetailsState value, $Res Function(OrderDetailsState) then) =
      _$OrderDetailsStateCopyWithImpl<$Res, OrderDetailsState>;
  @useResult
  $Res call({bool isLoading, bool isRefunded, OrderData? orderData});
}

/// @nodoc
class _$OrderDetailsStateCopyWithImpl<$Res, $Val extends OrderDetailsState>
    implements $OrderDetailsStateCopyWith<$Res> {
  _$OrderDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefunded = null,
    Object? orderData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefunded: null == isRefunded
          ? _value.isRefunded
          : isRefunded // ignore: cast_nullable_to_non_nullable
              as bool,
      orderData: freezed == orderData
          ? _value.orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as OrderData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderDetailsStateCopyWith<$Res>
    implements $OrderDetailsStateCopyWith<$Res> {
  factory _$$_OrderDetailsStateCopyWith(_$_OrderDetailsState value,
          $Res Function(_$_OrderDetailsState) then) =
      __$$_OrderDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isRefunded, OrderData? orderData});
}

/// @nodoc
class __$$_OrderDetailsStateCopyWithImpl<$Res>
    extends _$OrderDetailsStateCopyWithImpl<$Res, _$_OrderDetailsState>
    implements _$$_OrderDetailsStateCopyWith<$Res> {
  __$$_OrderDetailsStateCopyWithImpl(
      _$_OrderDetailsState _value, $Res Function(_$_OrderDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefunded = null,
    Object? orderData = freezed,
  }) {
    return _then(_$_OrderDetailsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefunded: null == isRefunded
          ? _value.isRefunded
          : isRefunded // ignore: cast_nullable_to_non_nullable
              as bool,
      orderData: freezed == orderData
          ? _value.orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as OrderData?,
    ));
  }
}

/// @nodoc

class _$_OrderDetailsState extends _OrderDetailsState {
  const _$_OrderDetailsState(
      {this.isLoading = false, this.isRefunded = false, this.orderData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isRefunded;
  @override
  final OrderData? orderData;

  @override
  String toString() {
    return 'OrderDetailsState(isLoading: $isLoading, isRefunded: $isRefunded, orderData: $orderData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetailsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRefunded, isRefunded) ||
                other.isRefunded == isRefunded) &&
            (identical(other.orderData, orderData) ||
                other.orderData == orderData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isRefunded, orderData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDetailsStateCopyWith<_$_OrderDetailsState> get copyWith =>
      __$$_OrderDetailsStateCopyWithImpl<_$_OrderDetailsState>(
          this, _$identity);
}

abstract class _OrderDetailsState extends OrderDetailsState {
  const factory _OrderDetailsState(
      {final bool isLoading,
      final bool isRefunded,
      final OrderData? orderData}) = _$_OrderDetailsState;
  const _OrderDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isRefunded;
  @override
  OrderData? get orderData;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailsStateCopyWith<_$_OrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
