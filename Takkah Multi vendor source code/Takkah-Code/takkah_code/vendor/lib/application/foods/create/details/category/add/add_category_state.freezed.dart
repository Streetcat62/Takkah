// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddCategoryState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCategoryStateCopyWith<AddCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCategoryStateCopyWith<$Res> {
  factory $AddCategoryStateCopyWith(
          AddCategoryState value, $Res Function(AddCategoryState) then) =
      _$AddCategoryStateCopyWithImpl<$Res, AddCategoryState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AddCategoryStateCopyWithImpl<$Res, $Val extends AddCategoryState>
    implements $AddCategoryStateCopyWith<$Res> {
  _$AddCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddCategoryStateCopyWith<$Res>
    implements $AddCategoryStateCopyWith<$Res> {
  factory _$$_AddCategoryStateCopyWith(
          _$_AddCategoryState value, $Res Function(_$_AddCategoryState) then) =
      __$$_AddCategoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_AddCategoryStateCopyWithImpl<$Res>
    extends _$AddCategoryStateCopyWithImpl<$Res, _$_AddCategoryState>
    implements _$$_AddCategoryStateCopyWith<$Res> {
  __$$_AddCategoryStateCopyWithImpl(
      _$_AddCategoryState _value, $Res Function(_$_AddCategoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_AddCategoryState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddCategoryState extends _AddCategoryState {
  const _$_AddCategoryState({this.isLoading = false}) : super._();

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AddCategoryState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCategoryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddCategoryStateCopyWith<_$_AddCategoryState> get copyWith =>
      __$$_AddCategoryStateCopyWithImpl<_$_AddCategoryState>(this, _$identity);
}

abstract class _AddCategoryState extends AddCategoryState {
  const factory _AddCategoryState({final bool isLoading}) = _$_AddCategoryState;
  const _AddCategoryState._() : super._();

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_AddCategoryStateCopyWith<_$_AddCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
