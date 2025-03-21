// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BannerProductsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ProductData> get bannerProducts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BannerProductsStateCopyWith<BannerProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerProductsStateCopyWith<$Res> {
  factory $BannerProductsStateCopyWith(
          BannerProductsState value, $Res Function(BannerProductsState) then) =
      _$BannerProductsStateCopyWithImpl<$Res, BannerProductsState>;
  @useResult
  $Res call({bool isLoading, List<ProductData> bannerProducts});
}

/// @nodoc
class _$BannerProductsStateCopyWithImpl<$Res, $Val extends BannerProductsState>
    implements $BannerProductsStateCopyWith<$Res> {
  _$BannerProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bannerProducts = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bannerProducts: null == bannerProducts
          ? _value.bannerProducts
          : bannerProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BannerProductsStateCopyWith<$Res>
    implements $BannerProductsStateCopyWith<$Res> {
  factory _$$_BannerProductsStateCopyWith(_$_BannerProductsState value,
          $Res Function(_$_BannerProductsState) then) =
      __$$_BannerProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ProductData> bannerProducts});
}

/// @nodoc
class __$$_BannerProductsStateCopyWithImpl<$Res>
    extends _$BannerProductsStateCopyWithImpl<$Res, _$_BannerProductsState>
    implements _$$_BannerProductsStateCopyWith<$Res> {
  __$$_BannerProductsStateCopyWithImpl(_$_BannerProductsState _value,
      $Res Function(_$_BannerProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bannerProducts = null,
  }) {
    return _then(_$_BannerProductsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bannerProducts: null == bannerProducts
          ? _value._bannerProducts
          : bannerProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ));
  }
}

/// @nodoc

class _$_BannerProductsState extends _BannerProductsState {
  const _$_BannerProductsState(
      {this.isLoading = false,
      final List<ProductData> bannerProducts = const []})
      : _bannerProducts = bannerProducts,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ProductData> _bannerProducts;
  @override
  @JsonKey()
  List<ProductData> get bannerProducts {
    if (_bannerProducts is EqualUnmodifiableListView) return _bannerProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bannerProducts);
  }

  @override
  String toString() {
    return 'BannerProductsState(isLoading: $isLoading, bannerProducts: $bannerProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BannerProductsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._bannerProducts, _bannerProducts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_bannerProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BannerProductsStateCopyWith<_$_BannerProductsState> get copyWith =>
      __$$_BannerProductsStateCopyWithImpl<_$_BannerProductsState>(
          this, _$identity);
}

abstract class _BannerProductsState extends BannerProductsState {
  const factory _BannerProductsState(
      {final bool isLoading,
      final List<ProductData> bannerProducts}) = _$_BannerProductsState;
  const _BannerProductsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ProductData> get bannerProducts;
  @override
  @JsonKey(ignore: true)
  _$$_BannerProductsStateCopyWith<_$_BannerProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
