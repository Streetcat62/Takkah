// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_shop_in_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchShopInMapState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  List<ShopData> get searchedShops => throw _privateConstructorUsedError;
  String get shopQuery => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchShopInMapStateCopyWith<SearchShopInMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchShopInMapStateCopyWith<$Res> {
  factory $SearchShopInMapStateCopyWith(SearchShopInMapState value,
          $Res Function(SearchShopInMapState) then) =
      _$SearchShopInMapStateCopyWithImpl<$Res, SearchShopInMapState>;
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<ShopData> searchedShops,
      String shopQuery});
}

/// @nodoc
class _$SearchShopInMapStateCopyWithImpl<$Res,
        $Val extends SearchShopInMapState>
    implements $SearchShopInMapStateCopyWith<$Res> {
  _$SearchShopInMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedShops = null,
    Object? shopQuery = null,
  }) {
    return _then(_value.copyWith(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedShops: null == searchedShops
          ? _value.searchedShops
          : searchedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shopQuery: null == shopQuery
          ? _value.shopQuery
          : shopQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchShopInMapStateCopyWith<$Res>
    implements $SearchShopInMapStateCopyWith<$Res> {
  factory _$$_SearchShopInMapStateCopyWith(_$_SearchShopInMapState value,
          $Res Function(_$_SearchShopInMapState) then) =
      __$$_SearchShopInMapStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<ShopData> searchedShops,
      String shopQuery});
}

/// @nodoc
class __$$_SearchShopInMapStateCopyWithImpl<$Res>
    extends _$SearchShopInMapStateCopyWithImpl<$Res, _$_SearchShopInMapState>
    implements _$$_SearchShopInMapStateCopyWith<$Res> {
  __$$_SearchShopInMapStateCopyWithImpl(_$_SearchShopInMapState _value,
      $Res Function(_$_SearchShopInMapState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedShops = null,
    Object? shopQuery = null,
  }) {
    return _then(_$_SearchShopInMapState(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedShops: null == searchedShops
          ? _value._searchedShops
          : searchedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shopQuery: null == shopQuery
          ? _value.shopQuery
          : shopQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchShopInMapState extends _SearchShopInMapState {
  const _$_SearchShopInMapState(
      {this.isSearching = false,
      this.isSearchLoading = false,
      final List<ShopData> searchedShops = const [],
      this.shopQuery = ''})
      : _searchedShops = searchedShops,
        super._();

  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isSearchLoading;
  final List<ShopData> _searchedShops;
  @override
  @JsonKey()
  List<ShopData> get searchedShops {
    if (_searchedShops is EqualUnmodifiableListView) return _searchedShops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedShops);
  }

  @override
  @JsonKey()
  final String shopQuery;

  @override
  String toString() {
    return 'SearchShopInMapState(isSearching: $isSearching, isSearchLoading: $isSearchLoading, searchedShops: $searchedShops, shopQuery: $shopQuery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchShopInMapState &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            const DeepCollectionEquality()
                .equals(other._searchedShops, _searchedShops) &&
            (identical(other.shopQuery, shopQuery) ||
                other.shopQuery == shopQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSearching, isSearchLoading,
      const DeepCollectionEquality().hash(_searchedShops), shopQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchShopInMapStateCopyWith<_$_SearchShopInMapState> get copyWith =>
      __$$_SearchShopInMapStateCopyWithImpl<_$_SearchShopInMapState>(
          this, _$identity);
}

abstract class _SearchShopInMapState extends SearchShopInMapState {
  const factory _SearchShopInMapState(
      {final bool isSearching,
      final bool isSearchLoading,
      final List<ShopData> searchedShops,
      final String shopQuery}) = _$_SearchShopInMapState;
  const _SearchShopInMapState._() : super._();

  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  List<ShopData> get searchedShops;
  @override
  String get shopQuery;
  @override
  @JsonKey(ignore: true)
  _$$_SearchShopInMapStateCopyWith<_$_SearchShopInMapState> get copyWith =>
      throw _privateConstructorUsedError;
}
