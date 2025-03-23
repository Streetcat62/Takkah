// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filtered_shops_in_pickup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilteredShopsInPickupState {
  bool get isFilteredShopsLoading => throw _privateConstructorUsedError;
  bool get isMoreShopsLoading => throw _privateConstructorUsedError;
  bool get hasMoreShops => throw _privateConstructorUsedError;
  List<ShopData> get filteredShops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilteredShopsInPickupStateCopyWith<FilteredShopsInPickupState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilteredShopsInPickupStateCopyWith<$Res> {
  factory $FilteredShopsInPickupStateCopyWith(FilteredShopsInPickupState value,
          $Res Function(FilteredShopsInPickupState) then) =
      _$FilteredShopsInPickupStateCopyWithImpl<$Res,
          FilteredShopsInPickupState>;
  @useResult
  $Res call(
      {bool isFilteredShopsLoading,
      bool isMoreShopsLoading,
      bool hasMoreShops,
      List<ShopData> filteredShops});
}

/// @nodoc
class _$FilteredShopsInPickupStateCopyWithImpl<$Res,
        $Val extends FilteredShopsInPickupState>
    implements $FilteredShopsInPickupStateCopyWith<$Res> {
  _$FilteredShopsInPickupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFilteredShopsLoading = null,
    Object? isMoreShopsLoading = null,
    Object? hasMoreShops = null,
    Object? filteredShops = null,
  }) {
    return _then(_value.copyWith(
      isFilteredShopsLoading: null == isFilteredShopsLoading
          ? _value.isFilteredShopsLoading
          : isFilteredShopsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreShopsLoading: null == isMoreShopsLoading
          ? _value.isMoreShopsLoading
          : isMoreShopsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreShops: null == hasMoreShops
          ? _value.hasMoreShops
          : hasMoreShops // ignore: cast_nullable_to_non_nullable
              as bool,
      filteredShops: null == filteredShops
          ? _value.filteredShops
          : filteredShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilteredShopsInPickupStateCopyWith<$Res>
    implements $FilteredShopsInPickupStateCopyWith<$Res> {
  factory _$$_FilteredShopsInPickupStateCopyWith(
          _$_FilteredShopsInPickupState value,
          $Res Function(_$_FilteredShopsInPickupState) then) =
      __$$_FilteredShopsInPickupStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFilteredShopsLoading,
      bool isMoreShopsLoading,
      bool hasMoreShops,
      List<ShopData> filteredShops});
}

/// @nodoc
class __$$_FilteredShopsInPickupStateCopyWithImpl<$Res>
    extends _$FilteredShopsInPickupStateCopyWithImpl<$Res,
        _$_FilteredShopsInPickupState>
    implements _$$_FilteredShopsInPickupStateCopyWith<$Res> {
  __$$_FilteredShopsInPickupStateCopyWithImpl(
      _$_FilteredShopsInPickupState _value,
      $Res Function(_$_FilteredShopsInPickupState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFilteredShopsLoading = null,
    Object? isMoreShopsLoading = null,
    Object? hasMoreShops = null,
    Object? filteredShops = null,
  }) {
    return _then(_$_FilteredShopsInPickupState(
      isFilteredShopsLoading: null == isFilteredShopsLoading
          ? _value.isFilteredShopsLoading
          : isFilteredShopsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreShopsLoading: null == isMoreShopsLoading
          ? _value.isMoreShopsLoading
          : isMoreShopsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreShops: null == hasMoreShops
          ? _value.hasMoreShops
          : hasMoreShops // ignore: cast_nullable_to_non_nullable
              as bool,
      filteredShops: null == filteredShops
          ? _value._filteredShops
          : filteredShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
    ));
  }
}

/// @nodoc

class _$_FilteredShopsInPickupState extends _FilteredShopsInPickupState {
  const _$_FilteredShopsInPickupState(
      {this.isFilteredShopsLoading = false,
      this.isMoreShopsLoading = false,
      this.hasMoreShops = true,
      final List<ShopData> filteredShops = const []})
      : _filteredShops = filteredShops,
        super._();

  @override
  @JsonKey()
  final bool isFilteredShopsLoading;
  @override
  @JsonKey()
  final bool isMoreShopsLoading;
  @override
  @JsonKey()
  final bool hasMoreShops;
  final List<ShopData> _filteredShops;
  @override
  @JsonKey()
  List<ShopData> get filteredShops {
    if (_filteredShops is EqualUnmodifiableListView) return _filteredShops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredShops);
  }

  @override
  String toString() {
    return 'FilteredShopsInPickupState(isFilteredShopsLoading: $isFilteredShopsLoading, isMoreShopsLoading: $isMoreShopsLoading, hasMoreShops: $hasMoreShops, filteredShops: $filteredShops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FilteredShopsInPickupState &&
            (identical(other.isFilteredShopsLoading, isFilteredShopsLoading) ||
                other.isFilteredShopsLoading == isFilteredShopsLoading) &&
            (identical(other.isMoreShopsLoading, isMoreShopsLoading) ||
                other.isMoreShopsLoading == isMoreShopsLoading) &&
            (identical(other.hasMoreShops, hasMoreShops) ||
                other.hasMoreShops == hasMoreShops) &&
            const DeepCollectionEquality()
                .equals(other._filteredShops, _filteredShops));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFilteredShopsLoading,
      isMoreShopsLoading,
      hasMoreShops,
      const DeepCollectionEquality().hash(_filteredShops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilteredShopsInPickupStateCopyWith<_$_FilteredShopsInPickupState>
      get copyWith => __$$_FilteredShopsInPickupStateCopyWithImpl<
          _$_FilteredShopsInPickupState>(this, _$identity);
}

abstract class _FilteredShopsInPickupState extends FilteredShopsInPickupState {
  const factory _FilteredShopsInPickupState(
      {final bool isFilteredShopsLoading,
      final bool isMoreShopsLoading,
      final bool hasMoreShops,
      final List<ShopData> filteredShops}) = _$_FilteredShopsInPickupState;
  const _FilteredShopsInPickupState._() : super._();

  @override
  bool get isFilteredShopsLoading;
  @override
  bool get isMoreShopsLoading;
  @override
  bool get hasMoreShops;
  @override
  List<ShopData> get filteredShops;
  @override
  @JsonKey(ignore: true)
  _$$_FilteredShopsInPickupStateCopyWith<_$_FilteredShopsInPickupState>
      get copyWith => throw _privateConstructorUsedError;
}
