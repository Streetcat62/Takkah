// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bottom_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainBottomState {
  bool get isVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainBottomStateCopyWith<MainBottomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainBottomStateCopyWith<$Res> {
  factory $MainBottomStateCopyWith(
          MainBottomState value, $Res Function(MainBottomState) then) =
      _$MainBottomStateCopyWithImpl<$Res, MainBottomState>;
  @useResult
  $Res call({bool isVisible});
}

/// @nodoc
class _$MainBottomStateCopyWithImpl<$Res, $Val extends MainBottomState>
    implements $MainBottomStateCopyWith<$Res> {
  _$MainBottomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVisible = null,
  }) {
    return _then(_value.copyWith(
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainBottomStateCopyWith<$Res>
    implements $MainBottomStateCopyWith<$Res> {
  factory _$$_MainBottomStateCopyWith(
          _$_MainBottomState value, $Res Function(_$_MainBottomState) then) =
      __$$_MainBottomStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isVisible});
}

/// @nodoc
class __$$_MainBottomStateCopyWithImpl<$Res>
    extends _$MainBottomStateCopyWithImpl<$Res, _$_MainBottomState>
    implements _$$_MainBottomStateCopyWith<$Res> {
  __$$_MainBottomStateCopyWithImpl(
      _$_MainBottomState _value, $Res Function(_$_MainBottomState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVisible = null,
  }) {
    return _then(_$_MainBottomState(
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MainBottomState extends _MainBottomState {
  const _$_MainBottomState({this.isVisible = true}) : super._();

  @override
  @JsonKey()
  final bool isVisible;

  @override
  String toString() {
    return 'MainBottomState(isVisible: $isVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainBottomState &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainBottomStateCopyWith<_$_MainBottomState> get copyWith =>
      __$$_MainBottomStateCopyWithImpl<_$_MainBottomState>(this, _$identity);
}

abstract class _MainBottomState extends MainBottomState {
  const factory _MainBottomState({final bool isVisible}) = _$_MainBottomState;
  const _MainBottomState._() : super._();

  @override
  bool get isVisible;
  @override
  @JsonKey(ignore: true)
  _$$_MainBottomStateCopyWith<_$_MainBottomState> get copyWith =>
      throw _privateConstructorUsedError;
}
