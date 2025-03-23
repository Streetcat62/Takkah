// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  ShopData? get shopData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopDetailsStateCopyWith<ShopDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopDetailsStateCopyWith<$Res> {
  factory $ShopDetailsStateCopyWith(
          ShopDetailsState value, $Res Function(ShopDetailsState) then) =
      _$ShopDetailsStateCopyWithImpl<$Res, ShopDetailsState>;
  @useResult
  $Res call({bool isLoading, ShopData? shopData});
}

/// @nodoc
class _$ShopDetailsStateCopyWithImpl<$Res, $Val extends ShopDetailsState>
    implements $ShopDetailsStateCopyWith<$Res> {
  _$ShopDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? shopData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shopData: freezed == shopData
          ? _value.shopData
          : shopData // ignore: cast_nullable_to_non_nullable
              as ShopData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopDetailsStateCopyWith<$Res>
    implements $ShopDetailsStateCopyWith<$Res> {
  factory _$$_ShopDetailsStateCopyWith(
          _$_ShopDetailsState value, $Res Function(_$_ShopDetailsState) then) =
      __$$_ShopDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, ShopData? shopData});
}

/// @nodoc
class __$$_ShopDetailsStateCopyWithImpl<$Res>
    extends _$ShopDetailsStateCopyWithImpl<$Res, _$_ShopDetailsState>
    implements _$$_ShopDetailsStateCopyWith<$Res> {
  __$$_ShopDetailsStateCopyWithImpl(
      _$_ShopDetailsState _value, $Res Function(_$_ShopDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? shopData = freezed,
  }) {
    return _then(_$_ShopDetailsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shopData: freezed == shopData
          ? _value.shopData
          : shopData // ignore: cast_nullable_to_non_nullable
              as ShopData?,
    ));
  }
}

/// @nodoc

class _$_ShopDetailsState extends _ShopDetailsState {
  const _$_ShopDetailsState({this.isLoading = false, this.shopData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final ShopData? shopData;

  @override
  String toString() {
    return 'ShopDetailsState(isLoading: $isLoading, shopData: $shopData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopDetailsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.shopData, shopData) ||
                other.shopData == shopData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, shopData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopDetailsStateCopyWith<_$_ShopDetailsState> get copyWith =>
      __$$_ShopDetailsStateCopyWithImpl<_$_ShopDetailsState>(this, _$identity);
}

abstract class _ShopDetailsState extends ShopDetailsState {
  const factory _ShopDetailsState(
      {final bool isLoading, final ShopData? shopData}) = _$_ShopDetailsState;
  const _ShopDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  ShopData? get shopData;
  @override
  @JsonKey(ignore: true)
  _$$_ShopDetailsStateCopyWith<_$_ShopDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
