import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_review_state.freezed.dart';

@freezed
class UserReviewState with _$UserReviewState {
  const factory UserReviewState({@Default(false) bool isLoading}) =
      _UserReviewState;

  const UserReviewState._();
}
