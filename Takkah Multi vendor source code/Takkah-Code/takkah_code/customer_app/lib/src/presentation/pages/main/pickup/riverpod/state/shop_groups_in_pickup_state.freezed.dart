// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_groups_in_pickup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopGroupsInPickupState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ShopGroupData> get groups => throw _privateConstructorUsedError;
  int get activeGroupIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopGroupsInPickupStateCopyWith<ShopGroupsInPickupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopGroupsInPickupStateCopyWith<$Res> {
  factory $ShopGroupsInPickupStateCopyWith(ShopGroupsInPickupState value,
          $Res Function(ShopGroupsInPickupState) then) =
      _$ShopGroupsInPickupStateCopyWithImpl<$Res, ShopGroupsInPickupState>;
  @useResult
  $Res call({bool isLoading, List<ShopGroupData> groups, int activeGroupIndex});
}

/// @nodoc
class _$ShopGroupsInPickupStateCopyWithImpl<$Res,
        $Val extends ShopGroupsInPickupState>
    implements $ShopGroupsInPickupStateCopyWith<$Res> {
  _$ShopGroupsInPickupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? groups = null,
    Object? activeGroupIndex = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<ShopGroupData>,
      activeGroupIndex: null == activeGroupIndex
          ? _value.activeGroupIndex
          : activeGroupIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopGroupsInPickupStateCopyWith<$Res>
    implements $ShopGroupsInPickupStateCopyWith<$Res> {
  factory _$$_ShopGroupsInPickupStateCopyWith(_$_ShopGroupsInPickupState value,
          $Res Function(_$_ShopGroupsInPickupState) then) =
      __$$_ShopGroupsInPickupStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ShopGroupData> groups, int activeGroupIndex});
}

/// @nodoc
class __$$_ShopGroupsInPickupStateCopyWithImpl<$Res>
    extends _$ShopGroupsInPickupStateCopyWithImpl<$Res,
        _$_ShopGroupsInPickupState>
    implements _$$_ShopGroupsInPickupStateCopyWith<$Res> {
  __$$_ShopGroupsInPickupStateCopyWithImpl(_$_ShopGroupsInPickupState _value,
      $Res Function(_$_ShopGroupsInPickupState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? groups = null,
    Object? activeGroupIndex = null,
  }) {
    return _then(_$_ShopGroupsInPickupState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      groups: null == groups
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<ShopGroupData>,
      activeGroupIndex: null == activeGroupIndex
          ? _value.activeGroupIndex
          : activeGroupIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ShopGroupsInPickupState extends _ShopGroupsInPickupState {
  const _$_ShopGroupsInPickupState(
      {this.isLoading = false,
      final List<ShopGroupData> groups = const [],
      this.activeGroupIndex = 0})
      : _groups = groups,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ShopGroupData> _groups;
  @override
  @JsonKey()
  List<ShopGroupData> get groups {
    if (_groups is EqualUnmodifiableListView) return _groups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groups);
  }

  @override
  @JsonKey()
  final int activeGroupIndex;

  @override
  String toString() {
    return 'ShopGroupsInPickupState(isLoading: $isLoading, groups: $groups, activeGroupIndex: $activeGroupIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopGroupsInPickupState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            (identical(other.activeGroupIndex, activeGroupIndex) ||
                other.activeGroupIndex == activeGroupIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_groups), activeGroupIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopGroupsInPickupStateCopyWith<_$_ShopGroupsInPickupState>
      get copyWith =>
          __$$_ShopGroupsInPickupStateCopyWithImpl<_$_ShopGroupsInPickupState>(
              this, _$identity);
}

abstract class _ShopGroupsInPickupState extends ShopGroupsInPickupState {
  const factory _ShopGroupsInPickupState(
      {final bool isLoading,
      final List<ShopGroupData> groups,
      final int activeGroupIndex}) = _$_ShopGroupsInPickupState;
  const _ShopGroupsInPickupState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ShopGroupData> get groups;
  @override
  int get activeGroupIndex;
  @override
  @JsonKey(ignore: true)
  _$$_ShopGroupsInPickupStateCopyWith<_$_ShopGroupsInPickupState>
      get copyWith => throw _privateConstructorUsedError;
}
