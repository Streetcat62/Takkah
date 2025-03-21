// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_images_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewImagesState {
  List<String> get reviewImages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewImagesStateCopyWith<ReviewImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewImagesStateCopyWith<$Res> {
  factory $ReviewImagesStateCopyWith(
          ReviewImagesState value, $Res Function(ReviewImagesState) then) =
      _$ReviewImagesStateCopyWithImpl<$Res, ReviewImagesState>;
  @useResult
  $Res call({List<String> reviewImages});
}

/// @nodoc
class _$ReviewImagesStateCopyWithImpl<$Res, $Val extends ReviewImagesState>
    implements $ReviewImagesStateCopyWith<$Res> {
  _$ReviewImagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewImages = null,
  }) {
    return _then(_value.copyWith(
      reviewImages: null == reviewImages
          ? _value.reviewImages
          : reviewImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewImagesStateCopyWith<$Res>
    implements $ReviewImagesStateCopyWith<$Res> {
  factory _$$_ReviewImagesStateCopyWith(_$_ReviewImagesState value,
          $Res Function(_$_ReviewImagesState) then) =
      __$$_ReviewImagesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> reviewImages});
}

/// @nodoc
class __$$_ReviewImagesStateCopyWithImpl<$Res>
    extends _$ReviewImagesStateCopyWithImpl<$Res, _$_ReviewImagesState>
    implements _$$_ReviewImagesStateCopyWith<$Res> {
  __$$_ReviewImagesStateCopyWithImpl(
      _$_ReviewImagesState _value, $Res Function(_$_ReviewImagesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewImages = null,
  }) {
    return _then(_$_ReviewImagesState(
      reviewImages: null == reviewImages
          ? _value._reviewImages
          : reviewImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_ReviewImagesState extends _ReviewImagesState {
  const _$_ReviewImagesState({final List<String> reviewImages = const []})
      : _reviewImages = reviewImages,
        super._();

  final List<String> _reviewImages;
  @override
  @JsonKey()
  List<String> get reviewImages {
    if (_reviewImages is EqualUnmodifiableListView) return _reviewImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewImages);
  }

  @override
  String toString() {
    return 'ReviewImagesState(reviewImages: $reviewImages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewImagesState &&
            const DeepCollectionEquality()
                .equals(other._reviewImages, _reviewImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reviewImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewImagesStateCopyWith<_$_ReviewImagesState> get copyWith =>
      __$$_ReviewImagesStateCopyWithImpl<_$_ReviewImagesState>(
          this, _$identity);
}

abstract class _ReviewImagesState extends ReviewImagesState {
  const factory _ReviewImagesState({final List<String> reviewImages}) =
      _$_ReviewImagesState;
  const _ReviewImagesState._() : super._();

  @override
  List<String> get reviewImages;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewImagesStateCopyWith<_$_ReviewImagesState> get copyWith =>
      throw _privateConstructorUsedError;
}
