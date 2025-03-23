// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PushOrderState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isTimeOut => throw _privateConstructorUsedError;
  String get timerText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PushOrderStateCopyWith<PushOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushOrderStateCopyWith<$Res> {
  factory $PushOrderStateCopyWith(
          PushOrderState value, $Res Function(PushOrderState) then) =
      _$PushOrderStateCopyWithImpl<$Res, PushOrderState>;
  @useResult
  $Res call({bool isLoading, bool isTimeOut, String timerText});
}

/// @nodoc
class _$PushOrderStateCopyWithImpl<$Res, $Val extends PushOrderState>
    implements $PushOrderStateCopyWith<$Res> {
  _$PushOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTimeOut = null,
    Object? timerText = null,
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
      timerText: null == timerText
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PushOrderStateCopyWith<$Res>
    implements $PushOrderStateCopyWith<$Res> {
  factory _$$_PushOrderStateCopyWith(
          _$_PushOrderState value, $Res Function(_$_PushOrderState) then) =
      __$$_PushOrderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isTimeOut, String timerText});
}

/// @nodoc
class __$$_PushOrderStateCopyWithImpl<$Res>
    extends _$PushOrderStateCopyWithImpl<$Res, _$_PushOrderState>
    implements _$$_PushOrderStateCopyWith<$Res> {
  __$$_PushOrderStateCopyWithImpl(
      _$_PushOrderState _value, $Res Function(_$_PushOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTimeOut = null,
    Object? timerText = null,
  }) {
    return _then(_$_PushOrderState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeOut: null == isTimeOut
          ? _value.isTimeOut
          : isTimeOut // ignore: cast_nullable_to_non_nullable
              as bool,
      timerText: null == timerText
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PushOrderState extends _PushOrderState {
  const _$_PushOrderState(
      {this.isLoading = false, this.isTimeOut = false, this.timerText = '0 s'})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isTimeOut;
  @override
  @JsonKey()
  final String timerText;

  @override
  String toString() {
    return 'PushOrderState(isLoading: $isLoading, isTimeOut: $isTimeOut, timerText: $timerText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PushOrderState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isTimeOut, isTimeOut) ||
                other.isTimeOut == isTimeOut) &&
            (identical(other.timerText, timerText) ||
                other.timerText == timerText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isTimeOut, timerText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PushOrderStateCopyWith<_$_PushOrderState> get copyWith =>
      __$$_PushOrderStateCopyWithImpl<_$_PushOrderState>(this, _$identity);
}

abstract class _PushOrderState extends PushOrderState {
  const factory _PushOrderState(
      {final bool isLoading,
      final bool isTimeOut,
      final String timerText}) = _$_PushOrderState;
  const _PushOrderState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isTimeOut;
  @override
  String get timerText;
  @override
  @JsonKey(ignore: true)
  _$$_PushOrderStateCopyWith<_$_PushOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
