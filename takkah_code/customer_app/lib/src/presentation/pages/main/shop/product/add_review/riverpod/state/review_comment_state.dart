import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_comment_state.freezed.dart';

@freezed
class ReviewCommentState with _$ReviewCommentState {
  const factory ReviewCommentState({@Default('') String comment}) =
      _ReviewCommentState;

  const ReviewCommentState._();
}
