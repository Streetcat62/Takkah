// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_confirmation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterConfirmationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isResending => throw _privateConstructorUsedError;
  bool get isTimeExpired => throw _privateConstructorUsedError;
  bool get isCodeError => throw _privateConstructorUsedError;
  bool get isConfirm => throw _privateConstructorUsedError;
  String get confirmCode => throw _privateConstructorUsedError;
  String get timerText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterConfirmationStateCopyWith<RegisterConfirmationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterConfirmationStateCopyWith<$Res> {
  factory $RegisterConfirmationStateCopyWith(RegisterConfirmationState value,
          $Res Function(RegisterConfirmationState) then) =
      _$RegisterConfirmationStateCopyWithImpl<$Res, RegisterConfirmationState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isResending,
      bool isTimeExpired,
      bool isCodeError,
      bool isConfirm,
      String confirmCode,
      String timerText});
}

/// @nodoc
class _$RegisterConfirmationStateCopyWithImpl<$Res,
        $Val extends RegisterConfirmationState>
    implements $RegisterConfirmationStateCopyWith<$Res> {
  _$RegisterConfirmationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isResending = null,
    Object? isTimeExpired = null,
    Object? isCodeError = null,
    Object? isConfirm = null,
    Object? confirmCode = null,
    Object? timerText = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isResending: null == isResending
          ? _value.isResending
          : isResending // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeExpired: null == isTimeExpired
          ? _value.isTimeExpired
          : isTimeExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isCodeError: null == isCodeError
          ? _value.isCodeError
          : isCodeError // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirm: null == isConfirm
          ? _value.isConfirm
          : isConfirm // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmCode: null == confirmCode
          ? _value.confirmCode
          : confirmCode // ignore: cast_nullable_to_non_nullable
              as String,
      timerText: null == timerText
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterConfirmationStateCopyWith<$Res>
    implements $RegisterConfirmationStateCopyWith<$Res> {
  factory _$$_RegisterConfirmationStateCopyWith(
          _$_RegisterConfirmationState value,
          $Res Function(_$_RegisterConfirmationState) then) =
      __$$_RegisterConfirmationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isResending,
      bool isTimeExpired,
      bool isCodeError,
      bool isConfirm,
      String confirmCode,
      String timerText});
}

/// @nodoc
class __$$_RegisterConfirmationStateCopyWithImpl<$Res>
    extends _$RegisterConfirmationStateCopyWithImpl<$Res,
        _$_RegisterConfirmationState>
    implements _$$_RegisterConfirmationStateCopyWith<$Res> {
  __$$_RegisterConfirmationStateCopyWithImpl(
      _$_RegisterConfirmationState _value,
      $Res Function(_$_RegisterConfirmationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isResending = null,
    Object? isTimeExpired = null,
    Object? isCodeError = null,
    Object? isConfirm = null,
    Object? confirmCode = null,
    Object? timerText = null,
  }) {
    return _then(_$_RegisterConfirmationState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isResending: null == isResending
          ? _value.isResending
          : isResending // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeExpired: null == isTimeExpired
          ? _value.isTimeExpired
          : isTimeExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isCodeError: null == isCodeError
          ? _value.isCodeError
          : isCodeError // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirm: null == isConfirm
          ? _value.isConfirm
          : isConfirm // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmCode: null == confirmCode
          ? _value.confirmCode
          : confirmCode // ignore: cast_nullable_to_non_nullable
              as String,
      timerText: null == timerText
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterConfirmationState extends _RegisterConfirmationState {
  const _$_RegisterConfirmationState(
      {this.isLoading = false,
      this.isResending = false,
      this.isTimeExpired = false,
      this.isCodeError = false,
      this.isConfirm = false,
      this.confirmCode = '',
      this.timerText = '05:00'})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isResending;
  @override
  @JsonKey()
  final bool isTimeExpired;
  @override
  @JsonKey()
  final bool isCodeError;
  @override
  @JsonKey()
  final bool isConfirm;
  @override
  @JsonKey()
  final String confirmCode;
  @override
  @JsonKey()
  final String timerText;

  @override
  String toString() {
    return 'RegisterConfirmationState(isLoading: $isLoading, isResending: $isResending, isTimeExpired: $isTimeExpired, isCodeError: $isCodeError, isConfirm: $isConfirm, confirmCode: $confirmCode, timerText: $timerText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterConfirmationState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isResending, isResending) ||
                other.isResending == isResending) &&
            (identical(other.isTimeExpired, isTimeExpired) ||
                other.isTimeExpired == isTimeExpired) &&
            (identical(other.isCodeError, isCodeError) ||
                other.isCodeError == isCodeError) &&
            (identical(other.isConfirm, isConfirm) ||
                other.isConfirm == isConfirm) &&
            (identical(other.confirmCode, confirmCode) ||
                other.confirmCode == confirmCode) &&
            (identical(other.timerText, timerText) ||
                other.timerText == timerText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isResending,
      isTimeExpired, isCodeError, isConfirm, confirmCode, timerText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterConfirmationStateCopyWith<_$_RegisterConfirmationState>
      get copyWith => __$$_RegisterConfirmationStateCopyWithImpl<
          _$_RegisterConfirmationState>(this, _$identity);
}

abstract class _RegisterConfirmationState extends RegisterConfirmationState {
  const factory _RegisterConfirmationState(
      {final bool isLoading,
      final bool isResending,
      final bool isTimeExpired,
      final bool isCodeError,
      final bool isConfirm,
      final String confirmCode,
      final String timerText}) = _$_RegisterConfirmationState;
  const _RegisterConfirmationState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isResending;
  @override
  bool get isTimeExpired;
  @override
  bool get isCodeError;
  @override
  bool get isConfirm;
  @override
  String get confirmCode;
  @override
  String get timerText;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterConfirmationStateCopyWith<_$_RegisterConfirmationState>
      get copyWith => throw _privateConstructorUsedError;
}
