// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReviewCommentState {
  String get comment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewCommentStateCopyWith<ReviewCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCommentStateCopyWith<$Res> {
  factory $ReviewCommentStateCopyWith(
          ReviewCommentState value, $Res Function(ReviewCommentState) then) =
      _$ReviewCommentStateCopyWithImpl<$Res, ReviewCommentState>;
  @useResult
  $Res call({String comment});
}

/// @nodoc
class _$ReviewCommentStateCopyWithImpl<$Res, $Val extends ReviewCommentState>
    implements $ReviewCommentStateCopyWith<$Res> {
  _$ReviewCommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_value.copyWith(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewCommentStateCopyWith<$Res>
    implements $ReviewCommentStateCopyWith<$Res> {
  factory _$$_ReviewCommentStateCopyWith(_$_ReviewCommentState value,
          $Res Function(_$_ReviewCommentState) then) =
      __$$_ReviewCommentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String comment});
}

/// @nodoc
class __$$_ReviewCommentStateCopyWithImpl<$Res>
    extends _$ReviewCommentStateCopyWithImpl<$Res, _$_ReviewCommentState>
    implements _$$_ReviewCommentStateCopyWith<$Res> {
  __$$_ReviewCommentStateCopyWithImpl(
      _$_ReviewCommentState _value, $Res Function(_$_ReviewCommentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
  }) {
    return _then(_$_ReviewCommentState(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReviewCommentState extends _ReviewCommentState {
  const _$_ReviewCommentState({this.comment = ''}) : super._();

  @override
  @JsonKey()
  final String comment;

  @override
  String toString() {
    return 'ReviewCommentState(comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewCommentState &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewCommentStateCopyWith<_$_ReviewCommentState> get copyWith =>
      __$$_ReviewCommentStateCopyWithImpl<_$_ReviewCommentState>(
          this, _$identity);
}

abstract class _ReviewCommentState extends ReviewCommentState {
  const factory _ReviewCommentState({final String comment}) =
      _$_ReviewCommentState;
  const _ReviewCommentState._() : super._();

  @override
  String get comment;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewCommentStateCopyWith<_$_ReviewCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}
