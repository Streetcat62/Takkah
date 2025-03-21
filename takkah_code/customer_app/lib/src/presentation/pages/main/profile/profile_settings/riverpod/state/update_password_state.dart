import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_password_state.freezed.dart';

@freezed
class UpdatePasswordState with _$UpdatePasswordState {
  const factory UpdatePasswordState({
    @Default(false) bool showNewPasswd,
    @Default(false) bool showConfirmPasswd,
    @Default(true) bool areTheSame,
    @Default(false) bool isSaving,
    @Default('') String newPassword,
    @Default('') String confirmPassword,
  }) = _UpdatePasswordState;

  const UpdatePasswordState._();
}
