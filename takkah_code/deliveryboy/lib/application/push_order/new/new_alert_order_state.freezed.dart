// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_alert_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewAlertOrderState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isTimeOut => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  String get timerText => throw _privateConstructorUsedError;
  OrderDetailData? get order => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewAlertOrderStateCopyWith<NewAlertOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewAlertOrderStateCopyWith<$Res> {
  factory $NewAlertOrderStateCopyWith(
          NewAlertOrderState value, $Res Function(NewAlertOrderState) then) =
      _$NewAlertOrderStateCopyWithImpl<$Res, NewAlertOrderState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isTimeOut,
      bool isSaving,
      String timerText,
      OrderDetailData? order});
}

/// @nodoc
class _$NewAlertOrderStateCopyWithImpl<$Res, $Val extends NewAlertOrderState>
    implements $NewAlertOrderStateCopyWith<$Res> {
  _$NewAlertOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTimeOut = null,
    Object? isSaving = null,
    Object? timerText = null,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeOut: null == isTimeOut
          ? _value.isTimeOut
          : isTimeOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      timerText: null == timerText
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDetailData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewAlertOrderStateCopyWith<$Res>
    implements $NewAlertOrderStateCopyWith<$Res> {
  factory _$$_NewAlertOrderStateCopyWith(_$_NewAlertOrderState value,
          $Res Function(_$_NewAlertOrderState) then) =
      __$$_NewAlertOrderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isTimeOut,
      bool isSaving,
      String timerText,
      OrderDetailData? order});
}

/// @nodoc
class __$$_NewAlertOrderStateCopyWithImpl<$Res>
    extends _$NewAlertOrderStateCopyWithImpl<$Res, _$_NewAlertOrderState>
    implements _$$_NewAlertOrderStateCopyWith<$Res> {
  __$$_NewAlertOrderStateCopyWithImpl(
      _$_NewAlertOrderState _value, $Res Function(_$_NewAlertOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTimeOut = null,
    Object? isSaving = null,
    Object? timerText = null,
    Object? order = freezed,
  }) {
    return _then(_$_NewAlertOrderState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeOut: null == isTimeOut
          ? _value.isTimeOut
          : isTimeOut // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      timerText: null == timerText
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderDetailData?,
    ));
  }
}

/// @nodoc

class _$_NewAlertOrderState extends _NewAlertOrderState {
  const _$_NewAlertOrderState(
      {this.isLoading = false,
      this.isTimeOut = false,
      this.isSaving = false,
      this.timerText = '0 s',
      this.order})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isTimeOut;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  @JsonKey()
  final String timerText;
  @override
  final OrderDetailData? order;

  @override
  String toString() {
    return 'NewAlertOrderState(isLoading: $isLoading, isTimeOut: $isTimeOut, isSaving: $isSaving, timerText: $timerText, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewAlertOrderState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isTimeOut, isTimeOut) ||
                other.isTimeOut == isTimeOut) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.timerText, timerText) ||
                other.timerText == timerText) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, isTimeOut, isSaving, timerText, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewAlertOrderStateCopyWith<_$_NewAlertOrderState> get copyWith =>
      __$$_NewAlertOrderStateCopyWithImpl<_$_NewAlertOrderState>(
          this, _$identity);
}

abstract class _NewAlertOrderState extends NewAlertOrderState {
  const factory _NewAlertOrderState(
      {final bool isLoading,
      final bool isTimeOut,
      final bool isSaving,
      final String timerText,
      final OrderDetailData? order}) = _$_NewAlertOrderState;
  const _NewAlertOrderState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isTimeOut;
  @override
  bool get isSaving;
  @override
  String get timerText;
  @override
  OrderDetailData? get order;
  @override
  @JsonKey(ignore: true)
  _$$_NewAlertOrderStateCopyWith<_$_NewAlertOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
