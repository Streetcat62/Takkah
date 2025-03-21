// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_food_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditFoodCategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  int get activeIndex => throw _privateConstructorUsedError;
  int get activeChildrenIndex => throw _privateConstructorUsedError;
  TextEditingController? get categoriesController =>
      throw _privateConstructorUsedError;
  CategoryModel? get foodCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditFoodCategoriesStateCopyWith<EditFoodCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditFoodCategoriesStateCopyWith<$Res> {
  factory $EditFoodCategoriesStateCopyWith(EditFoodCategoriesState value,
          $Res Function(EditFoodCategoriesState) then) =
      _$EditFoodCategoriesStateCopyWithImpl<$Res, EditFoodCategoriesState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryModel> categories,
      int activeIndex,
      int activeChildrenIndex,
      TextEditingController? categoriesController,
      CategoryModel? foodCategory});
}

/// @nodoc
class _$EditFoodCategoriesStateCopyWithImpl<$Res,
        $Val extends EditFoodCategoriesState>
    implements $EditFoodCategoriesStateCopyWith<$Res> {
  _$EditFoodCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? activeIndex = null,
    Object? activeChildrenIndex = null,
    Object? categoriesController = freezed,
    Object? foodCategory = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      activeChildrenIndex: null == activeChildrenIndex
          ? _value.activeChildrenIndex
          : activeChildrenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      categoriesController: freezed == categoriesController
          ? _value.categoriesController
          : categoriesController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      foodCategory: freezed == foodCategory
          ? _value.foodCategory
          : foodCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditFoodCategoriesStateCopyWith<$Res>
    implements $EditFoodCategoriesStateCopyWith<$Res> {
  factory _$$_EditFoodCategoriesStateCopyWith(_$_EditFoodCategoriesState value,
          $Res Function(_$_EditFoodCategoriesState) then) =
      __$$_EditFoodCategoriesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryModel> categories,
      int activeIndex,
      int activeChildrenIndex,
      TextEditingController? categoriesController,
      CategoryModel? foodCategory});
}

/// @nodoc
class __$$_EditFoodCategoriesStateCopyWithImpl<$Res>
    extends _$EditFoodCategoriesStateCopyWithImpl<$Res,
        _$_EditFoodCategoriesState>
    implements _$$_EditFoodCategoriesStateCopyWith<$Res> {
  __$$_EditFoodCategoriesStateCopyWithImpl(_$_EditFoodCategoriesState _value,
      $Res Function(_$_EditFoodCategoriesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? activeIndex = null,
    Object? activeChildrenIndex = null,
    Object? categoriesController = freezed,
    Object? foodCategory = freezed,
  }) {
    return _then(_$_EditFoodCategoriesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      activeChildrenIndex: null == activeChildrenIndex
          ? _value.activeChildrenIndex
          : activeChildrenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      categoriesController: freezed == categoriesController
          ? _value.categoriesController
          : categoriesController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      foodCategory: freezed == foodCategory
          ? _value.foodCategory
          : foodCategory // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
    ));
  }
}

/// @nodoc

class _$_EditFoodCategoriesState extends _EditFoodCategoriesState {
  const _$_EditFoodCategoriesState(
      {this.isLoading = false,
      final List<CategoryModel> categories = const [],
      this.activeIndex = 0,
      this.activeChildrenIndex = 0,
      this.categoriesController,
      this.foodCategory})
      : _categories = categories,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final int activeIndex;
  @override
  @JsonKey()
  final int activeChildrenIndex;
  @override
  final TextEditingController? categoriesController;
  @override
  final CategoryModel? foodCategory;

  @override
  String toString() {
    return 'EditFoodCategoriesState(isLoading: $isLoading, categories: $categories, activeIndex: $activeIndex, activeChildrenIndex: $activeChildrenIndex, categoriesController: $categoriesController, foodCategory: $foodCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditFoodCategoriesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.activeChildrenIndex, activeChildrenIndex) ||
                other.activeChildrenIndex == activeChildrenIndex) &&
            (identical(other.categoriesController, categoriesController) ||
                other.categoriesController == categoriesController) &&
            (identical(other.foodCategory, foodCategory) ||
                other.foodCategory == foodCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_categories),
      activeIndex,
      activeChildrenIndex,
      categoriesController,
      foodCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditFoodCategoriesStateCopyWith<_$_EditFoodCategoriesState>
      get copyWith =>
          __$$_EditFoodCategoriesStateCopyWithImpl<_$_EditFoodCategoriesState>(
              this, _$identity);
}

abstract class _EditFoodCategoriesState extends EditFoodCategoriesState {
  const factory _EditFoodCategoriesState(
      {final bool isLoading,
      final List<CategoryModel> categories,
      final int activeIndex,
      final int activeChildrenIndex,
      final TextEditingController? categoriesController,
      final CategoryModel? foodCategory}) = _$_EditFoodCategoriesState;
  const _EditFoodCategoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CategoryModel> get categories;
  @override
  int get activeIndex;
  @override
  int get activeChildrenIndex;
  @override
  TextEditingController? get categoriesController;
  @override
  CategoryModel? get foodCategory;
  @override
  @JsonKey(ignore: true)
  _$$_EditFoodCategoriesStateCopyWith<_$_EditFoodCategoriesState>
      get copyWith => throw _privateConstructorUsedError;
}
