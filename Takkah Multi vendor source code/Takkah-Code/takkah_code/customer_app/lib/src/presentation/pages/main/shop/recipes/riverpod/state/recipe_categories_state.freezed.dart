// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeCategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<RecipeCategoryData> get recipeCategories =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeCategoriesStateCopyWith<RecipeCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCategoriesStateCopyWith<$Res> {
  factory $RecipeCategoriesStateCopyWith(RecipeCategoriesState value,
          $Res Function(RecipeCategoriesState) then) =
      _$RecipeCategoriesStateCopyWithImpl<$Res, RecipeCategoriesState>;
  @useResult
  $Res call({bool isLoading, List<RecipeCategoryData> recipeCategories});
}

/// @nodoc
class _$RecipeCategoriesStateCopyWithImpl<$Res,
        $Val extends RecipeCategoriesState>
    implements $RecipeCategoriesStateCopyWith<$Res> {
  _$RecipeCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? recipeCategories = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      recipeCategories: null == recipeCategories
          ? _value.recipeCategories
          : recipeCategories // ignore: cast_nullable_to_non_nullable
              as List<RecipeCategoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeCategoriesStateCopyWith<$Res>
    implements $RecipeCategoriesStateCopyWith<$Res> {
  factory _$$_RecipeCategoriesStateCopyWith(_$_RecipeCategoriesState value,
          $Res Function(_$_RecipeCategoriesState) then) =
      __$$_RecipeCategoriesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<RecipeCategoryData> recipeCategories});
}

/// @nodoc
class __$$_RecipeCategoriesStateCopyWithImpl<$Res>
    extends _$RecipeCategoriesStateCopyWithImpl<$Res, _$_RecipeCategoriesState>
    implements _$$_RecipeCategoriesStateCopyWith<$Res> {
  __$$_RecipeCategoriesStateCopyWithImpl(_$_RecipeCategoriesState _value,
      $Res Function(_$_RecipeCategoriesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? recipeCategories = null,
  }) {
    return _then(_$_RecipeCategoriesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      recipeCategories: null == recipeCategories
          ? _value._recipeCategories
          : recipeCategories // ignore: cast_nullable_to_non_nullable
              as List<RecipeCategoryData>,
    ));
  }
}

/// @nodoc

class _$_RecipeCategoriesState extends _RecipeCategoriesState {
  const _$_RecipeCategoriesState(
      {this.isLoading = false,
      final List<RecipeCategoryData> recipeCategories = const []})
      : _recipeCategories = recipeCategories,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<RecipeCategoryData> _recipeCategories;
  @override
  @JsonKey()
  List<RecipeCategoryData> get recipeCategories {
    if (_recipeCategories is EqualUnmodifiableListView)
      return _recipeCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeCategories);
  }

  @override
  String toString() {
    return 'RecipeCategoriesState(isLoading: $isLoading, recipeCategories: $recipeCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeCategoriesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._recipeCategories, _recipeCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_recipeCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCategoriesStateCopyWith<_$_RecipeCategoriesState> get copyWith =>
      __$$_RecipeCategoriesStateCopyWithImpl<_$_RecipeCategoriesState>(
          this, _$identity);
}

abstract class _RecipeCategoriesState extends RecipeCategoriesState {
  const factory _RecipeCategoriesState(
          {final bool isLoading,
          final List<RecipeCategoryData> recipeCategories}) =
      _$_RecipeCategoriesState;
  const _RecipeCategoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  List<RecipeCategoryData> get recipeCategories;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCategoriesStateCopyWith<_$_RecipeCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
