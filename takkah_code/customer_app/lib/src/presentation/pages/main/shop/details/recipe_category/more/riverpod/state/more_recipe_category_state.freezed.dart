// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'more_recipe_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoreRecipeCategoryState {
  bool get isLoading => throw _privateConstructorUsedError;
  RecipeCategoryData? get categoryData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoreRecipeCategoryStateCopyWith<MoreRecipeCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreRecipeCategoryStateCopyWith<$Res> {
  factory $MoreRecipeCategoryStateCopyWith(MoreRecipeCategoryState value,
          $Res Function(MoreRecipeCategoryState) then) =
      _$MoreRecipeCategoryStateCopyWithImpl<$Res, MoreRecipeCategoryState>;
  @useResult
  $Res call({bool isLoading, RecipeCategoryData? categoryData});
}

/// @nodoc
class _$MoreRecipeCategoryStateCopyWithImpl<$Res,
        $Val extends MoreRecipeCategoryState>
    implements $MoreRecipeCategoryStateCopyWith<$Res> {
  _$MoreRecipeCategoryStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_MoreRecipeCategoryStateCopyWith<$Res>
    implements $MoreRecipeCategoryStateCopyWith<$Res> {
  factory _$$_MoreRecipeCategoryStateCopyWith(_$_MoreRecipeCategoryState value,
          $Res Function(_$_MoreRecipeCategoryState) then) =
      __$$_MoreRecipeCategoryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, RecipeCategoryData? categoryData});
}

/// @nodoc
class __$$_MoreRecipeCategoryStateCopyWithImpl<$Res>
    extends _$MoreRecipeCategoryStateCopyWithImpl<$Res,
        _$_MoreRecipeCategoryState>
    implements _$$_MoreRecipeCategoryStateCopyWith<$Res> {
  __$$_MoreRecipeCategoryStateCopyWithImpl(_$_MoreRecipeCategoryState _value,
      $Res Function(_$_MoreRecipeCategoryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categoryData = freezed,
  }) {
    return _then(_$_MoreRecipeCategoryState(
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

class _$_MoreRecipeCategoryState extends _MoreRecipeCategoryState {
  const _$_MoreRecipeCategoryState({this.isLoading = false, this.categoryData})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final RecipeCategoryData? categoryData;

  @override
  String toString() {
    return 'MoreRecipeCategoryState(isLoading: $isLoading, categoryData: $categoryData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoreRecipeCategoryState &&
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
  _$$_MoreRecipeCategoryStateCopyWith<_$_MoreRecipeCategoryState>
      get copyWith =>
          __$$_MoreRecipeCategoryStateCopyWithImpl<_$_MoreRecipeCategoryState>(
              this, _$identity);
}

abstract class _MoreRecipeCategoryState extends MoreRecipeCategoryState {
  const factory _MoreRecipeCategoryState(
      {final bool isLoading,
      final RecipeCategoryData? categoryData}) = _$_MoreRecipeCategoryState;
  const _MoreRecipeCategoryState._() : super._();

  @override
  bool get isLoading;
  @override
  RecipeCategoryData? get categoryData;
  @override
  @JsonKey(ignore: true)
  _$$_MoreRecipeCategoryStateCopyWith<_$_MoreRecipeCategoryState>
      get copyWith => throw _privateConstructorUsedError;
}
