// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_food_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddFoodCategoriesState {
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  List<CategoryModel> get category => throw _privateConstructorUsedError;
  int get activeIndex => throw _privateConstructorUsedError;
  int get activeChildrenIndex => throw _privateConstructorUsedError;
  TextEditingController? get categoryController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddFoodCategoriesStateCopyWith<AddFoodCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFoodCategoriesStateCopyWith<$Res> {
  factory $AddFoodCategoriesStateCopyWith(AddFoodCategoriesState value,
          $Res Function(AddFoodCategoriesState) then) =
      _$AddFoodCategoriesStateCopyWithImpl<$Res, AddFoodCategoriesState>;
  @useResult
  $Res call(
      {List<CategoryModel> categories,
      List<CategoryModel> category,
      int activeIndex,
      int activeChildrenIndex,
      TextEditingController? categoryController});
}

/// @nodoc
class _$AddFoodCategoriesStateCopyWithImpl<$Res,
        $Val extends AddFoodCategoriesState>
    implements $AddFoodCategoriesStateCopyWith<$Res> {
  _$AddFoodCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? category = null,
    Object? activeIndex = null,
    Object? activeChildrenIndex = null,
    Object? categoryController = freezed,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      activeChildrenIndex: null == activeChildrenIndex
          ? _value.activeChildrenIndex
          : activeChildrenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      categoryController: freezed == categoryController
          ? _value.categoryController
          : categoryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddFoodCategoriesStateCopyWith<$Res>
    implements $AddFoodCategoriesStateCopyWith<$Res> {
  factory _$$_AddFoodCategoriesStateCopyWith(_$_AddFoodCategoriesState value,
          $Res Function(_$_AddFoodCategoriesState) then) =
      __$$_AddFoodCategoriesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoryModel> categories,
      List<CategoryModel> category,
      int activeIndex,
      int activeChildrenIndex,
      TextEditingController? categoryController});
}

/// @nodoc
class __$$_AddFoodCategoriesStateCopyWithImpl<$Res>
    extends _$AddFoodCategoriesStateCopyWithImpl<$Res,
        _$_AddFoodCategoriesState>
    implements _$$_AddFoodCategoriesStateCopyWith<$Res> {
  __$$_AddFoodCategoriesStateCopyWithImpl(_$_AddFoodCategoriesState _value,
      $Res Function(_$_AddFoodCategoriesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? category = null,
    Object? activeIndex = null,
    Object? activeChildrenIndex = null,
    Object? categoryController = freezed,
  }) {
    return _then(_$_AddFoodCategoriesState(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      activeIndex: null == activeIndex
          ? _value.activeIndex
          : activeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      activeChildrenIndex: null == activeChildrenIndex
          ? _value.activeChildrenIndex
          : activeChildrenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      categoryController: freezed == categoryController
          ? _value.categoryController
          : categoryController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ));
  }
}

/// @nodoc

class _$_AddFoodCategoriesState extends _AddFoodCategoriesState {
  const _$_AddFoodCategoriesState(
      {final List<CategoryModel> categories = const [],
      final List<CategoryModel> category = const [],
      this.activeIndex = 0,
      this.activeChildrenIndex = -1,
      this.categoryController})
      : _categories = categories,
        _category = category,
        super._();

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryModel> _category;
  @override
  @JsonKey()
  List<CategoryModel> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

  @override
  @JsonKey()
  final int activeIndex;
  @override
  @JsonKey()
  final int activeChildrenIndex;
  @override
  final TextEditingController? categoryController;

  @override
  String toString() {
    return 'AddFoodCategoriesState(categories: $categories, category: $category, activeIndex: $activeIndex, activeChildrenIndex: $activeChildrenIndex, categoryController: $categoryController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddFoodCategoriesState &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.activeIndex, activeIndex) ||
                other.activeIndex == activeIndex) &&
            (identical(other.activeChildrenIndex, activeChildrenIndex) ||
                other.activeChildrenIndex == activeChildrenIndex) &&
            (identical(other.categoryController, categoryController) ||
                other.categoryController == categoryController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_category),
      activeIndex,
      activeChildrenIndex,
      categoryController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFoodCategoriesStateCopyWith<_$_AddFoodCategoriesState> get copyWith =>
      __$$_AddFoodCategoriesStateCopyWithImpl<_$_AddFoodCategoriesState>(
          this, _$identity);
}

abstract class _AddFoodCategoriesState extends AddFoodCategoriesState {
  const factory _AddFoodCategoriesState(
          {final List<CategoryModel> categories,
          final List<CategoryModel> category,
          final int activeIndex,
          final int activeChildrenIndex,
          final TextEditingController? categoryController}) =
      _$_AddFoodCategoriesState;
  const _AddFoodCategoriesState._() : super._();

  @override
  List<CategoryModel> get categories;
  @override
  List<CategoryModel> get category;
  @override
  int get activeIndex;
  @override
  int get activeChildrenIndex;
  @override
  TextEditingController? get categoryController;
  @override
  @JsonKey(ignore: true)
  _$$_AddFoodCategoriesStateCopyWith<_$_AddFoodCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
