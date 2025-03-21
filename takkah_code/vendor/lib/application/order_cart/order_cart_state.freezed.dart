// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderCartState {
  List<ProductModel> get products => throw _privateConstructorUsedError;
  num get totalPrice => throw _privateConstructorUsedError;
  num get cartCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderCartStateCopyWith<OrderCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCartStateCopyWith<$Res> {
  factory $OrderCartStateCopyWith(
          OrderCartState value, $Res Function(OrderCartState) then) =
      _$OrderCartStateCopyWithImpl<$Res, OrderCartState>;
  @useResult
  $Res call({List<ProductModel> products, num totalPrice, num cartCount});
}

/// @nodoc
class _$OrderCartStateCopyWithImpl<$Res, $Val extends OrderCartState>
    implements $OrderCartStateCopyWith<$Res> {
  _$OrderCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totalPrice = null,
    Object? cartCount = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      cartCount: null == cartCount
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderCartStateCopyWith<$Res>
    implements $OrderCartStateCopyWith<$Res> {
  factory _$$_OrderCartStateCopyWith(
          _$_OrderCartState value, $Res Function(_$_OrderCartState) then) =
      __$$_OrderCartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductModel> products, num totalPrice, num cartCount});
}

/// @nodoc
class __$$_OrderCartStateCopyWithImpl<$Res>
    extends _$OrderCartStateCopyWithImpl<$Res, _$_OrderCartState>
    implements _$$_OrderCartStateCopyWith<$Res> {
  __$$_OrderCartStateCopyWithImpl(
      _$_OrderCartState _value, $Res Function(_$_OrderCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totalPrice = null,
    Object? cartCount = null,
  }) {
    return _then(_$_OrderCartState(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num,
      cartCount: null == cartCount
          ? _value.cartCount
          : cartCount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$_OrderCartState extends _OrderCartState {
  const _$_OrderCartState(
      {final List<ProductModel> products = const [],
      this.totalPrice = 0,
      this.cartCount = 0})
      : _products = products,
        super._();

  final List<ProductModel> _products;
  @override
  @JsonKey()
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final num totalPrice;
  @override
  @JsonKey()
  final num cartCount;

  @override
  String toString() {
    return 'OrderCartState(products: $products, totalPrice: $totalPrice, cartCount: $cartCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderCartState &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.cartCount, cartCount) ||
                other.cartCount == cartCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_products), totalPrice, cartCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCartStateCopyWith<_$_OrderCartState> get copyWith =>
      __$$_OrderCartStateCopyWithImpl<_$_OrderCartState>(this, _$identity);
}

abstract class _OrderCartState extends OrderCartState {
  const factory _OrderCartState(
      {final List<ProductModel> products,
      final num totalPrice,
      final num cartCount}) = _$_OrderCartState;
  const _OrderCartState._() : super._();

  @override
  List<ProductModel> get products;
  @override
  num get totalPrice;
  @override
  num get cartCount;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCartStateCopyWith<_$_OrderCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
