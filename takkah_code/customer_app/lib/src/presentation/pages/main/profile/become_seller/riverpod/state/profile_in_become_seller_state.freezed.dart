// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_in_become_seller_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileInBecomeSellerState {
  bool get isLoading => throw _privateConstructorUsedError;
  ShopStatus get shopStatus => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileInBecomeSellerStateCopyWith<ProfileInBecomeSellerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileInBecomeSellerStateCopyWith<$Res> {
  factory $ProfileInBecomeSellerStateCopyWith(ProfileInBecomeSellerState value,
          $Res Function(ProfileInBecomeSellerState) then) =
      _$ProfileInBecomeSellerStateCopyWithImpl<$Res,
          ProfileInBecomeSellerState>;
  @useResult
  $Res call({bool isLoading, ShopStatus shopStatus, UserData? userData});
}

/// @nodoc
class _$ProfileInBecomeSellerStateCopyWithImpl<$Res,
        $Val extends ProfileInBecomeSellerState>
    implements $ProfileInBecomeSellerStateCopyWith<$Res> {
  _$ProfileInBecomeSellerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? shopStatus = null,
    Object? userData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shopStatus: null == shopStatus
          ? _value.shopStatus
          : shopStatus // ignore: cast_nullable_to_non_nullable
              as ShopStatus,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileInBecomeSellerStateCopyWith<$Res>
    implements $ProfileInBecomeSellerStateCopyWith<$Res> {
  factory _$$_ProfileInBecomeSellerStateCopyWith(
          _$_ProfileInBecomeSellerState value,
          $Res Function(_$_ProfileInBecomeSellerState) then) =
      __$$_ProfileInBecomeSellerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, ShopStatus shopStatus, UserData? userData});
}

/// @nodoc
class __$$_ProfileInBecomeSellerStateCopyWithImpl<$Res>
    extends _$ProfileInBecomeSellerStateCopyWithImpl<$Res,
        _$_ProfileInBecomeSellerState>
    implements _$$_ProfileInBecomeSellerStateCopyWith<$Res> {
  __$$_ProfileInBecomeSellerStateCopyWithImpl(
      _$_ProfileInBecomeSellerState _value,
      $Res Function(_$_ProfileInBecomeSellerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? shopStatus = null,
    Object? userData = freezed,
  }) {
    return _then(_$_ProfileInBecomeSellerState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shopStatus: null == shopStatus
          ? _value.shopStatus
          : shopStatus // ignore: cast_nullable_to_non_nullable
              as ShopStatus,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc

class _$_ProfileInBecomeSellerState extends _ProfileInBecomeSellerState {
  const _$_ProfileInBecomeSellerState(
      {this.isLoading = false,
      this.shopStatus = ShopStatus.notRequested,
      this.userData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final ShopStatus shopStatus;
  @override
  final UserData? userData;

  @override
  String toString() {
    return 'ProfileInBecomeSellerState(isLoading: $isLoading, shopStatus: $shopStatus, userData: $userData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileInBecomeSellerState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.shopStatus, shopStatus) ||
                other.shopStatus == shopStatus) &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, shopStatus, userData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileInBecomeSellerStateCopyWith<_$_ProfileInBecomeSellerState>
      get copyWith => __$$_ProfileInBecomeSellerStateCopyWithImpl<
          _$_ProfileInBecomeSellerState>(this, _$identity);
}

abstract class _ProfileInBecomeSellerState extends ProfileInBecomeSellerState {
  const factory _ProfileInBecomeSellerState(
      {final bool isLoading,
      final ShopStatus shopStatus,
      final UserData? userData}) = _$_ProfileInBecomeSellerState;
  const _ProfileInBecomeSellerState._() : super._();

  @override
  bool get isLoading;
  @override
  ShopStatus get shopStatus;
  @override
  UserData? get userData;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileInBecomeSellerStateCopyWith<_$_ProfileInBecomeSellerState>
      get copyWith => throw _privateConstructorUsedError;
}
