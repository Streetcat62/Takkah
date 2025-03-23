// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'become_seller_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BecomeSellerState {
  String get logoPath => throw _privateConstructorUsedError;
  String get backgroundPath => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  DateTime? get openTime => throw _privateConstructorUsedError;
  DateTime? get closeTime => throw _privateConstructorUsedError;
  TextEditingController? get addressController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BecomeSellerStateCopyWith<BecomeSellerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BecomeSellerStateCopyWith<$Res> {
  factory $BecomeSellerStateCopyWith(
          BecomeSellerState value, $Res Function(BecomeSellerState) then) =
      _$BecomeSellerStateCopyWithImpl<$Res, BecomeSellerState>;
  @useResult
  $Res call(
      {String logoPath,
      String backgroundPath,
      bool isLoading,
      DateTime? openTime,
      DateTime? closeTime,
      TextEditingController? addressController});
}

/// @nodoc
class _$BecomeSellerStateCopyWithImpl<$Res, $Val extends BecomeSellerState>
    implements $BecomeSellerStateCopyWith<$Res> {
  _$BecomeSellerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logoPath = null,
    Object? backgroundPath = null,
    Object? isLoading = null,
    Object? openTime = freezed,
    Object? closeTime = freezed,
    Object? addressController = freezed,
  }) {
    return _then(_value.copyWith(
      logoPath: null == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundPath: null == backgroundPath
          ? _value.backgroundPath
          : backgroundPath // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      openTime: freezed == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeTime: freezed == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addressController: freezed == addressController
          ? _value.addressController
          : addressController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BecomeSellerStateCopyWith<$Res>
    implements $BecomeSellerStateCopyWith<$Res> {
  factory _$$_BecomeSellerStateCopyWith(_$_BecomeSellerState value,
          $Res Function(_$_BecomeSellerState) then) =
      __$$_BecomeSellerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String logoPath,
      String backgroundPath,
      bool isLoading,
      DateTime? openTime,
      DateTime? closeTime,
      TextEditingController? addressController});
}

/// @nodoc
class __$$_BecomeSellerStateCopyWithImpl<$Res>
    extends _$BecomeSellerStateCopyWithImpl<$Res, _$_BecomeSellerState>
    implements _$$_BecomeSellerStateCopyWith<$Res> {
  __$$_BecomeSellerStateCopyWithImpl(
      _$_BecomeSellerState _value, $Res Function(_$_BecomeSellerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logoPath = null,
    Object? backgroundPath = null,
    Object? isLoading = null,
    Object? openTime = freezed,
    Object? closeTime = freezed,
    Object? addressController = freezed,
  }) {
    return _then(_$_BecomeSellerState(
      logoPath: null == logoPath
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundPath: null == backgroundPath
          ? _value.backgroundPath
          : backgroundPath // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      openTime: freezed == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      closeTime: freezed == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addressController: freezed == addressController
          ? _value.addressController
          : addressController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ));
  }
}

/// @nodoc

class _$_BecomeSellerState extends _BecomeSellerState {
  const _$_BecomeSellerState(
      {this.logoPath = '',
      this.backgroundPath = '',
      this.isLoading = false,
      this.openTime,
      this.closeTime,
      this.addressController})
      : super._();

  @override
  @JsonKey()
  final String logoPath;
  @override
  @JsonKey()
  final String backgroundPath;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DateTime? openTime;
  @override
  final DateTime? closeTime;
  @override
  final TextEditingController? addressController;

  @override
  String toString() {
    return 'BecomeSellerState(logoPath: $logoPath, backgroundPath: $backgroundPath, isLoading: $isLoading, openTime: $openTime, closeTime: $closeTime, addressController: $addressController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BecomeSellerState &&
            (identical(other.logoPath, logoPath) ||
                other.logoPath == logoPath) &&
            (identical(other.backgroundPath, backgroundPath) ||
                other.backgroundPath == backgroundPath) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            (identical(other.addressController, addressController) ||
                other.addressController == addressController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, logoPath, backgroundPath,
      isLoading, openTime, closeTime, addressController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BecomeSellerStateCopyWith<_$_BecomeSellerState> get copyWith =>
      __$$_BecomeSellerStateCopyWithImpl<_$_BecomeSellerState>(
          this, _$identity);
}

abstract class _BecomeSellerState extends BecomeSellerState {
  const factory _BecomeSellerState(
      {final String logoPath,
      final String backgroundPath,
      final bool isLoading,
      final DateTime? openTime,
      final DateTime? closeTime,
      final TextEditingController? addressController}) = _$_BecomeSellerState;
  const _BecomeSellerState._() : super._();

  @override
  String get logoPath;
  @override
  String get backgroundPath;
  @override
  bool get isLoading;
  @override
  DateTime? get openTime;
  @override
  DateTime? get closeTime;
  @override
  TextEditingController? get addressController;
  @override
  @JsonKey(ignore: true)
  _$$_BecomeSellerStateCopyWith<_$_BecomeSellerState> get copyWith =>
      throw _privateConstructorUsedError;
}
