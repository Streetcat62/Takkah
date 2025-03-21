import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_review_state.dart';
import 'user_review_notifier.dart';
import '../../../domain/di/dependency_manager.dart';

final userReviewProvider =
    StateNotifierProvider.autoDispose<UserReviewNotifier, UserReviewState>(
  (ref) => UserReviewNotifier(userRepository),
);
