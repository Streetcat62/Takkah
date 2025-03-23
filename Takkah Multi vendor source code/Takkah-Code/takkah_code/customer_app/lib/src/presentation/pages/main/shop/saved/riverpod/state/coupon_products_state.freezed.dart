// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CouponProductsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  List<ProductData> get couponProducts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CouponProductsStateCopyWith<CouponProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponProductsStateCopyWith<$Res> {
  factory $CouponProductsStateCopyWith(
          CouponProductsState value, $Res Function(CouponProductsState) then) =
      _$CouponProductsStateCopyWithImpl<$Res, CouponProductsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<ProductData> couponProducts});
}

/// @nodoc
class _$CouponProductsStateCopyWithImpl<$Res, $Val extends CouponProductsState>
    implements $CouponProductsStateCopyWith<$Res> {
  _$CouponProductsStateCopyWithImpl(this._value, this._then);

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
    Object? couponProducts = null,
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
      couponProducts: null == couponProducts
          ? _value.couponProducts
          : couponProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CouponProductsStateCopyWith<$Res>
    implements $CouponProductsStateCopyWith<$Res> {
  factory _$$_CouponProductsStateCopyWith(_$_CouponProductsState value,
          $Res Function(_$_CouponProductsState) then) =
      __$$_CouponProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<ProductData> couponProducts});
}

/// @nodoc
class __$$_CouponProductsStateCopyWithImpl<$Res>
    extends _$CouponProductsStateCopyWithImpl<$Res, _$_CouponProductsState>
    implements _$$_CouponProductsStateCopyWith<$Res> {
  __$$_CouponProductsStateCopyWithImpl(_$_CouponProductsState _value,
      $Res Function(_$_CouponProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? hasMore = null,
    Object? couponProducts = null,
  }) {
    return _then(_$_CouponProductsState(
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
      couponProducts: null == couponProducts
          ? _value._couponProducts
          : couponProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ));
  }
}

/// @nodoc

class _$_CouponProductsState extends _CouponProductsState {
  const _$_CouponProductsState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      this.hasMore = true,
      final List<ProductData> couponProducts = const []})
      : _couponProducts = couponProducts,
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
  final List<ProductData> _couponProducts;
  @override
  @JsonKey()
  List<ProductData> get couponProducts {
    if (_couponProducts is EqualUnmodifiableListView) return _couponProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_couponProducts);
  }

  @override
  String toString() {
    return 'CouponProductsState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, hasMore: $hasMore, couponProducts: $couponProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponProductsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality()
                .equals(other._couponProducts, _couponProducts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      hasMore, const DeepCollectionEquality().hash(_couponProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponProductsStateCopyWith<_$_CouponProductsState> get copyWith =>
      __$$_CouponProductsStateCopyWithImpl<_$_CouponProductsState>(
          this, _$identity);
}

abstract class _CouponProductsState extends CouponProductsState {
  const factory _CouponProductsState(
      {final bool isLoading,
      final bool isMoreLoading,
      final bool hasMore,
      final List<ProductData> couponProducts}) = _$_CouponProductsState;
  const _CouponProductsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  bool get hasMore;
  @override
  List<ProductData> get couponProducts;
  @override
  @JsonKey(ignore: true)
  _$$_CouponProductsStateCopyWith<_$_CouponProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
