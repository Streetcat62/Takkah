// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_images_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductImagesState {
  int get activeImageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductImagesStateCopyWith<ProductImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImagesStateCopyWith<$Res> {
  factory $ProductImagesStateCopyWith(
          ProductImagesState value, $Res Function(ProductImagesState) then) =
      _$ProductImagesStateCopyWithImpl<$Res, ProductImagesState>;
  @useResult
  $Res call({int activeImageIndex});
}

/// @nodoc
class _$ProductImagesStateCopyWithImpl<$Res, $Val extends ProductImagesState>
    implements $ProductImagesStateCopyWith<$Res> {
  _$ProductImagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeImageIndex = null,
  }) {
    return _then(_value.copyWith(
      activeImageIndex: null == activeImageIndex
          ? _value.activeImageIndex
          : activeImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductImagesStateCopyWith<$Res>
    implements $ProductImagesStateCopyWith<$Res> {
  factory _$$_ProductImagesStateCopyWith(_$_ProductImagesState value,
          $Res Function(_$_ProductImagesState) then) =
      __$$_ProductImagesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int activeImageIndex});
}

/// @nodoc
class __$$_ProductImagesStateCopyWithImpl<$Res>
    extends _$ProductImagesStateCopyWithImpl<$Res, _$_ProductImagesState>
    implements _$$_ProductImagesStateCopyWith<$Res> {
  __$$_ProductImagesStateCopyWithImpl(
      _$_ProductImagesState _value, $Res Function(_$_ProductImagesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeImageIndex = null,
  }) {
    return _then(_$_ProductImagesState(
      activeImageIndex: null == activeImageIndex
          ? _value.activeImageIndex
          : activeImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProductImagesState extends _ProductImagesState {
  const _$_ProductImagesState({this.activeImageIndex = 0}) : super._();

  @override
  @JsonKey()
  final int activeImageIndex;

  @override
  String toString() {
    return 'ProductImagesState(activeImageIndex: $activeImageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductImagesState &&
            (identical(other.activeImageIndex, activeImageIndex) ||
                other.activeImageIndex == activeImageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activeImageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductImagesStateCopyWith<_$_ProductImagesState> get copyWith =>
      __$$_ProductImagesStateCopyWithImpl<_$_ProductImagesState>(
          this, _$identity);
}

abstract class _ProductImagesState extends ProductImagesState {
  const factory _ProductImagesState({final int activeImageIndex}) =
      _$_ProductImagesState;
  const _ProductImagesState._() : super._();

  @override
  int get activeImageIndex;
  @override
  @JsonKey(ignore: true)
  _$$_ProductImagesStateCopyWith<_$_ProductImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}
