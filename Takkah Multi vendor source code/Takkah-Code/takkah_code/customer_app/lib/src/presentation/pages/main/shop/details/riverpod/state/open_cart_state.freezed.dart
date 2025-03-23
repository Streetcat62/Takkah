// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OpenCartState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  String get shareLink => throw _privateConstructorUsedError;
  CartData? get cartData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OpenCartStateCopyWith<OpenCartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenCartStateCopyWith<$Res> {
  factory $OpenCartStateCopyWith(
          OpenCartState value, $Res Function(OpenCartState) then) =
      _$OpenCartStateCopyWithImpl<$Res, OpenCartState>;
  @useResult
  $Res call(
      {bool isLoading, bool isDeleting, String shareLink, CartData? cartData});
}

/// @nodoc
class _$OpenCartStateCopyWithImpl<$Res, $Val extends OpenCartState>
    implements $OpenCartStateCopyWith<$Res> {
  _$OpenCartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isDeleting = null,
    Object? shareLink = null,
    Object? cartData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      shareLink: null == shareLink
          ? _value.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String,
      cartData: freezed == cartData
          ? _value.cartData
          : cartData // ignore: cast_nullable_to_non_nullable
              as CartData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpenCartStateCopyWith<$Res>
    implements $OpenCartStateCopyWith<$Res> {
  factory _$$_OpenCartStateCopyWith(
          _$_OpenCartState value, $Res Function(_$_OpenCartState) then) =
      __$$_OpenCartStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool isDeleting, String shareLink, CartData? cartData});
}

/// @nodoc
class __$$_OpenCartStateCopyWithImpl<$Res>
    extends _$OpenCartStateCopyWithImpl<$Res, _$_OpenCartState>
    implements _$$_OpenCartStateCopyWith<$Res> {
  __$$_OpenCartStateCopyWithImpl(
      _$_OpenCartState _value, $Res Function(_$_OpenCartState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isDeleting = null,
    Object? shareLink = null,
    Object? cartData = freezed,
  }) {
    return _then(_$_OpenCartState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      shareLink: null == shareLink
          ? _value.shareLink
          : shareLink // ignore: cast_nullable_to_non_nullable
              as String,
      cartData: freezed == cartData
          ? _value.cartData
          : cartData // ignore: cast_nullable_to_non_nullable
              as CartData?,
    ));
  }
}

/// @nodoc

class _$_OpenCartState extends _OpenCartState {
  const _$_OpenCartState(
      {this.isLoading = false,
      this.isDeleting = false,
      this.shareLink = '',
      this.cartData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final String shareLink;
  @override
  final CartData? cartData;

  @override
  String toString() {
    return 'OpenCartState(isLoading: $isLoading, isDeleting: $isDeleting, shareLink: $shareLink, cartData: $cartData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpenCartState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.shareLink, shareLink) ||
                other.shareLink == shareLink) &&
            (identical(other.cartData, cartData) ||
                other.cartData == cartData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isDeleting, shareLink, cartData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpenCartStateCopyWith<_$_OpenCartState> get copyWith =>
      __$$_OpenCartStateCopyWithImpl<_$_OpenCartState>(this, _$identity);
}

abstract class _OpenCartState extends OpenCartState {
  const factory _OpenCartState(
      {final bool isLoading,
      final bool isDeleting,
      final String shareLink,
      final CartData? cartData}) = _$_OpenCartState;
  const _OpenCartState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isDeleting;
  @override
  String get shareLink;
  @override
  CartData? get cartData;
  @override
  @JsonKey(ignore: true)
  _$$_OpenCartStateCopyWith<_$_OpenCartState> get copyWith =>
      throw _privateConstructorUsedError;
}
