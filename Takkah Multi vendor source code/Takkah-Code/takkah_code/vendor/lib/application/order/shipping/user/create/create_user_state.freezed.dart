// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateUserState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateUserStateCopyWith<CreateUserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserStateCopyWith<$Res> {
  factory $CreateUserStateCopyWith(
          CreateUserState value, $Res Function(CreateUserState) then) =
      _$CreateUserStateCopyWithImpl<$Res, CreateUserState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$CreateUserStateCopyWithImpl<$Res, $Val extends CreateUserState>
    implements $CreateUserStateCopyWith<$Res> {
  _$CreateUserStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_CreateUserStateCopyWith<$Res>
    implements $CreateUserStateCopyWith<$Res> {
  factory _$$_CreateUserStateCopyWith(
          _$_CreateUserState value, $Res Function(_$_CreateUserState) then) =
      __$$_CreateUserStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_CreateUserStateCopyWithImpl<$Res>
    extends _$CreateUserStateCopyWithImpl<$Res, _$_CreateUserState>
    implements _$$_CreateUserStateCopyWith<$Res> {
  __$$_CreateUserStateCopyWithImpl(
      _$_CreateUserState _value, $Res Function(_$_CreateUserState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_CreateUserState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreateUserState extends _CreateUserState {
  const _$_CreateUserState({this.isLoading = false}) : super._();

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CreateUserState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateUserState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateUserStateCopyWith<_$_CreateUserState> get copyWith =>
      __$$_CreateUserStateCopyWithImpl<_$_CreateUserState>(this, _$identity);
}

abstract class _CreateUserState extends CreateUserState {
  const factory _CreateUserState({final bool isLoading}) = _$_CreateUserState;
  const _CreateUserState._() : super._();

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_CreateUserStateCopyWith<_$_CreateUserState> get copyWith =>
      throw _privateConstructorUsedError;
}
