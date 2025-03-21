import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isLoading,
    @Default(false) bool showPassword,
    @Default(false) bool showConfirmPassword,
    @Default(false) bool isGoogleLoading,
    @Default(false) bool isFacebookLoading,
    @Default(false) bool isAppleLoading,
    @Default('') String birthdate,
  }) = _RegisterState;

  const RegisterState._();
}