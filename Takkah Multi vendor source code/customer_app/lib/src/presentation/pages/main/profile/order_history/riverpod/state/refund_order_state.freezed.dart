// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RefundOrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingInfo => throw _privateConstructorUsedError;
  OrderRefundData? get orderData => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RefundOrdersStateCopyWith<RefundOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundOrdersStateCopyWith<$Res> {
  factory $RefundOrdersStateCopyWith(
          RefundOrdersState value, $Res Function(RefundOrdersState) then) =
      _$RefundOrdersStateCopyWithImpl<$Res, RefundOrdersState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingInfo,
      OrderRefundData? orderData,
      String message});
}

/// @nodoc
class _$RefundOrdersStateCopyWithImpl<$Res, $Val extends RefundOrdersState>
    implements $RefundOrdersStateCopyWith<$Res> {
  _$RefundOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingInfo = null,
    Object? orderData = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingInfo: null == isLoadingInfo
          ? _value.isLoadingInfo
          : isLoadingInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      orderData: freezed == orderData
          ? _value.orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as OrderRefundData?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RefundOrdersStateCopyWith<$Res>
    implements $RefundOrdersStateCopyWith<$Res> {
  factory _$$_RefundOrdersStateCopyWith(_$_RefundOrdersState value,
          $Res Function(_$_RefundOrdersState) then) =
      __$$_RefundOrdersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingInfo,
      OrderRefundData? orderData,
      String message});
}

/// @nodoc
class __$$_RefundOrdersStateCopyWithImpl<$Res>
    extends _$RefundOrdersStateCopyWithImpl<$Res, _$_RefundOrdersState>
    implements _$$_RefundOrdersStateCopyWith<$Res> {
  __$$_RefundOrdersStateCopyWithImpl(
      _$_RefundOrdersState _value, $Res Function(_$_RefundOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingInfo = null,
    Object? orderData = freezed,
    Object? message = null,
  }) {
    return _then(_$_RefundOrdersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingInfo: null == isLoadingInfo
          ? _value.isLoadingInfo
          : isLoadingInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      orderData: freezed == orderData
          ? _value.orderData
          : orderData // ignore: cast_nullable_to_non_nullable
              as OrderRefundData?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RefundOrdersState extends _RefundOrdersState {
  const _$_RefundOrdersState(
      {this.isLoading = false,
      this.isLoadingInfo = false,
      this.orderData,
      this.message = ''})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingInfo;
  @override
  final OrderRefundData? orderData;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'RefundOrdersState(isLoading: $isLoading, isLoadingInfo: $isLoadingInfo, orderData: $orderData, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefundOrdersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingInfo, isLoadingInfo) ||
                other.isLoadingInfo == isLoadingInfo) &&
            (identical(other.orderData, orderData) ||
                other.orderData == orderData) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isLoadingInfo, orderData, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefundOrdersStateCopyWith<_$_RefundOrdersState> get copyWith =>
      __$$_RefundOrdersStateCopyWithImpl<_$_RefundOrdersState>(
          this, _$identity);
}

abstract class _RefundOrdersState extends RefundOrdersState {
  const factory _RefundOrdersState(
      {final bool isLoading,
      final bool isLoadingInfo,
      final OrderRefundData? orderData,
      final String message}) = _$_RefundOrdersState;
  const _RefundOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isLoadingInfo;
  @override
  OrderRefundData? get orderData;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_RefundOrdersStateCopyWith<_$_RefundOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
