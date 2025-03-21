// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_type_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeliveryTypeState {
  DeliveryType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliveryTypeStateCopyWith<DeliveryTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryTypeStateCopyWith<$Res> {
  factory $DeliveryTypeStateCopyWith(
          DeliveryTypeState value, $Res Function(DeliveryTypeState) then) =
      _$DeliveryTypeStateCopyWithImpl<$Res, DeliveryTypeState>;
  @useResult
  $Res call({DeliveryType type});
}

/// @nodoc
class _$DeliveryTypeStateCopyWithImpl<$Res, $Val extends DeliveryTypeState>
    implements $DeliveryTypeStateCopyWith<$Res> {
  _$DeliveryTypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeliveryType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryTypeStateCopyWith<$Res>
    implements $DeliveryTypeStateCopyWith<$Res> {
  factory _$$_DeliveryTypeStateCopyWith(_$_DeliveryTypeState value,
          $Res Function(_$_DeliveryTypeState) then) =
      __$$_DeliveryTypeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DeliveryType type});
}

/// @nodoc
class __$$_DeliveryTypeStateCopyWithImpl<$Res>
    extends _$DeliveryTypeStateCopyWithImpl<$Res, _$_DeliveryTypeState>
    implements _$$_DeliveryTypeStateCopyWith<$Res> {
  __$$_DeliveryTypeStateCopyWithImpl(
      _$_DeliveryTypeState _value, $Res Function(_$_DeliveryTypeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$_DeliveryTypeState(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeliveryType,
    ));
  }
}

/// @nodoc

class _$_DeliveryTypeState extends _DeliveryTypeState {
  const _$_DeliveryTypeState({this.type = DeliveryType.delivery}) : super._();

  @override
  @JsonKey()
  final DeliveryType type;

  @override
  String toString() {
    return 'DeliveryTypeState(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryTypeState &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryTypeStateCopyWith<_$_DeliveryTypeState> get copyWith =>
      __$$_DeliveryTypeStateCopyWithImpl<_$_DeliveryTypeState>(
          this, _$identity);
}

abstract class _DeliveryTypeState extends DeliveryTypeState {
  const factory _DeliveryTypeState({final DeliveryType type}) =
      _$_DeliveryTypeState;
  const _DeliveryTypeState._() : super._();

  @override
  DeliveryType get type;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryTypeStateCopyWith<_$_DeliveryTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}
