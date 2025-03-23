// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  List<ProductData> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryDetailsStateCopyWith<CategoryDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDetailsStateCopyWith<$Res> {
  factory $CategoryDetailsStateCopyWith(CategoryDetailsState value,
          $Res Function(CategoryDetailsState) then) =
      _$CategoryDetailsStateCopyWithImpl<$Res, CategoryDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<ProductData> products});
}

/// @nodoc
class _$CategoryDetailsStateCopyWithImpl<$Res,
        $Val extends CategoryDetailsState>
    implements $CategoryDetailsStateCopyWith<$Res> {
  _$CategoryDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? hasMore = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryDetailsStateCopyWith<$Res>
    implements $CategoryDetailsStateCopyWith<$Res> {
  factory _$$_CategoryDetailsStateCopyWith(_$_CategoryDetailsState value,
          $Res Function(_$_CategoryDetailsState) then) =
      __$$_CategoryDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<ProductData> products});
}

/// @nodoc
class __$$_CategoryDetailsStateCopyWithImpl<$Res>
    extends _$CategoryDetailsStateCopyWithImpl<$Res, _$_CategoryDetailsState>
    implements _$$_CategoryDetailsStateCopyWith<$Res> {
  __$$_CategoryDetailsStateCopyWithImpl(_$_CategoryDetailsState _value,
      $Res Function(_$_CategoryDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? hasMore = null,
    Object? products = null,
  }) {
    return _then(_$_CategoryDetailsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ));
  }
}

/// @nodoc

class _$_CategoryDetailsState extends _CategoryDetailsState {
  const _$_CategoryDetailsState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      this.hasMore = true,
      final List<ProductData> products = const []})
      : _products = products,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  @override
  @JsonKey()
  final bool hasMore;
  final List<ProductData> _products;
  @override
  @JsonKey()
  List<ProductData> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'CategoryDetailsState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, hasMore: $hasMore, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryDetailsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      hasMore, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryDetailsStateCopyWith<_$_CategoryDetailsState> get copyWith =>
      __$$_CategoryDetailsStateCopyWithImpl<_$_CategoryDetailsState>(
          this, _$identity);
}

abstract class _CategoryDetailsState extends CategoryDetailsState {
  const factory _CategoryDetailsState(
      {final bool isLoading,
      final bool isMoreLoading,
      final bool hasMore,
      final List<ProductData> products}) = _$_CategoryDetailsState;
  const _CategoryDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  bool get hasMore;
  @override
  List<ProductData> get products;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryDetailsStateCopyWith<_$_CategoryDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
