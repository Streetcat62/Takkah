// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_times_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeliveryTimesState {
  DateTime? get selectedDateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliveryTimesStateCopyWith<DeliveryTimesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryTimesStateCopyWith<$Res> {
  factory $DeliveryTimesStateCopyWith(
          DeliveryTimesState value, $Res Function(DeliveryTimesState) then) =
      _$DeliveryTimesStateCopyWithImpl<$Res, DeliveryTimesState>;
  @useResult
  $Res call({DateTime? selectedDateTime});
}

/// @nodoc
class _$DeliveryTimesStateCopyWithImpl<$Res, $Val extends DeliveryTimesState>
    implements $DeliveryTimesStateCopyWith<$Res> {
  _$DeliveryTimesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDateTime: freezed == selectedDateTime
          ? _value.selectedDateTime
          : selectedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryTimesStateCopyWith<$Res>
    implements $DeliveryTimesStateCopyWith<$Res> {
  factory _$$_DeliveryTimesStateCopyWith(_$_DeliveryTimesState value,
          $Res Function(_$_DeliveryTimesState) then) =
      __$$_DeliveryTimesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? selectedDateTime});
}

/// @nodoc
class __$$_DeliveryTimesStateCopyWithImpl<$Res>
    extends _$DeliveryTimesStateCopyWithImpl<$Res, _$_DeliveryTimesState>
    implements _$$_DeliveryTimesStateCopyWith<$Res> {
  __$$_DeliveryTimesStateCopyWithImpl(
      _$_DeliveryTimesState _value, $Res Function(_$_DeliveryTimesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDateTime = freezed,
  }) {
    return _then(_$_DeliveryTimesState(
      selectedDateTime: freezed == selectedDateTime
          ? _value.selectedDateTime
          : selectedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_DeliveryTimesState extends _DeliveryTimesState {
  const _$_DeliveryTimesState({this.selectedDateTime}) : super._();

  @override
  final DateTime? selectedDateTime;

  @override
  String toString() {
    return 'DeliveryTimesState(selectedDateTime: $selectedDateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryTimesState &&
            (identical(other.selectedDateTime, selectedDateTime) ||
                other.selectedDateTime == selectedDateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryTimesStateCopyWith<_$_DeliveryTimesState> get copyWith =>
      __$$_DeliveryTimesStateCopyWithImpl<_$_DeliveryTimesState>(
          this, _$identity);
}

abstract class _DeliveryTimesState extends DeliveryTimesState {
  const factory _DeliveryTimesState({final DateTime? selectedDateTime}) =
      _$_DeliveryTimesState;
  const _DeliveryTimesState._() : super._();

  @override
  DateTime? get selectedDateTime;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryTimesStateCopyWith<_$_DeliveryTimesState> get copyWith =>
      throw _privateConstructorUsedError;
}
