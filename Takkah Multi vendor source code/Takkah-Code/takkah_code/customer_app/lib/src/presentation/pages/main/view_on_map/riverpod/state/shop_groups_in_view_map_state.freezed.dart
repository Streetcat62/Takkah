// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_groups_in_view_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopGroupsInViewMapState {
  int get activeGroupIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopGroupsInViewMapStateCopyWith<ShopGroupsInViewMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopGroupsInViewMapStateCopyWith<$Res> {
  factory $ShopGroupsInViewMapStateCopyWith(ShopGroupsInViewMapState value,
          $Res Function(ShopGroupsInViewMapState) then) =
      _$ShopGroupsInViewMapStateCopyWithImpl<$Res, ShopGroupsInViewMapState>;
  @useResult
  $Res call({int activeGroupIndex});
}

/// @nodoc
class _$ShopGroupsInViewMapStateCopyWithImpl<$Res,
        $Val extends ShopGroupsInViewMapState>
    implements $ShopGroupsInViewMapStateCopyWith<$Res> {
  _$ShopGroupsInViewMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeGroupIndex = null,
  }) {
    return _then(_value.copyWith(
      activeGroupIndex: null == activeGroupIndex
          ? _value.activeGroupIndex
          : activeGroupIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopGroupsInViewMapStateCopyWith<$Res>
    implements $ShopGroupsInViewMapStateCopyWith<$Res> {
  factory _$$_ShopGroupsInViewMapStateCopyWith(
          _$_ShopGroupsInViewMapState value,
          $Res Function(_$_ShopGroupsInViewMapState) then) =
      __$$_ShopGroupsInViewMapStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int activeGroupIndex});
}

/// @nodoc
class __$$_ShopGroupsInViewMapStateCopyWithImpl<$Res>
    extends _$ShopGroupsInViewMapStateCopyWithImpl<$Res,
        _$_ShopGroupsInViewMapState>
    implements _$$_ShopGroupsInViewMapStateCopyWith<$Res> {
  __$$_ShopGroupsInViewMapStateCopyWithImpl(_$_ShopGroupsInViewMapState _value,
      $Res Function(_$_ShopGroupsInViewMapState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeGroupIndex = null,
  }) {
    return _then(_$_ShopGroupsInViewMapState(
      activeGroupIndex: null == activeGroupIndex
          ? _value.activeGroupIndex
          : activeGroupIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ShopGroupsInViewMapState extends _ShopGroupsInViewMapState {
  const _$_ShopGroupsInViewMapState({this.activeGroupIndex = 0}) : super._();

  @override
  @JsonKey()
  final int activeGroupIndex;

  @override
  String toString() {
    return 'ShopGroupsInViewMapState(activeGroupIndex: $activeGroupIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopGroupsInViewMapState &&
            (identical(other.activeGroupIndex, activeGroupIndex) ||
                other.activeGroupIndex == activeGroupIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeGroupIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopGroupsInViewMapStateCopyWith<_$_ShopGroupsInViewMapState>
      get copyWith => __$$_ShopGroupsInViewMapStateCopyWithImpl<
          _$_ShopGroupsInViewMapState>(this, _$identity);
}

abstract class _ShopGroupsInViewMapState extends ShopGroupsInViewMapState {
  const factory _ShopGroupsInViewMapState({final int activeGroupIndex}) =
      _$_ShopGroupsInViewMapState;
  const _ShopGroupsInViewMapState._() : super._();

  @override
  int get activeGroupIndex;
  @override
  @JsonKey(ignore: true)
  _$$_ShopGroupsInViewMapStateCopyWith<_$_ShopGroupsInViewMapState>
      get copyWith => throw _privateConstructorUsedError;
}
