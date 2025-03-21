// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'foods_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCategoryLoading => throw _privateConstructorUsedError;
  List<ProductModel> get foods => throw _privateConstructorUsedError;
  List<ProductModel> get categoryFoods => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodsStateCopyWith<FoodsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodsStateCopyWith<$Res> {
  factory $FoodsStateCopyWith(
          FoodsState value, $Res Function(FoodsState) then) =
      _$FoodsStateCopyWithImpl<$Res, FoodsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isCategoryLoading,
      List<ProductModel> foods,
      List<ProductModel> categoryFoods});
}

/// @nodoc
class _$FoodsStateCopyWithImpl<$Res, $Val extends FoodsState>
    implements $FoodsStateCopyWith<$Res> {
  _$FoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isCategoryLoading = null,
    Object? foods = null,
    Object? categoryFoods = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoryLoading: null == isCategoryLoading
          ? _value.isCategoryLoading
          : isCategoryLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      categoryFoods: null == categoryFoods
          ? _value.categoryFoods
          : categoryFoods // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FoodsStateCopyWith<$Res>
    implements $FoodsStateCopyWith<$Res> {
  factory _$$_FoodsStateCopyWith(
          _$_FoodsState value, $Res Function(_$_FoodsState) then) =
      __$$_FoodsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isCategoryLoading,
      List<ProductModel> foods,
      List<ProductModel> categoryFoods});
}

/// @nodoc
class __$$_FoodsStateCopyWithImpl<$Res>
    extends _$FoodsStateCopyWithImpl<$Res, _$_FoodsState>
    implements _$$_FoodsStateCopyWith<$Res> {
  __$$_FoodsStateCopyWithImpl(
      _$_FoodsState _value, $Res Function(_$_FoodsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isCategoryLoading = null,
    Object? foods = null,
    Object? categoryFoods = null,
  }) {
    return _then(_$_FoodsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoryLoading: null == isCategoryLoading
          ? _value.isCategoryLoading
          : isCategoryLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
      categoryFoods: null == categoryFoods
          ? _value._categoryFoods
          : categoryFoods // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _$_FoodsState extends _FoodsState {
  const _$_FoodsState(
      {this.isLoading = false,
      this.isCategoryLoading = false,
      final List<ProductModel> foods = const [],
      final List<ProductModel> categoryFoods = const []})
      : _foods = foods,
        _categoryFoods = categoryFoods,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCategoryLoading;
  final List<ProductModel> _foods;
  @override
  @JsonKey()
  List<ProductModel> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  final List<ProductModel> _categoryFoods;
  @override
  @JsonKey()
  List<ProductModel> get categoryFoods {
    if (_categoryFoods is EqualUnmodifiableListView) return _categoryFoods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryFoods);
  }

  @override
  String toString() {
    return 'FoodsState(isLoading: $isLoading, isCategoryLoading: $isCategoryLoading, foods: $foods, categoryFoods: $categoryFoods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCategoryLoading, isCategoryLoading) ||
                other.isCategoryLoading == isCategoryLoading) &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            const DeepCollectionEquality()
                .equals(other._categoryFoods, _categoryFoods));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isCategoryLoading,
      const DeepCollectionEquality().hash(_foods),
      const DeepCollectionEquality().hash(_categoryFoods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodsStateCopyWith<_$_FoodsState> get copyWith =>
      __$$_FoodsStateCopyWithImpl<_$_FoodsState>(this, _$identity);
}

abstract class _FoodsState extends FoodsState {
  const factory _FoodsState(
      {final bool isLoading,
      final bool isCategoryLoading,
      final List<ProductModel> foods,
      final List<ProductModel> categoryFoods}) = _$_FoodsState;
  const _FoodsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isCategoryLoading;
  @override
  List<ProductModel> get foods;
  @override
  List<ProductModel> get categoryFoods;
  @override
  @JsonKey(ignore: true)
  _$$_FoodsStateCopyWith<_$_FoodsState> get copyWith =>
      throw _privateConstructorUsedError;
}
