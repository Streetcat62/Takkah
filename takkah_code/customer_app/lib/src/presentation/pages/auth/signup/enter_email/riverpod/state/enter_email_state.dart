import 'package:freezed_annotation/freezed_annotation.dart';

part 'enter_email_state.freezed.dart';

@freezed
class EnterEmailState with _$EnterEmailState {
  const factory EnterEmailState({
    @Default(false) bool isLoading,
    @Default(false) bool isGoogleLoading,
    @Default(false) bool isFacebookLoading,
    @Default(false) bool isAppleLoading,
    @Default(false) bool agreedToPrivacy,
  }) = _EnterEmailState;

  const EnterEmailState._();
}