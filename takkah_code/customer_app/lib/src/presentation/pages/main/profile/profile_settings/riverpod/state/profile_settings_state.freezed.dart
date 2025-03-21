// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileSettingsState {
  bool get isLoading => throw _privateConstructorUsedError;
  UserData? get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileSettingsStateCopyWith<ProfileSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileSettingsStateCopyWith<$Res> {
  factory $ProfileSettingsStateCopyWith(ProfileSettingsState value,
          $Res Function(ProfileSettingsState) then) =
      _$ProfileSettingsStateCopyWithImpl<$Res, ProfileSettingsState>;
  @useResult
  $Res call({bool isLoading, UserData? userData});
}

/// @nodoc
class _$ProfileSettingsStateCopyWithImpl<$Res,
        $Val extends ProfileSettingsState>
    implements $ProfileSettingsStateCopyWith<$Res> {
  _$ProfileSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileSettingsStateCopyWith<$Res>
    implements $ProfileSettingsStateCopyWith<$Res> {
  factory _$$_ProfileSettingsStateCopyWith(_$_ProfileSettingsState value,
          $Res Function(_$_ProfileSettingsState) then) =
      __$$_ProfileSettingsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, UserData? userData});
}

/// @nodoc
class __$$_ProfileSettingsStateCopyWithImpl<$Res>
    extends _$ProfileSettingsStateCopyWithImpl<$Res, _$_ProfileSettingsState>
    implements _$$_ProfileSettingsStateCopyWith<$Res> {
  __$$_ProfileSettingsStateCopyWithImpl(_$_ProfileSettingsState _value,
      $Res Function(_$_ProfileSettingsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? userData = freezed,
  }) {
    return _then(_$_ProfileSettingsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: freezed == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc

class _$_ProfileSettingsState extends _ProfileSettingsState {
  const _$_ProfileSettingsState({this.isLoading = false, this.userData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final UserData? userData;

  @override
  String toString() {
    return 'ProfileSettingsState(isLoading: $isLoading, userData: $userData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileSettingsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, userData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileSettingsStateCopyWith<_$_ProfileSettingsState> get copyWith =>
      __$$_ProfileSettingsStateCopyWithImpl<_$_ProfileSettingsState>(
          this, _$identity);
}

abstract class _ProfileSettingsState extends ProfileSettingsState {
  const factory _ProfileSettingsState(
      {final bool isLoading,
      final UserData? userData}) = _$_ProfileSettingsState;
  const _ProfileSettingsState._() : super._();

  @override
  bool get isLoading;
  @override
  UserData? get userData;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileSettingsStateCopyWith<_$_ProfileSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
