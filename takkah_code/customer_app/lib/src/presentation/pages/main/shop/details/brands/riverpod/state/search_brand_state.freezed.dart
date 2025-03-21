// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_brand_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchBrandState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  List<BrandData> get searchedBrands => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchBrandStateCopyWith<SearchBrandState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBrandStateCopyWith<$Res> {
  factory $SearchBrandStateCopyWith(
          SearchBrandState value, $Res Function(SearchBrandState) then) =
      _$SearchBrandStateCopyWithImpl<$Res, SearchBrandState>;
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<BrandData> searchedBrands,
      String query});
}

/// @nodoc
class _$SearchBrandStateCopyWithImpl<$Res, $Val extends SearchBrandState>
    implements $SearchBrandStateCopyWith<$Res> {
  _$SearchBrandStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedBrands = null,
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
      searchedBrands: null == searchedBrands
          ? _value.searchedBrands
          : searchedBrands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchBrandStateCopyWith<$Res>
    implements $SearchBrandStateCopyWith<$Res> {
  factory _$$_SearchBrandStateCopyWith(
          _$_SearchBrandState value, $Res Function(_$_SearchBrandState) then) =
      __$$_SearchBrandStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<BrandData> searchedBrands,
      String query});
}

/// @nodoc
class __$$_SearchBrandStateCopyWithImpl<$Res>
    extends _$SearchBrandStateCopyWithImpl<$Res, _$_SearchBrandState>
    implements _$$_SearchBrandStateCopyWith<$Res> {
  __$$_SearchBrandStateCopyWithImpl(
      _$_SearchBrandState _value, $Res Function(_$_SearchBrandState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedBrands = null,
    Object? query = null,
  }) {
    return _then(_$_SearchBrandState(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedBrands: null == searchedBrands
          ? _value._searchedBrands
          : searchedBrands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchBrandState extends _SearchBrandState {
  const _$_SearchBrandState(
      {this.isSearching = false,
      this.isSearchLoading = false,
      final List<BrandData> searchedBrands = const [],
      this.query = ''})
      : _searchedBrands = searchedBrands,
        super._();

  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isSearchLoading;
  final List<BrandData> _searchedBrands;
  @override
  @JsonKey()
  List<BrandData> get searchedBrands {
    if (_searchedBrands is EqualUnmodifiableListView) return _searchedBrands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedBrands);
  }

  @override
  @JsonKey()
  final String query;

  @override
  String toString() {
    return 'SearchBrandState(isSearching: $isSearching, isSearchLoading: $isSearchLoading, searchedBrands: $searchedBrands, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchBrandState &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            const DeepCollectionEquality()
                .equals(other._searchedBrands, _searchedBrands) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSearching, isSearchLoading,
      const DeepCollectionEquality().hash(_searchedBrands), query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchBrandStateCopyWith<_$_SearchBrandState> get copyWith =>
      __$$_SearchBrandStateCopyWithImpl<_$_SearchBrandState>(this, _$identity);
}

abstract class _SearchBrandState extends SearchBrandState {
  const factory _SearchBrandState(
      {final bool isSearching,
      final bool isSearchLoading,
      final List<BrandData> searchedBrands,
      final String query}) = _$_SearchBrandState;
  const _SearchBrandState._() : super._();

  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  List<BrandData> get searchedBrands;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$_SearchBrandStateCopyWith<_$_SearchBrandState> get copyWith =>
      throw _privateConstructorUsedError;
}
