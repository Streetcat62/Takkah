// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileImageState {
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileImageStateCopyWith<ProfileImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileImageStateCopyWith<$Res> {
  factory $ProfileImageStateCopyWith(
          ProfileImageState value, $Res Function(ProfileImageState) then) =
      _$ProfileImageStateCopyWithImpl<$Res, ProfileImageState>;
  @useResult
  $Res call({String? imageUrl, String? path});
}

/// @nodoc
class _$ProfileImageStateCopyWithImpl<$Res, $Val extends ProfileImageState>
    implements $ProfileImageStateCopyWith<$Res> {
  _$ProfileImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? path = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileImageStateCopyWith<$Res>
    implements $ProfileImageStateCopyWith<$Res> {
  factory _$$_ProfileImageStateCopyWith(_$_ProfileImageState value,
          $Res Function(_$_ProfileImageState) then) =
      __$$_ProfileImageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imageUrl, String? path});
}

/// @nodoc
class __$$_ProfileImageStateCopyWithImpl<$Res>
    extends _$ProfileImageStateCopyWithImpl<$Res, _$_ProfileImageState>
    implements _$$_ProfileImageStateCopyWith<$Res> {
  __$$_ProfileImageStateCopyWithImpl(
      _$_ProfileImageState _value, $Res Function(_$_ProfileImageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? path = freezed,
  }) {
    return _then(_$_ProfileImageState(
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ProfileImageState extends _ProfileImageState {
  const _$_ProfileImageState({this.imageUrl, this.path}) : super._();

  @override
  final String? imageUrl;
  @override
  final String? path;

  @override
  String toString() {
    return 'ProfileImageState(imageUrl: $imageUrl, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileImageState &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileImageStateCopyWith<_$_ProfileImageState> get copyWith =>
      __$$_ProfileImageStateCopyWithImpl<_$_ProfileImageState>(
          this, _$identity);
}

abstract class _ProfileImageState extends ProfileImageState {
  const factory _ProfileImageState(
      {final String? imageUrl, final String? path}) = _$_ProfileImageState;
  const _ProfileImageState._() : super._();

  @override
  String? get imageUrl;
  @override
  String? get path;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileImageStateCopyWith<_$_ProfileImageState> get copyWith =>
      throw _privateConstructorUsedError;
}
