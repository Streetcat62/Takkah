// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_recipes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AllRecipesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  List<RecipeData> get recipes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllRecipesStateCopyWith<AllRecipesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllRecipesStateCopyWith<$Res> {
  factory $AllRecipesStateCopyWith(
          AllRecipesState value, $Res Function(AllRecipesState) then) =
      _$AllRecipesStateCopyWithImpl<$Res, AllRecipesState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<RecipeData> recipes});
}

/// @nodoc
class _$AllRecipesStateCopyWithImpl<$Res, $Val extends AllRecipesState>
    implements $AllRecipesStateCopyWith<$Res> {
  _$AllRecipesStateCopyWithImpl(this._value, this._then);

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
    Object? recipes = null,
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
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllRecipesStateCopyWith<$Res>
    implements $AllRecipesStateCopyWith<$Res> {
  factory _$$_AllRecipesStateCopyWith(
          _$_AllRecipesState value, $Res Function(_$_AllRecipesState) then) =
      __$$_AllRecipesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool hasMore,
      List<RecipeData> recipes});
}

/// @nodoc
class __$$_AllRecipesStateCopyWithImpl<$Res>
    extends _$AllRecipesStateCopyWithImpl<$Res, _$_AllRecipesState>
    implements _$$_AllRecipesStateCopyWith<$Res> {
  __$$_AllRecipesStateCopyWithImpl(
      _$_AllRecipesState _value, $Res Function(_$_AllRecipesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? hasMore = null,
    Object? recipes = null,
  }) {
    return _then(_$_AllRecipesState(
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
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeData>,
    ));
  }
}

/// @nodoc

class _$_AllRecipesState extends _AllRecipesState {
  const _$_AllRecipesState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      this.hasMore = true,
      final List<RecipeData> recipes = const []})
      : _recipes = recipes,
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
  final List<RecipeData> _recipes;
  @override
  @JsonKey()
  List<RecipeData> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'AllRecipesState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, hasMore: $hasMore, recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllRecipesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      hasMore, const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllRecipesStateCopyWith<_$_AllRecipesState> get copyWith =>
      __$$_AllRecipesStateCopyWithImpl<_$_AllRecipesState>(this, _$identity);
}

abstract class _AllRecipesState extends AllRecipesState {
  const factory _AllRecipesState(
      {final bool isLoading,
      final bool isMoreLoading,
      final bool hasMore,
      final List<RecipeData> recipes}) = _$_AllRecipesState;
  const _AllRecipesState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  bool get hasMore;
  @override
  List<RecipeData> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$_AllRecipesStateCopyWith<_$_AllRecipesState> get copyWith =>
      throw _privateConstructorUsedError;
}
