// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopCartState {
  CartData? get cartData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopCartStateCopyWith<ShopCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCartStateCopyWith<$Res> {
  factory $ShopCartStateCopyWith(
          ShopCartState value, $Res Function(ShopCartState) then) =
      _$ShopCartStateCopyWithImpl<$Res, ShopCartState>;
  @useResult
  $Res call({CartData? cartData});
}

/// @nodoc
class _$ShopCartStateCopyWithImpl<$Res, $Val extends ShopCartState>
    implements $ShopCartStateCopyWith<$Res> {
  _$ShopCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartData = freezed,
  }) {
    return _then(_value.copyWith(
      cartData: freezed == cartData
          ? _value.cartData
          : cartData // ignore: cast_nullable_to_non_nullable
              as CartData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopCartStateCopyWith<$Res>
    implements $ShopCartStateCopyWith<$Res> {
  factory _$$_ShopCartStateCopyWith(
          _$_ShopCartState value, $Res Function(_$_ShopCartState) then) =
      __$$_ShopCartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CartData? cartData});
}

/// @nodoc
class __$$_ShopCartStateCopyWithImpl<$Res>
    extends _$ShopCartStateCopyWithImpl<$Res, _$_ShopCartState>
    implements _$$_ShopCartStateCopyWith<$Res> {
  __$$_ShopCartStateCopyWithImpl(
      _$_ShopCartState _value, $Res Function(_$_ShopCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartData = freezed,
  }) {
    return _then(_$_ShopCartState(
      cartData: freezed == cartData
          ? _value.cartData
          : cartData // ignore: cast_nullable_to_non_nullable
              as CartData?,
    ));
  }
}

/// @nodoc

class _$_ShopCartState extends _ShopCartState {
  const _$_ShopCartState({this.cartData}) : super._();

  @override
  final CartData? cartData;

  @override
  String toString() {
    return 'ShopCartState(cartData: $cartData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopCartState &&
            (identical(other.cartData, cartData) ||
                other.cartData == cartData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopCartStateCopyWith<_$_ShopCartState> get copyWith =>
      __$$_ShopCartStateCopyWithImpl<_$_ShopCartState>(this, _$identity);
}

abstract class _ShopCartState extends ShopCartState {
  const factory _ShopCartState({final CartData? cartData}) = _$_ShopCartState;
  const _ShopCartState._() : super._();

  @override
  CartData? get cartData;
  @override
  @JsonKey(ignore: true)
  _$$_ShopCartStateCopyWith<_$_ShopCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
