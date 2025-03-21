// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateOrderState {
  bool get isCreating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateOrderStateCopyWith<CreateOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderStateCopyWith<$Res> {
  factory $CreateOrderStateCopyWith(
          CreateOrderState value, $Res Function(CreateOrderState) then) =
      _$CreateOrderStateCopyWithImpl<$Res, CreateOrderState>;
  @useResult
  $Res call({bool isCreating});
}

/// @nodoc
class _$CreateOrderStateCopyWithImpl<$Res, $Val extends CreateOrderState>
    implements $CreateOrderStateCopyWith<$Res> {
  _$CreateOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCreating = null,
  }) {
    return _then(_value.copyWith(
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateOrderStateCopyWith<$Res>
    implements $CreateOrderStateCopyWith<$Res> {
  factory _$$_CreateOrderStateCopyWith(
          _$_CreateOrderState value, $Res Function(_$_CreateOrderState) then) =
      __$$_CreateOrderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isCreating});
}

/// @nodoc
class __$$_CreateOrderStateCopyWithImpl<$Res>
    extends _$CreateOrderStateCopyWithImpl<$Res, _$_CreateOrderState>
    implements _$$_CreateOrderStateCopyWith<$Res> {
  __$$_CreateOrderStateCopyWithImpl(
      _$_CreateOrderState _value, $Res Function(_$_CreateOrderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCreating = null,
  }) {
    return _then(_$_CreateOrderState(
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreateOrderState extends _CreateOrderState {
  const _$_CreateOrderState({this.isCreating = false}) : super._();

  @override
  @JsonKey()
  final bool isCreating;

  @override
  String toString() {
    return 'CreateOrderState(isCreating: $isCreating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateOrderState &&
            (identical(other.isCreating, isCreating) ||
                other.isCreating == isCreating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isCreating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateOrderStateCopyWith<_$_CreateOrderState> get copyWith =>
      __$$_CreateOrderStateCopyWithImpl<_$_CreateOrderState>(this, _$identity);
}

abstract class _CreateOrderState extends CreateOrderState {
  const factory _CreateOrderState({final bool isCreating}) =
      _$_CreateOrderState;
  const _CreateOrderState._() : super._();

  @override
  bool get isCreating;
  @override
  @JsonKey(ignore: true)
  _$$_CreateOrderStateCopyWith<_$_CreateOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}
