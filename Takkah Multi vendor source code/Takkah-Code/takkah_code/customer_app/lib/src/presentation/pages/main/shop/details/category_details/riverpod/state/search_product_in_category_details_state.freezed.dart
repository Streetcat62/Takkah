// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_product_in_category_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchProductInCategoryDetailsState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  List<ProductData> get searchedProducts => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchProductInCategoryDetailsStateCopyWith<
          SearchProductInCategoryDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchProductInCategoryDetailsStateCopyWith<$Res> {
  factory $SearchProductInCategoryDetailsStateCopyWith(
          SearchProductInCategoryDetailsState value,
          $Res Function(SearchProductInCategoryDetailsState) then) =
      _$SearchProductInCategoryDetailsStateCopyWithImpl<$Res,
          SearchProductInCategoryDetailsState>;
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<ProductData> searchedProducts,
      String query});
}

/// @nodoc
class _$SearchProductInCategoryDetailsStateCopyWithImpl<$Res,
        $Val extends SearchProductInCategoryDetailsState>
    implements $SearchProductInCategoryDetailsStateCopyWith<$Res> {
  _$SearchProductInCategoryDetailsStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_SearchProductInCategoryDetailsStateCopyWith<$Res>
    implements $SearchProductInCategoryDetailsStateCopyWith<$Res> {
  factory _$$_SearchProductInCategoryDetailsStateCopyWith(
          _$_SearchProductInCategoryDetailsState value,
          $Res Function(_$_SearchProductInCategoryDetailsState) then) =
      __$$_SearchProductInCategoryDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<ProductData> searchedProducts,
      String query});
}

/// @nodoc
class __$$_SearchProductInCategoryDetailsStateCopyWithImpl<$Res>
    extends _$SearchProductInCategoryDetailsStateCopyWithImpl<$Res,
        _$_SearchProductInCategoryDetailsState>
    implements _$$_SearchProductInCategoryDetailsStateCopyWith<$Res> {
  __$$_SearchProductInCategoryDetailsStateCopyWithImpl(
      _$_SearchProductInCategoryDetailsState _value,
      $Res Function(_$_SearchProductInCategoryDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedProducts = null,
    Object? query = null,
  }) {
    return _then(_$_SearchProductInCategoryDetailsState(
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

class _$_SearchProductInCategoryDetailsState
    extends _SearchProductInCategoryDetailsState {
  const _$_SearchProductInCategoryDetailsState(
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
    return 'SearchProductInCategoryDetailsState(isSearching: $isSearching, isSearchLoading: $isSearchLoading, searchedProducts: $searchedProducts, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchProductInCategoryDetailsState &&
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
  _$$_SearchProductInCategoryDetailsStateCopyWith<
          _$_SearchProductInCategoryDetailsState>
      get copyWith => __$$_SearchProductInCategoryDetailsStateCopyWithImpl<
          _$_SearchProductInCategoryDetailsState>(this, _$identity);
}

abstract class _SearchProductInCategoryDetailsState
    extends SearchProductInCategoryDetailsState {
  const factory _SearchProductInCategoryDetailsState(
      {final bool isSearching,
      final bool isSearchLoading,
      final List<ProductData> searchedProducts,
      final String query}) = _$_SearchProductInCategoryDetailsState;
  const _SearchProductInCategoryDetailsState._() : super._();

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
  _$$_SearchProductInCategoryDetailsStateCopyWith<
          _$_SearchProductInCategoryDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
