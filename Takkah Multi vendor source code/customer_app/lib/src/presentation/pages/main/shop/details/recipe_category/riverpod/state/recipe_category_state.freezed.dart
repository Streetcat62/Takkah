// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeCategoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  RecipeCategoryData? get categoryData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeCategoryStateCopyWith<RecipeCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCategoryStateCopyWith<$Res> {
  factory $RecipeCategoryStateCopyWith(
          RecipeCategoryState value, $Res Function(RecipeCategoryState) then) =
      _$RecipeCategoryStateCopyWithImpl<$Res, RecipeCategoryState>;
  @useResult
  $Res call({bool isLoading, RecipeCategoryData? categoryData});
}

/// @nodoc
class _$RecipeCategoryStateCopyWithImpl<$Res, $Val extends RecipeCategoryState>
    implements $RecipeCategoryStateCopyWith<$Res> {
  _$RecipeCategoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categoryData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryData: freezed == categoryData
          ? _value.categoryData
          : categoryData // ignore: cast_nullable_to_non_nullable
              as RecipeCategoryData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeCategoryStateCopyWith<$Res>
    implements $RecipeCategoryStateCopyWith<$Res> {
  factory _$$_RecipeCategoryStateCopyWith(_$_RecipeCategoryState value,
          $Res Function(_$_RecipeCategoryState) then) =
      __$$_RecipeCategoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, RecipeCategoryData? categoryData});
}

/// @nodoc
class __$$_RecipeCategoryStateCopyWithImpl<$Res>
    extends _$RecipeCategoryStateCopyWithImpl<$Res, _$_RecipeCategoryState>
    implements _$$_RecipeCategoryStateCopyWith<$Res> {
  __$$_RecipeCategoryStateCopyWithImpl(_$_RecipeCategoryState _value,
      $Res Function(_$_RecipeCategoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categoryData = freezed,
  }) {
    return _then(_$_RecipeCategoryState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryData: freezed == categoryData
          ? _value.categoryData
          : categoryData // ignore: cast_nullable_to_non_nullable
              as RecipeCategoryData?,
    ));
  }
}

/// @nodoc

class _$_RecipeCategoryState extends _RecipeCategoryState {
  const _$_RecipeCategoryState({this.isLoading = false, this.categoryData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final RecipeCategoryData? categoryData;

  @override
  String toString() {
    return 'RecipeCategoryState(isLoading: $isLoading, categoryData: $categoryData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeCategoryState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.categoryData, categoryData) ||
                other.categoryData == categoryData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, categoryData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCategoryStateCopyWith<_$_RecipeCategoryState> get copyWith =>
      __$$_RecipeCategoryStateCopyWithImpl<_$_RecipeCategoryState>(
          this, _$identity);
}

abstract class _RecipeCategoryState extends RecipeCategoryState {
  const factory _RecipeCategoryState(
      {final bool isLoading,
      final RecipeCategoryData? categoryData}) = _$_RecipeCategoryState;
  const _RecipeCategoryState._() : super._();

  @override
  bool get isLoading;
  @override
  RecipeCategoryData? get categoryData;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCategoryStateCopyWith<_$_RecipeCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
