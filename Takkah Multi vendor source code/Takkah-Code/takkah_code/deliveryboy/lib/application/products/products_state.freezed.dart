// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductsState {
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductsStateCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$_ProductsStateCopyWith(
          _$_ProductsState value, $Res Function(_$_ProductsState) then) =
      __$$_ProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class __$$_ProductsStateCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$_ProductsState>
    implements _$$_ProductsStateCopyWith<$Res> {
  __$$_ProductsStateCopyWithImpl(
      _$_ProductsState _value, $Res Function(_$_ProductsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_$_ProductsState(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProductsState extends _ProductsState {
  const _$_ProductsState({this.currentIndex = 0}) : super._();

  @override
  @JsonKey()
  final int currentIndex;

  @override
  String toString() {
    return 'ProductsState(currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsState &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsStateCopyWith<_$_ProductsState> get copyWith =>
      __$$_ProductsStateCopyWithImpl<_$_ProductsState>(this, _$identity);
}

abstract class _ProductsState extends ProductsState {
  const factory _ProductsState({final int currentIndex}) = _$_ProductsState;
  const _ProductsState._() : super._();

  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsStateCopyWith<_$_ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
