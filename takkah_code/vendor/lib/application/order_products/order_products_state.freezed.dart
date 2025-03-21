// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderProductsState {
  String get query => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<ProductModel> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderProductsStateCopyWith<OrderProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderProductsStateCopyWith<$Res> {
  factory $OrderProductsStateCopyWith(
          OrderProductsState value, $Res Function(OrderProductsState) then) =
      _$OrderProductsStateCopyWithImpl<$Res, OrderProductsState>;
  @useResult
  $Res call({String query, bool isLoading, List<ProductModel> products});
}

/// @nodoc
class _$OrderProductsStateCopyWithImpl<$Res, $Val extends OrderProductsState>
    implements $OrderProductsStateCopyWith<$Res> {
  _$OrderProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? isLoading = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderProductsStateCopyWith<$Res>
    implements $OrderProductsStateCopyWith<$Res> {
  factory _$$_OrderProductsStateCopyWith(_$_OrderProductsState value,
          $Res Function(_$_OrderProductsState) then) =
      __$$_OrderProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, bool isLoading, List<ProductModel> products});
}

/// @nodoc
class __$$_OrderProductsStateCopyWithImpl<$Res>
    extends _$OrderProductsStateCopyWithImpl<$Res, _$_OrderProductsState>
    implements _$$_OrderProductsStateCopyWith<$Res> {
  __$$_OrderProductsStateCopyWithImpl(
      _$_OrderProductsState _value, $Res Function(_$_OrderProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? isLoading = null,
    Object? products = null,
  }) {
    return _then(_$_OrderProductsState(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _$_OrderProductsState extends _OrderProductsState {
  const _$_OrderProductsState(
      {this.query = '',
      this.isLoading = false,
      final List<ProductModel> products = const []})
      : _products = products,
        super._();

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final bool isLoading;
  final List<ProductModel> _products;
  @override
  @JsonKey()
  List<ProductModel> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'OrderProductsState(query: $query, isLoading: $isLoading, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderProductsState &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, isLoading,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderProductsStateCopyWith<_$_OrderProductsState> get copyWith =>
      __$$_OrderProductsStateCopyWithImpl<_$_OrderProductsState>(
          this, _$identity);
}

abstract class _OrderProductsState extends OrderProductsState {
  const factory _OrderProductsState(
      {final String query,
      final bool isLoading,
      final List<ProductModel> products}) = _$_OrderProductsState;
  const _OrderProductsState._() : super._();

  @override
  String get query;
  @override
  bool get isLoading;
  @override
  List<ProductModel> get products;
  @override
  @JsonKey(ignore: true)
  _$$_OrderProductsStateCopyWith<_$_OrderProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
