// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_product_in_banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchProductInBannerState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  List<ProductData> get searchedProducts => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchProductInBannerStateCopyWith<SearchProductInBannerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProductInBannerStateCopyWith<$Res> {
  factory $SearchProductInBannerStateCopyWith(SearchProductInBannerState value,
          $Res Function(SearchProductInBannerState) then) =
      _$SearchProductInBannerStateCopyWithImpl<$Res,
          SearchProductInBannerState>;
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<ProductData> searchedProducts,
      String query});
}

/// @nodoc
class _$SearchProductInBannerStateCopyWithImpl<$Res,
        $Val extends SearchProductInBannerState>
    implements $SearchProductInBannerStateCopyWith<$Res> {
  _$SearchProductInBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedProducts = null,
    Object? query = null,
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
      searchedProducts: null == searchedProducts
          ? _value.searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchProductInBannerStateCopyWith<$Res>
    implements $SearchProductInBannerStateCopyWith<$Res> {
  factory _$$_SearchProductInBannerStateCopyWith(
          _$_SearchProductInBannerState value,
          $Res Function(_$_SearchProductInBannerState) then) =
      __$$_SearchProductInBannerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<ProductData> searchedProducts,
      String query});
}

/// @nodoc
class __$$_SearchProductInBannerStateCopyWithImpl<$Res>
    extends _$SearchProductInBannerStateCopyWithImpl<$Res,
        _$_SearchProductInBannerState>
    implements _$$_SearchProductInBannerStateCopyWith<$Res> {
  __$$_SearchProductInBannerStateCopyWithImpl(
      _$_SearchProductInBannerState _value,
      $Res Function(_$_SearchProductInBannerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedProducts = null,
    Object? query = null,
  }) {
    return _then(_$_SearchProductInBannerState(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedProducts: null == searchedProducts
          ? _value._searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchProductInBannerState extends _SearchProductInBannerState {
  const _$_SearchProductInBannerState(
      {this.isSearching = false,
      this.isSearchLoading = false,
      final List<ProductData> searchedProducts = const [],
      this.query = ''})
      : _searchedProducts = searchedProducts,
        super._();

  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isSearchLoading;
  final List<ProductData> _searchedProducts;
  @override
  @JsonKey()
  List<ProductData> get searchedProducts {
    if (_searchedProducts is EqualUnmodifiableListView)
      return _searchedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedProducts);
  }

  @override
  @JsonKey()
  final String query;

  @override
  String toString() {
    return 'SearchProductInBannerState(isSearching: $isSearching, isSearchLoading: $isSearchLoading, searchedProducts: $searchedProducts, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchProductInBannerState &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            const DeepCollectionEquality()
                .equals(other._searchedProducts, _searchedProducts) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSearching, isSearchLoading,
      const DeepCollectionEquality().hash(_searchedProducts), query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchProductInBannerStateCopyWith<_$_SearchProductInBannerState>
      get copyWith => __$$_SearchProductInBannerStateCopyWithImpl<
          _$_SearchProductInBannerState>(this, _$identity);
}

abstract class _SearchProductInBannerState extends SearchProductInBannerState {
  const factory _SearchProductInBannerState(
      {final bool isSearching,
      final bool isSearchLoading,
      final List<ProductData> searchedProducts,
      final String query}) = _$_SearchProductInBannerState;
  const _SearchProductInBannerState._() : super._();

  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  List<ProductData> get searchedProducts;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$_SearchProductInBannerStateCopyWith<_$_SearchProductInBannerState>
      get copyWith => throw _privateConstructorUsedError;
}
