// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_main_bottom_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopMainBottomState {
  bool get isVisible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopMainBottomStateCopyWith<ShopMainBottomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopMainBottomStateCopyWith<$Res> {
  factory $ShopMainBottomStateCopyWith(
          ShopMainBottomState value, $Res Function(ShopMainBottomState) then) =
      _$ShopMainBottomStateCopyWithImpl<$Res, ShopMainBottomState>;
  @useResult
  $Res call({bool isVisible});
}

/// @nodoc
class _$ShopMainBottomStateCopyWithImpl<$Res, $Val extends ShopMainBottomState>
    implements $ShopMainBottomStateCopyWith<$Res> {
  _$ShopMainBottomStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_ShopMainBottomStateCopyWith<$Res>
    implements $ShopMainBottomStateCopyWith<$Res> {
  factory _$$_ShopMainBottomStateCopyWith(_$_ShopMainBottomState value,
          $Res Function(_$_ShopMainBottomState) then) =
      __$$_ShopMainBottomStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isVisible});
}

/// @nodoc
class __$$_ShopMainBottomStateCopyWithImpl<$Res>
    extends _$ShopMainBottomStateCopyWithImpl<$Res, _$_ShopMainBottomState>
    implements _$$_ShopMainBottomStateCopyWith<$Res> {
  __$$_ShopMainBottomStateCopyWithImpl(_$_ShopMainBottomState _value,
      $Res Function(_$_ShopMainBottomState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVisible = null,
  }) {
    return _then(_$_ShopMainBottomState(
      isVisible: null == isVisible
          ? _value.isVisible
          : isVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ShopMainBottomState extends _ShopMainBottomState {
  const _$_ShopMainBottomState({this.isVisible = true}) : super._();

  @override
  @JsonKey()
  final bool isVisible;

  @override
  String toString() {
    return 'ShopMainBottomState(isVisible: $isVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopMainBottomState &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isVisible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopMainBottomStateCopyWith<_$_ShopMainBottomState> get copyWith =>
      __$$_ShopMainBottomStateCopyWithImpl<_$_ShopMainBottomState>(
          this, _$identity);
}

abstract class _ShopMainBottomState extends ShopMainBottomState {
  const factory _ShopMainBottomState({final bool isVisible}) =
      _$_ShopMainBottomState;
  const _ShopMainBottomState._() : super._();

  @override
  bool get isVisible;
  @override
  @JsonKey(ignore: true)
  _$$_ShopMainBottomStateCopyWith<_$_ShopMainBottomState> get copyWith =>
      throw _privateConstructorUsedError;
}
