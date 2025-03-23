// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_recipe_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllRecipeCategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  List<RecipeCategoryData> get recipeCategories =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllRecipeCategoriesStateCopyWith<AllRecipeCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllRecipeCategoriesStateCopyWith<$Res> {
  factory $AllRecipeCategoriesStateCopyWith(AllRecipeCategoriesState value,
          $Res Function(AllRecipeCategoriesState) then) =
      _$AllRecipeCategoriesStateCopyWithImpl<$Res, AllRecipeCategoriesState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<RecipeCategoryData> recipeCategories});
}

/// @nodoc
class _$AllRecipeCategoriesStateCopyWithImpl<$Res,
        $Val extends AllRecipeCategoriesState>
    implements $AllRecipeCategoriesStateCopyWith<$Res> {
  _$AllRecipeCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? hasMore = null,
    Object? recipeCategories = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      recipeCategories: null == recipeCategories
          ? _value.recipeCategories
          : recipeCategories // ignore: cast_nullable_to_non_nullable
              as List<RecipeCategoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllRecipeCategoriesStateCopyWith<$Res>
    implements $AllRecipeCategoriesStateCopyWith<$Res> {
  factory _$$_AllRecipeCategoriesStateCopyWith(
          _$_AllRecipeCategoriesState value,
          $Res Function(_$_AllRecipeCategoriesState) then) =
      __$$_AllRecipeCategoriesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<RecipeCategoryData> recipeCategories});
}

/// @nodoc
class __$$_AllRecipeCategoriesStateCopyWithImpl<$Res>
    extends _$AllRecipeCategoriesStateCopyWithImpl<$Res,
        _$_AllRecipeCategoriesState>
    implements _$$_AllRecipeCategoriesStateCopyWith<$Res> {
  __$$_AllRecipeCategoriesStateCopyWithImpl(_$_AllRecipeCategoriesState _value,
      $Res Function(_$_AllRecipeCategoriesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? hasMore = null,
    Object? recipeCategories = null,
  }) {
    return _then(_$_AllRecipeCategoriesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      recipeCategories: null == recipeCategories
          ? _value._recipeCategories
          : recipeCategories // ignore: cast_nullable_to_non_nullable
              as List<RecipeCategoryData>,
    ));
  }
}

/// @nodoc

class _$_AllRecipeCategoriesState extends _AllRecipeCategoriesState {
  const _$_AllRecipeCategoriesState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      this.hasMore = true,
      final List<RecipeCategoryData> recipeCategories = const []})
      : _recipeCategories = recipeCategories,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  @override
  @JsonKey()
  final bool hasMore;
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
    return 'AllRecipeCategoriesState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, hasMore: $hasMore, recipeCategories: $recipeCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllRecipeCategoriesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality()
                .equals(other._recipeCategories, _recipeCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      hasMore, const DeepCollectionEquality().hash(_recipeCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllRecipeCategoriesStateCopyWith<_$_AllRecipeCategoriesState>
      get copyWith => __$$_AllRecipeCategoriesStateCopyWithImpl<
          _$_AllRecipeCategoriesState>(this, _$identity);
}

abstract class _AllRecipeCategoriesState extends AllRecipeCategoriesState {
  const factory _AllRecipeCategoriesState(
          {final bool isLoading,
          final bool isMoreLoading,
          final bool hasMore,
          final List<RecipeCategoryData> recipeCategories}) =
      _$_AllRecipeCategoriesState;
  const _AllRecipeCategoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  bool get hasMore;
  @override
  List<RecipeCategoryData> get recipeCategories;
  @override
  @JsonKey(ignore: true)
  _$$_AllRecipeCategoriesStateCopyWith<_$_AllRecipeCategoriesState>
      get copyWith => throw _privateConstructorUsedError;
}
