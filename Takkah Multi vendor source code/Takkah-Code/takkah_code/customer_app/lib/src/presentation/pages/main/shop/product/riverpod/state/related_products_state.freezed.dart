// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'related_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RelatedProductsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ProductData> get relatedProducts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RelatedProductsStateCopyWith<RelatedProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedProductsStateCopyWith<$Res> {
  factory $RelatedProductsStateCopyWith(RelatedProductsState value,
          $Res Function(RelatedProductsState) then) =
      _$RelatedProductsStateCopyWithImpl<$Res, RelatedProductsState>;
  @useResult
  $Res call({bool isLoading, List<ProductData> relatedProducts});
}

/// @nodoc
class _$RelatedProductsStateCopyWithImpl<$Res,
        $Val extends RelatedProductsState>
    implements $RelatedProductsStateCopyWith<$Res> {
  _$RelatedProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? relatedProducts = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      relatedProducts: null == relatedProducts
          ? _value.relatedProducts
          : relatedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RelatedProductsStateCopyWith<$Res>
    implements $RelatedProductsStateCopyWith<$Res> {
  factory _$$_RelatedProductsStateCopyWith(_$_RelatedProductsState value,
          $Res Function(_$_RelatedProductsState) then) =
      __$$_RelatedProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ProductData> relatedProducts});
}

/// @nodoc
class __$$_RelatedProductsStateCopyWithImpl<$Res>
    extends _$RelatedProductsStateCopyWithImpl<$Res, _$_RelatedProductsState>
    implements _$$_RelatedProductsStateCopyWith<$Res> {
  __$$_RelatedProductsStateCopyWithImpl(_$_RelatedProductsState _value,
      $Res Function(_$_RelatedProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? relatedProducts = null,
  }) {
    return _then(_$_RelatedProductsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      relatedProducts: null == relatedProducts
          ? _value._relatedProducts
          : relatedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ));
  }
}

/// @nodoc

class _$_RelatedProductsState extends _RelatedProductsState {
  const _$_RelatedProductsState(
      {this.isLoading = false,
      final List<ProductData> relatedProducts = const []})
      : _relatedProducts = relatedProducts,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ProductData> _relatedProducts;
  @override
  @JsonKey()
  List<ProductData> get relatedProducts {
    if (_relatedProducts is EqualUnmodifiableListView) return _relatedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedProducts);
  }

  @override
  String toString() {
    return 'RelatedProductsState(isLoading: $isLoading, relatedProducts: $relatedProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RelatedProductsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._relatedProducts, _relatedProducts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_relatedProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RelatedProductsStateCopyWith<_$_RelatedProductsState> get copyWith =>
      __$$_RelatedProductsStateCopyWithImpl<_$_RelatedProductsState>(
          this, _$identity);
}

abstract class _RelatedProductsState extends RelatedProductsState {
  const factory _RelatedProductsState(
      {final bool isLoading,
      final List<ProductData> relatedProducts}) = _$_RelatedProductsState;
  const _RelatedProductsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ProductData> get relatedProducts;
  @override
  @JsonKey(ignore: true)
  _$$_RelatedProductsStateCopyWith<_$_RelatedProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
