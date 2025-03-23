// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredients_visible_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IngredientsVisibleState {
  bool get isVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IngredientsVisibleStateCopyWith<IngredientsVisibleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientsVisibleStateCopyWith<$Res> {
  factory $IngredientsVisibleStateCopyWith(IngredientsVisibleState value,
          $Res Function(IngredientsVisibleState) then) =
      _$IngredientsVisibleStateCopyWithImpl<$Res, IngredientsVisibleState>;
  @useResult
  $Res call({bool isVisible});
}

/// @nodoc
class _$IngredientsVisibleStateCopyWithImpl<$Res,
        $Val extends IngredientsVisibleState>
    implements $IngredientsVisibleStateCopyWith<$Res> {
  _$IngredientsVisibleStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_IngredientsVisibleStateCopyWith<$Res>
    implements $IngredientsVisibleStateCopyWith<$Res> {
  factory _$$_IngredientsVisibleStateCopyWith(_$_IngredientsVisibleState value,
          $Res Function(_$_IngredientsVisibleState) then) =
      __$$_IngredientsVisibleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isVisible});
}

/// @nodoc
class __$$_IngredientsVisibleStateCopyWithImpl<$Res>
    extends _$IngredientsVisibleStateCopyWithImpl<$Res,
        _$_IngredientsVisibleState>
    implements _$$_IngredientsVisibleStateCopyWith<$Res> {
  __$$_IngredientsVisibleStateCopyWithImpl(_$_IngredientsVisibleState _value,
      $Res Function(_$_IngredientsVisibleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVisible = null,
  }) {
    return _then(_$_IngredientsVisibleState(
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_IngredientsVisibleState extends _IngredientsVisibleState {
  const _$_IngredientsVisibleState({this.isVisible = false}) : super._();

  @override
  @JsonKey()
  final bool isVisible;

  @override
  String toString() {
    return 'IngredientsVisibleState(isVisible: $isVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IngredientsVisibleState &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IngredientsVisibleStateCopyWith<_$_IngredientsVisibleState>
      get copyWith =>
          __$$_IngredientsVisibleStateCopyWithImpl<_$_IngredientsVisibleState>(
              this, _$identity);
}

abstract class _IngredientsVisibleState extends IngredientsVisibleState {
  const factory _IngredientsVisibleState({final bool isVisible}) =
      _$_IngredientsVisibleState;
  const _IngredientsVisibleState._() : super._();

  @override
  bool get isVisible;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientsVisibleStateCopyWith<_$_IngredientsVisibleState>
      get copyWith => throw _privateConstructorUsedError;
}
