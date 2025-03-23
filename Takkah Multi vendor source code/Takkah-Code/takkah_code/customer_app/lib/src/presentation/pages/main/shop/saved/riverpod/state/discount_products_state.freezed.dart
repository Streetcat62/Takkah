// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscountProductsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  List<ProductData> get discountProducts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscountProductsStateCopyWith<DiscountProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountProductsStateCopyWith<$Res> {
  factory $DiscountProductsStateCopyWith(DiscountProductsState value,
          $Res Function(DiscountProductsState) then) =
      _$DiscountProductsStateCopyWithImpl<$Res, DiscountProductsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<ProductData> discountProducts});
}

/// @nodoc
class _$DiscountProductsStateCopyWithImpl<$Res,
        $Val extends DiscountProductsState>
    implements $DiscountProductsStateCopyWith<$Res> {
  _$DiscountProductsStateCopyWithImpl(this._value, this._then);

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
    Object? discountProducts = null,
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
      discountProducts: null == discountProducts
          ? _value.discountProducts
          : discountProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscountProductsStateCopyWith<$Res>
    implements $DiscountProductsStateCopyWith<$Res> {
  factory _$$_DiscountProductsStateCopyWith(_$_DiscountProductsState value,
          $Res Function(_$_DiscountProductsState) then) =
      __$$_DiscountProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<ProductData> discountProducts});
}

/// @nodoc
class __$$_DiscountProductsStateCopyWithImpl<$Res>
    extends _$DiscountProductsStateCopyWithImpl<$Res, _$_DiscountProductsState>
    implements _$$_DiscountProductsStateCopyWith<$Res> {
  __$$_DiscountProductsStateCopyWithImpl(_$_DiscountProductsState _value,
      $Res Function(_$_DiscountProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? hasMore = null,
    Object? discountProducts = null,
  }) {
    return _then(_$_DiscountProductsState(
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
      discountProducts: null == discountProducts
          ? _value._discountProducts
          : discountProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ));
  }
}

/// @nodoc

class _$_DiscountProductsState extends _DiscountProductsState {
  const _$_DiscountProductsState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      this.hasMore = true,
      final List<ProductData> discountProducts = const []})
      : _discountProducts = discountProducts,
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
  final List<ProductData> _discountProducts;
  @override
  @JsonKey()
  List<ProductData> get discountProducts {
    if (_discountProducts is EqualUnmodifiableListView)
      return _discountProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountProducts);
  }

  @override
  String toString() {
    return 'DiscountProductsState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, hasMore: $hasMore, discountProducts: $discountProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountProductsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality()
                .equals(other._discountProducts, _discountProducts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      hasMore, const DeepCollectionEquality().hash(_discountProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscountProductsStateCopyWith<_$_DiscountProductsState> get copyWith =>
      __$$_DiscountProductsStateCopyWithImpl<_$_DiscountProductsState>(
          this, _$identity);
}

abstract class _DiscountProductsState extends DiscountProductsState {
  const factory _DiscountProductsState(
      {final bool isLoading,
      final bool isMoreLoading,
      final bool hasMore,
      final List<ProductData> discountProducts}) = _$_DiscountProductsState;
  const _DiscountProductsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  bool get hasMore;
  @override
  List<ProductData> get discountProducts;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountProductsStateCopyWith<_$_DiscountProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
