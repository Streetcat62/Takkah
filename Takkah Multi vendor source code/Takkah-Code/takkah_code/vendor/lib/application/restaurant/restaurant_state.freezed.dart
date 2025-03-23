// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RestaurantState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get backgroundImageFile => throw _privateConstructorUsedError;
  String? get logoImageFile => throw _privateConstructorUsedError;
  ShopData? get shop => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RestaurantStateCopyWith<RestaurantState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantStateCopyWith<$Res> {
  factory $RestaurantStateCopyWith(
          RestaurantState value, $Res Function(RestaurantState) then) =
      _$RestaurantStateCopyWithImpl<$Res, RestaurantState>;
  @useResult
  $Res call(
      {bool isLoading,
      String? backgroundImageFile,
      String? logoImageFile,
      ShopData? shop});
}

/// @nodoc
class _$RestaurantStateCopyWithImpl<$Res, $Val extends RestaurantState>
    implements $RestaurantStateCopyWith<$Res> {
  _$RestaurantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? backgroundImageFile = freezed,
    Object? logoImageFile = freezed,
    Object? shop = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundImageFile: freezed == backgroundImageFile
          ? _value.backgroundImageFile
          : backgroundImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      logoImageFile: freezed == logoImageFile
          ? _value.logoImageFile
          : logoImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      shop: freezed == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as ShopData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestaurantStateCopyWith<$Res>
    implements $RestaurantStateCopyWith<$Res> {
  factory _$$_RestaurantStateCopyWith(
          _$_RestaurantState value, $Res Function(_$_RestaurantState) then) =
      __$$_RestaurantStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String? backgroundImageFile,
      String? logoImageFile,
      ShopData? shop});
}

/// @nodoc
class __$$_RestaurantStateCopyWithImpl<$Res>
    extends _$RestaurantStateCopyWithImpl<$Res, _$_RestaurantState>
    implements _$$_RestaurantStateCopyWith<$Res> {
  __$$_RestaurantStateCopyWithImpl(
      _$_RestaurantState _value, $Res Function(_$_RestaurantState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? backgroundImageFile = freezed,
    Object? logoImageFile = freezed,
    Object? shop = freezed,
  }) {
    return _then(_$_RestaurantState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      backgroundImageFile: freezed == backgroundImageFile
          ? _value.backgroundImageFile
          : backgroundImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      logoImageFile: freezed == logoImageFile
          ? _value.logoImageFile
          : logoImageFile // ignore: cast_nullable_to_non_nullable
              as String?,
      shop: freezed == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as ShopData?,
    ));
  }
}

/// @nodoc

class _$_RestaurantState extends _RestaurantState {
  const _$_RestaurantState(
      {this.isLoading = false,
      this.backgroundImageFile,
      this.logoImageFile,
      this.shop})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? backgroundImageFile;
  @override
  final String? logoImageFile;
  @override
  final ShopData? shop;

  @override
  String toString() {
    return 'RestaurantState(isLoading: $isLoading, backgroundImageFile: $backgroundImageFile, logoImageFile: $logoImageFile, shop: $shop)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.backgroundImageFile, backgroundImageFile) ||
                other.backgroundImageFile == backgroundImageFile) &&
            (identical(other.logoImageFile, logoImageFile) ||
                other.logoImageFile == logoImageFile) &&
            (identical(other.shop, shop) || other.shop == shop));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, backgroundImageFile, logoImageFile, shop);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantStateCopyWith<_$_RestaurantState> get copyWith =>
      __$$_RestaurantStateCopyWithImpl<_$_RestaurantState>(this, _$identity);
}

abstract class _RestaurantState extends RestaurantState {
  const factory _RestaurantState(
      {final bool isLoading,
      final String? backgroundImageFile,
      final String? logoImageFile,
      final ShopData? shop}) = _$_RestaurantState;
  const _RestaurantState._() : super._();

  @override
  bool get isLoading;
  @override
  String? get backgroundImageFile;
  @override
  String? get logoImageFile;
  @override
  ShopData? get shop;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantStateCopyWith<_$_RestaurantState> get copyWith =>
      throw _privateConstructorUsedError;
}
