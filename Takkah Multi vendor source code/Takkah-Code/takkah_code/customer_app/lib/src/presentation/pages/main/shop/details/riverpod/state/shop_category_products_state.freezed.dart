// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_category_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopCategoryProductsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  List<ShopCategoryData> get shopCategoryProducts =>
      throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopCategoryProductsStateCopyWith<ShopCategoryProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCategoryProductsStateCopyWith<$Res> {
  factory $ShopCategoryProductsStateCopyWith(ShopCategoryProductsState value,
          $Res Function(ShopCategoryProductsState) then) =
      _$ShopCategoryProductsStateCopyWithImpl<$Res, ShopCategoryProductsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<ShopCategoryData> shopCategoryProducts,
      int count});
}

/// @nodoc
class _$ShopCategoryProductsStateCopyWithImpl<$Res,
        $Val extends ShopCategoryProductsState>
    implements $ShopCategoryProductsStateCopyWith<$Res> {
  _$ShopCategoryProductsStateCopyWithImpl(this._value, this._then);

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
    Object? shopCategoryProducts = null,
    Object? count = null,
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
      shopCategoryProducts: null == shopCategoryProducts
          ? _value.shopCategoryProducts
          : shopCategoryProducts // ignore: cast_nullable_to_non_nullable
              as List<ShopCategoryData>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopCategoryProductsStateCopyWith<$Res>
    implements $ShopCategoryProductsStateCopyWith<$Res> {
  factory _$$_ShopCategoryProductsStateCopyWith(
          _$_ShopCategoryProductsState value,
          $Res Function(_$_ShopCategoryProductsState) then) =
      __$$_ShopCategoryProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<ShopCategoryData> shopCategoryProducts,
      int count});
}

/// @nodoc
class __$$_ShopCategoryProductsStateCopyWithImpl<$Res>
    extends _$ShopCategoryProductsStateCopyWithImpl<$Res,
        _$_ShopCategoryProductsState>
    implements _$$_ShopCategoryProductsStateCopyWith<$Res> {
  __$$_ShopCategoryProductsStateCopyWithImpl(
      _$_ShopCategoryProductsState _value,
      $Res Function(_$_ShopCategoryProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? hasMore = null,
    Object? shopCategoryProducts = null,
    Object? count = null,
  }) {
    return _then(_$_ShopCategoryProductsState(
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
      shopCategoryProducts: null == shopCategoryProducts
          ? _value._shopCategoryProducts
          : shopCategoryProducts // ignore: cast_nullable_to_non_nullable
              as List<ShopCategoryData>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ShopCategoryProductsState extends _ShopCategoryProductsState {
  const _$_ShopCategoryProductsState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      this.hasMore = true,
      final List<ShopCategoryData> shopCategoryProducts = const [],
      this.count = 0})
      : _shopCategoryProducts = shopCategoryProducts,
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
  final List<ShopCategoryData> _shopCategoryProducts;
  @override
  @JsonKey()
  List<ShopCategoryData> get shopCategoryProducts {
    if (_shopCategoryProducts is EqualUnmodifiableListView)
      return _shopCategoryProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shopCategoryProducts);
  }

  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'ShopCategoryProductsState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, hasMore: $hasMore, shopCategoryProducts: $shopCategoryProducts, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopCategoryProductsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality()
                .equals(other._shopCategoryProducts, _shopCategoryProducts) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isMoreLoading,
      hasMore,
      const DeepCollectionEquality().hash(_shopCategoryProducts),
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopCategoryProductsStateCopyWith<_$_ShopCategoryProductsState>
      get copyWith => __$$_ShopCategoryProductsStateCopyWithImpl<
          _$_ShopCategoryProductsState>(this, _$identity);
}

abstract class _ShopCategoryProductsState extends ShopCategoryProductsState {
  const factory _ShopCategoryProductsState(
      {final bool isLoading,
      final bool isMoreLoading,
      final bool hasMore,
      final List<ShopCategoryData> shopCategoryProducts,
      final int count}) = _$_ShopCategoryProductsState;
  const _ShopCategoryProductsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  bool get hasMore;
  @override
  List<ShopCategoryData> get shopCategoryProducts;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_ShopCategoryProductsStateCopyWith<_$_ShopCategoryProductsState>
      get copyWith => throw _privateConstructorUsedError;
}
