// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_on_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ViewOnMapState {
  bool get isChoosing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewOnMapStateCopyWith<ViewOnMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewOnMapStateCopyWith<$Res> {
  factory $ViewOnMapStateCopyWith(
          ViewOnMapState value, $Res Function(ViewOnMapState) then) =
      _$ViewOnMapStateCopyWithImpl<$Res, ViewOnMapState>;
  @useResult
  $Res call({bool isChoosing});
}

/// @nodoc
class _$ViewOnMapStateCopyWithImpl<$Res, $Val extends ViewOnMapState>
    implements $ViewOnMapStateCopyWith<$Res> {
  _$ViewOnMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChoosing = null,
  }) {
    return _then(_value.copyWith(
      isChoosing: null == isChoosing
          ? _value.isChoosing
          : isChoosing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ViewOnMapStateCopyWith<$Res>
    implements $ViewOnMapStateCopyWith<$Res> {
  factory _$$_ViewOnMapStateCopyWith(
          _$_ViewOnMapState value, $Res Function(_$_ViewOnMapState) then) =
      __$$_ViewOnMapStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isChoosing});
}

/// @nodoc
class __$$_ViewOnMapStateCopyWithImpl<$Res>
    extends _$ViewOnMapStateCopyWithImpl<$Res, _$_ViewOnMapState>
    implements _$$_ViewOnMapStateCopyWith<$Res> {
  __$$_ViewOnMapStateCopyWithImpl(
      _$_ViewOnMapState _value, $Res Function(_$_ViewOnMapState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChoosing = null,
  }) {
    return _then(_$_ViewOnMapState(
      isChoosing: null == isChoosing
          ? _value.isChoosing
          : isChoosing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ViewOnMapState extends _ViewOnMapState {
  const _$_ViewOnMapState({this.isChoosing = false}) : super._();

  @override
  @JsonKey()
  final bool isChoosing;

  @override
  String toString() {
    return 'ViewOnMapState(isChoosing: $isChoosing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewOnMapState &&
            (identical(other.isChoosing, isChoosing) ||
                other.isChoosing == isChoosing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isChoosing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewOnMapStateCopyWith<_$_ViewOnMapState> get copyWith =>
      __$$_ViewOnMapStateCopyWithImpl<_$_ViewOnMapState>(this, _$identity);
}

abstract class _ViewOnMapState extends ViewOnMapState {
  const factory _ViewOnMapState({final bool isChoosing}) = _$_ViewOnMapState;
  const _ViewOnMapState._() : super._();

  @override
  bool get isChoosing;
  @override
  @JsonKey(ignore: true)
  _$$_ViewOnMapStateCopyWith<_$_ViewOnMapState> get copyWith =>
      throw _privateConstructorUsedError;
}
