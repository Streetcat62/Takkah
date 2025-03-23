// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liked_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LikedProductsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ProductData> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikedProductsStateCopyWith<LikedProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikedProductsStateCopyWith<$Res> {
  factory $LikedProductsStateCopyWith(
          LikedProductsState value, $Res Function(LikedProductsState) then) =
      _$LikedProductsStateCopyWithImpl<$Res, LikedProductsState>;
  @useResult
  $Res call({bool isLoading, List<ProductData> products});
}

/// @nodoc
class _$LikedProductsStateCopyWithImpl<$Res, $Val extends LikedProductsState>
    implements $LikedProductsStateCopyWith<$Res> {
  _$LikedProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikedProductsStateCopyWith<$Res>
    implements $LikedProductsStateCopyWith<$Res> {
  factory _$$_LikedProductsStateCopyWith(_$_LikedProductsState value,
          $Res Function(_$_LikedProductsState) then) =
      __$$_LikedProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ProductData> products});
}

/// @nodoc
class __$$_LikedProductsStateCopyWithImpl<$Res>
    extends _$LikedProductsStateCopyWithImpl<$Res, _$_LikedProductsState>
    implements _$$_LikedProductsStateCopyWith<$Res> {
  __$$_LikedProductsStateCopyWithImpl(
      _$_LikedProductsState _value, $Res Function(_$_LikedProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = null,
  }) {
    return _then(_$_LikedProductsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ));
  }
}

/// @nodoc

class _$_LikedProductsState extends _LikedProductsState {
  const _$_LikedProductsState(
      {this.isLoading = false, final List<ProductData> products = const []})
      : _products = products,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
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
    return 'LikedProductsState(isLoading: $isLoading, products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikedProductsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikedProductsStateCopyWith<_$_LikedProductsState> get copyWith =>
      __$$_LikedProductsStateCopyWithImpl<_$_LikedProductsState>(
          this, _$identity);
}

abstract class _LikedProductsState extends LikedProductsState {
  const factory _LikedProductsState(
      {final bool isLoading,
      final List<ProductData> products}) = _$_LikedProductsState;
  const _LikedProductsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ProductData> get products;
  @override
  @JsonKey(ignore: true)
  _$$_LikedProductsStateCopyWith<_$_LikedProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
