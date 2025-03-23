// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnlineState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnlineStateCopyWith<OnlineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineStateCopyWith<$Res> {
  factory $OnlineStateCopyWith(
          OnlineState value, $Res Function(OnlineState) then) =
      _$OnlineStateCopyWithImpl<$Res, OnlineState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$OnlineStateCopyWithImpl<$Res, $Val extends OnlineState>
    implements $OnlineStateCopyWith<$Res> {
  _$OnlineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnlineStateCopyWith<$Res>
    implements $OnlineStateCopyWith<$Res> {
  factory _$$_OnlineStateCopyWith(
          _$_OnlineState value, $Res Function(_$_OnlineState) then) =
      __$$_OnlineStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_OnlineStateCopyWithImpl<$Res>
    extends _$OnlineStateCopyWithImpl<$Res, _$_OnlineState>
    implements _$$_OnlineStateCopyWith<$Res> {
  __$$_OnlineStateCopyWithImpl(
      _$_OnlineState _value, $Res Function(_$_OnlineState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_OnlineState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OnlineState extends _OnlineState {
  const _$_OnlineState({this.isLoading = false}) : super._();

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'OnlineState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnlineState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnlineStateCopyWith<_$_OnlineState> get copyWith =>
      __$$_OnlineStateCopyWithImpl<_$_OnlineState>(this, _$identity);
}

abstract class _OnlineState extends OnlineState {
  const factory _OnlineState({final bool isLoading}) = _$_OnlineState;
  const _OnlineState._() : super._();

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_OnlineStateCopyWith<_$_OnlineState> get copyWith =>
      throw _privateConstructorUsedError;
}
