// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductReviewState {
  bool get isReviewing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductReviewStateCopyWith<ProductReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReviewStateCopyWith<$Res> {
  factory $ProductReviewStateCopyWith(
          ProductReviewState value, $Res Function(ProductReviewState) then) =
      _$ProductReviewStateCopyWithImpl<$Res, ProductReviewState>;
  @useResult
  $Res call({bool isReviewing});
}

/// @nodoc
class _$ProductReviewStateCopyWithImpl<$Res, $Val extends ProductReviewState>
    implements $ProductReviewStateCopyWith<$Res> {
  _$ProductReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isReviewing = null,
  }) {
    return _then(_value.copyWith(
      isReviewing: null == isReviewing
          ? _value.isReviewing
          : isReviewing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductReviewStateCopyWith<$Res>
    implements $ProductReviewStateCopyWith<$Res> {
  factory _$$_ProductReviewStateCopyWith(_$_ProductReviewState value,
          $Res Function(_$_ProductReviewState) then) =
      __$$_ProductReviewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isReviewing});
}

/// @nodoc
class __$$_ProductReviewStateCopyWithImpl<$Res>
    extends _$ProductReviewStateCopyWithImpl<$Res, _$_ProductReviewState>
    implements _$$_ProductReviewStateCopyWith<$Res> {
  __$$_ProductReviewStateCopyWithImpl(
      _$_ProductReviewState _value, $Res Function(_$_ProductReviewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isReviewing = null,
  }) {
    return _then(_$_ProductReviewState(
      isReviewing: null == isReviewing
          ? _value.isReviewing
          : isReviewing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProductReviewState extends _ProductReviewState {
  const _$_ProductReviewState({this.isReviewing = false}) : super._();

  @override
  @JsonKey()
  final bool isReviewing;

  @override
  String toString() {
    return 'ProductReviewState(isReviewing: $isReviewing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductReviewState &&
            (identical(other.isReviewing, isReviewing) ||
                other.isReviewing == isReviewing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isReviewing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductReviewStateCopyWith<_$_ProductReviewState> get copyWith =>
      __$$_ProductReviewStateCopyWithImpl<_$_ProductReviewState>(
          this, _$identity);
}

abstract class _ProductReviewState extends ProductReviewState {
  const factory _ProductReviewState({final bool isReviewing}) =
      _$_ProductReviewState;
  const _ProductReviewState._() : super._();

  @override
  bool get isReviewing;
  @override
  @JsonKey(ignore: true)
  _$$_ProductReviewStateCopyWith<_$_ProductReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}
