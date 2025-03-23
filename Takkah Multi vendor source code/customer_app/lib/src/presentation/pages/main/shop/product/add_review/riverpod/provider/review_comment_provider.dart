import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/review_comment_state.dart';
import '../notifier/review_comment_notifier.dart';

final reviewCommentProvider = StateNotifierProvider.autoDispose<
    ReviewCommentNotifier, ReviewCommentState>(
  (ref) => ReviewCommentNotifier(),
);
