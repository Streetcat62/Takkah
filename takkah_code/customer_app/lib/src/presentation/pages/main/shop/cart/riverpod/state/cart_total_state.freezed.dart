// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_total_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartTotalState {
  bool get isLoading => throw _privateConstructorUsedError;
  CartCalculateData? get calculateData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartTotalStateCopyWith<CartTotalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartTotalStateCopyWith<$Res> {
  factory $CartTotalStateCopyWith(
          CartTotalState value, $Res Function(CartTotalState) then) =
      _$CartTotalStateCopyWithImpl<$Res, CartTotalState>;
  @useResult
  $Res call({bool isLoading, CartCalculateData? calculateData});
}

/// @nodoc
class _$CartTotalStateCopyWithImpl<$Res, $Val extends CartTotalState>
    implements $CartTotalStateCopyWith<$Res> {
  _$CartTotalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? calculateData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      calculateData: freezed == calculateData
          ? _value.calculateData
          : calculateData // ignore: cast_nullable_to_non_nullable
              as CartCalculateData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartTotalStateCopyWith<$Res>
    implements $CartTotalStateCopyWith<$Res> {
  factory _$$_CartTotalStateCopyWith(
          _$_CartTotalState value, $Res Function(_$_CartTotalState) then) =
      __$$_CartTotalStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, CartCalculateData? calculateData});
}

/// @nodoc
class __$$_CartTotalStateCopyWithImpl<$Res>
    extends _$CartTotalStateCopyWithImpl<$Res, _$_CartTotalState>
    implements _$$_CartTotalStateCopyWith<$Res> {
  __$$_CartTotalStateCopyWithImpl(
      _$_CartTotalState _value, $Res Function(_$_CartTotalState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? calculateData = freezed,
  }) {
    return _then(_$_CartTotalState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      calculateData: freezed == calculateData
          ? _value.calculateData
          : calculateData // ignore: cast_nullable_to_non_nullable
              as CartCalculateData?,
    ));
  }
}

/// @nodoc

class _$_CartTotalState extends _CartTotalState {
  const _$_CartTotalState({this.isLoading = false, this.calculateData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final CartCalculateData? calculateData;

  @override
  String toString() {
    return 'CartTotalState(isLoading: $isLoading, calculateData: $calculateData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartTotalState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.calculateData, calculateData) ||
                other.calculateData == calculateData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, calculateData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartTotalStateCopyWith<_$_CartTotalState> get copyWith =>
      __$$_CartTotalStateCopyWithImpl<_$_CartTotalState>(this, _$identity);
}

abstract class _CartTotalState extends CartTotalState {
  const factory _CartTotalState(
      {final bool isLoading,
      final CartCalculateData? calculateData}) = _$_CartTotalState;
  const _CartTotalState._() : super._();

  @override
  bool get isLoading;
  @override
  CartCalculateData? get calculateData;
  @override
  @JsonKey(ignore: true)
  _$$_CartTotalStateCopyWith<_$_CartTotalState> get copyWith =>
      throw _privateConstructorUsedError;
}
