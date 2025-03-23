// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_brands_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopBrandsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<BrandData> get brands => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopBrandsStateCopyWith<ShopBrandsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopBrandsStateCopyWith<$Res> {
  factory $ShopBrandsStateCopyWith(
          ShopBrandsState value, $Res Function(ShopBrandsState) then) =
      _$ShopBrandsStateCopyWithImpl<$Res, ShopBrandsState>;
  @useResult
  $Res call({bool isLoading, List<BrandData> brands});
}

/// @nodoc
class _$ShopBrandsStateCopyWithImpl<$Res, $Val extends ShopBrandsState>
    implements $ShopBrandsStateCopyWith<$Res> {
  _$ShopBrandsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? brands = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopBrandsStateCopyWith<$Res>
    implements $ShopBrandsStateCopyWith<$Res> {
  factory _$$_ShopBrandsStateCopyWith(
          _$_ShopBrandsState value, $Res Function(_$_ShopBrandsState) then) =
      __$$_ShopBrandsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<BrandData> brands});
}

/// @nodoc
class __$$_ShopBrandsStateCopyWithImpl<$Res>
    extends _$ShopBrandsStateCopyWithImpl<$Res, _$_ShopBrandsState>
    implements _$$_ShopBrandsStateCopyWith<$Res> {
  __$$_ShopBrandsStateCopyWithImpl(
      _$_ShopBrandsState _value, $Res Function(_$_ShopBrandsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? brands = null,
  }) {
    return _then(_$_ShopBrandsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
    ));
  }
}

/// @nodoc

class _$_ShopBrandsState extends _ShopBrandsState {
  const _$_ShopBrandsState(
      {this.isLoading = false, final List<BrandData> brands = const []})
      : _brands = brands,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<BrandData> _brands;
  @override
  @JsonKey()
  List<BrandData> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  String toString() {
    return 'ShopBrandsState(isLoading: $isLoading, brands: $brands)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopBrandsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._brands, _brands));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_brands));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopBrandsStateCopyWith<_$_ShopBrandsState> get copyWith =>
      __$$_ShopBrandsStateCopyWithImpl<_$_ShopBrandsState>(this, _$identity);
}

abstract class _ShopBrandsState extends ShopBrandsState {
  const factory _ShopBrandsState(
      {final bool isLoading,
      final List<BrandData> brands}) = _$_ShopBrandsState;
  const _ShopBrandsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<BrandData> get brands;
  @override
  @JsonKey(ignore: true)
  _$$_ShopBrandsStateCopyWith<_$_ShopBrandsState> get copyWith =>
      throw _privateConstructorUsedError;
}
