// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopCategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopCategoriesStateCopyWith<ShopCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCategoriesStateCopyWith<$Res> {
  factory $ShopCategoriesStateCopyWith(
          ShopCategoriesState value, $Res Function(ShopCategoriesState) then) =
      _$ShopCategoriesStateCopyWithImpl<$Res, ShopCategoriesState>;
  @useResult
  $Res call({bool isLoading, List<CategoryData> categories});
}

/// @nodoc
class _$ShopCategoriesStateCopyWithImpl<$Res, $Val extends ShopCategoriesState>
    implements $ShopCategoriesStateCopyWith<$Res> {
  _$ShopCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopCategoriesStateCopyWith<$Res>
    implements $ShopCategoriesStateCopyWith<$Res> {
  factory _$$_ShopCategoriesStateCopyWith(_$_ShopCategoriesState value,
          $Res Function(_$_ShopCategoriesState) then) =
      __$$_ShopCategoriesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<CategoryData> categories});
}

/// @nodoc
class __$$_ShopCategoriesStateCopyWithImpl<$Res>
    extends _$ShopCategoriesStateCopyWithImpl<$Res, _$_ShopCategoriesState>
    implements _$$_ShopCategoriesStateCopyWith<$Res> {
  __$$_ShopCategoriesStateCopyWithImpl(_$_ShopCategoriesState _value,
      $Res Function(_$_ShopCategoriesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
  }) {
    return _then(_$_ShopCategoriesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
    ));
  }
}

/// @nodoc

class _$_ShopCategoriesState extends _ShopCategoriesState {
  const _$_ShopCategoriesState(
      {this.isLoading = false, final List<CategoryData> categories = const []})
      : _categories = categories,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<CategoryData> _categories;
  @override
  @JsonKey()
  List<CategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'ShopCategoriesState(isLoading: $isLoading, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopCategoriesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopCategoriesStateCopyWith<_$_ShopCategoriesState> get copyWith =>
      __$$_ShopCategoriesStateCopyWithImpl<_$_ShopCategoriesState>(
          this, _$identity);
}

abstract class _ShopCategoriesState extends ShopCategoriesState {
  const factory _ShopCategoriesState(
      {final bool isLoading,
      final List<CategoryData> categories}) = _$_ShopCategoriesState;
  const _ShopCategoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CategoryData> get categories;
  @override
  @JsonKey(ignore: true)
  _$$_ShopCategoriesStateCopyWith<_$_ShopCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
