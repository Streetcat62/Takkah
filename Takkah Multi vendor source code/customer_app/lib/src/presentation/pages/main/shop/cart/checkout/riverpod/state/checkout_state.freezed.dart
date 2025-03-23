// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutState {
  int get activeTab => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call({int activeTab});
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTab = null,
  }) {
    return _then(_value.copyWith(
      activeTab: null == activeTab
          ? _value.activeTab
          : activeTab // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckoutStateCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$_CheckoutStateCopyWith(
          _$_CheckoutState value, $Res Function(_$_CheckoutState) then) =
      __$$_CheckoutStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int activeTab});
}

/// @nodoc
class __$$_CheckoutStateCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$_CheckoutState>
    implements _$$_CheckoutStateCopyWith<$Res> {
  __$$_CheckoutStateCopyWithImpl(
      _$_CheckoutState _value, $Res Function(_$_CheckoutState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTab = null,
  }) {
    return _then(_$_CheckoutState(
      activeTab: null == activeTab
          ? _value.activeTab
          : activeTab // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CheckoutState extends _CheckoutState {
  const _$_CheckoutState({this.activeTab = 0}) : super._();

  @override
  @JsonKey()
  final int activeTab;

  @override
  String toString() {
    return 'CheckoutState(activeTab: $activeTab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckoutState &&
            (identical(other.activeTab, activeTab) ||
                other.activeTab == activeTab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeTab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckoutStateCopyWith<_$_CheckoutState> get copyWith =>
      __$$_CheckoutStateCopyWithImpl<_$_CheckoutState>(this, _$identity);
}

abstract class _CheckoutState extends CheckoutState {
  const factory _CheckoutState({final int activeTab}) = _$_CheckoutState;
  const _CheckoutState._() : super._();

  @override
  int get activeTab;
  @override
  @JsonKey(ignore: true)
  _$$_CheckoutStateCopyWith<_$_CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}
