// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodState {
  bool get toggle => throw _privateConstructorUsedError;
  int get timeIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodStateCopyWith<FoodState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodStateCopyWith<$Res> {
  factory $FoodStateCopyWith(FoodState value, $Res Function(FoodState) then) =
      _$FoodStateCopyWithImpl<$Res, FoodState>;
  @useResult
  $Res call({bool toggle, int timeIndex});
}

/// @nodoc
class _$FoodStateCopyWithImpl<$Res, $Val extends FoodState>
    implements $FoodStateCopyWith<$Res> {
  _$FoodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toggle = null,
    Object? timeIndex = null,
  }) {
    return _then(_value.copyWith(
      toggle: null == toggle
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as bool,
      timeIndex: null == timeIndex
          ? _value.timeIndex
          : timeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FoodStateCopyWith<$Res> implements $FoodStateCopyWith<$Res> {
  factory _$$_FoodStateCopyWith(
          _$_FoodState value, $Res Function(_$_FoodState) then) =
      __$$_FoodStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool toggle, int timeIndex});
}

/// @nodoc
class __$$_FoodStateCopyWithImpl<$Res>
    extends _$FoodStateCopyWithImpl<$Res, _$_FoodState>
    implements _$$_FoodStateCopyWith<$Res> {
  __$$_FoodStateCopyWithImpl(
      _$_FoodState _value, $Res Function(_$_FoodState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toggle = null,
    Object? timeIndex = null,
  }) {
    return _then(_$_FoodState(
      toggle: null == toggle
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as bool,
      timeIndex: null == timeIndex
          ? _value.timeIndex
          : timeIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FoodState extends _FoodState {
  const _$_FoodState({this.toggle = true, this.timeIndex = 0}) : super._();

  @override
  @JsonKey()
  final bool toggle;
  @override
  @JsonKey()
  final int timeIndex;

  @override
  String toString() {
    return 'FoodState(toggle: $toggle, timeIndex: $timeIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodState &&
            (identical(other.toggle, toggle) || other.toggle == toggle) &&
            (identical(other.timeIndex, timeIndex) ||
                other.timeIndex == timeIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toggle, timeIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodStateCopyWith<_$_FoodState> get copyWith =>
      __$$_FoodStateCopyWithImpl<_$_FoodState>(this, _$identity);
}

abstract class _FoodState extends FoodState {
  const factory _FoodState({final bool toggle, final int timeIndex}) =
      _$_FoodState;
  const _FoodState._() : super._();

  @override
  bool get toggle;
  @override
  int get timeIndex;
  @override
  @JsonKey(ignore: true)
  _$$_FoodStateCopyWith<_$_FoodState> get copyWith =>
      throw _privateConstructorUsedError;
}
