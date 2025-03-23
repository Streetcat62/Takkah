import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_confirmation_state.freezed.dart';

@freezed
class RegisterConfirmationState with _$RegisterConfirmationState {
  const factory RegisterConfirmationState({
    @Default(false) bool isLoading,
    @Default(false) bool isResending,
    @Default(false) bool isTimeExpired,
    @Default(false) bool isCodeError,
    @Default(false) bool isConfirmEnabled,
    @Default('') String confirmCode,
    @Default('05:00') String timerText,
  }) = _RegisterConfirmationState;

  const RegisterConfirmationState._();
}