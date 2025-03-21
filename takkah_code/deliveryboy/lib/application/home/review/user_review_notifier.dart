import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_review_state.dart';
import '../../../domain/interface/interfaces.dart';
import '../../../infrastructure/services/services.dart';

class UserReviewNotifier extends StateNotifier<UserReviewState> {
  final UserRepository _userRepository;

  UserReviewNotifier(this._userRepository) : super(const UserReviewState());

  Future<void> addReview(
    BuildContext context, {
    String? comment,
    double? rating,
    int? orderId,
    VoidCallback? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.addReview(orderId ?? 0,
          rating: rating ?? 0, comment: comment);
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false);
          success?.call();
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
