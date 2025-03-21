import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/review_comment_state.dart';

class ReviewCommentNotifier extends StateNotifier<ReviewCommentState> {
  ReviewCommentNotifier() : super(const ReviewCommentState());

  void setComment(String value) {
    state = state.copyWith(comment: value.trim());
  }
}
