// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_appbar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeAppbarState {
  String get title => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeAppbarStateCopyWith<HomeAppbarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeAppbarStateCopyWith<$Res> {
  factory $HomeAppbarStateCopyWith(
          HomeAppbarState value, $Res Function(HomeAppbarState) then) =
      _$HomeAppbarStateCopyWithImpl<$Res, HomeAppbarState>;
  @useResult
  $Res call({String title, int totalCount, int index});
}

/// @nodoc
class _$HomeAppbarStateCopyWithImpl<$Res, $Val extends HomeAppbarState>
    implements $HomeAppbarStateCopyWith<$Res> {
  _$HomeAppbarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? totalCount = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeAppbarStateCopyWith<$Res>
    implements $HomeAppbarStateCopyWith<$Res> {
  factory _$$_HomeAppbarStateCopyWith(
          _$_HomeAppbarState value, $Res Function(_$_HomeAppbarState) then) =
      __$$_HomeAppbarStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int totalCount, int index});
}

/// @nodoc
class __$$_HomeAppbarStateCopyWithImpl<$Res>
    extends _$HomeAppbarStateCopyWithImpl<$Res, _$_HomeAppbarState>
    implements _$$_HomeAppbarStateCopyWith<$Res> {
  __$$_HomeAppbarStateCopyWithImpl(
      _$_HomeAppbarState _value, $Res Function(_$_HomeAppbarState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? totalCount = null,
    Object? index = null,
  }) {
    return _then(_$_HomeAppbarState(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeAppbarState extends _HomeAppbarState {
  const _$_HomeAppbarState(
      {this.title = '', this.totalCount = 0, this.index = 0})
      : super._();

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'HomeAppbarState(title: $title, totalCount: $totalCount, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeAppbarState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, totalCount, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeAppbarStateCopyWith<_$_HomeAppbarState> get copyWith =>
      __$$_HomeAppbarStateCopyWithImpl<_$_HomeAppbarState>(this, _$identity);
}

abstract class _HomeAppbarState extends HomeAppbarState {
  const factory _HomeAppbarState(
      {final String title,
      final int totalCount,
      final int index}) = _$_HomeAppbarState;
  const _HomeAppbarState._() : super._();

  @override
  String get title;
  @override
  int get totalCount;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_HomeAppbarStateCopyWith<_$_HomeAppbarState> get copyWith =>
      throw _privateConstructorUsedError;
}
