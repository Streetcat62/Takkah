import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_edit_state.freezed.dart';

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
    @Default(false) bool isLoading,
    @Default(true) bool isEmailEditable,
    @Default(true) bool isPhoneEditable,
    @Default('') String firstname,
    @Default('') String lastname,
    @Default('') String phone,
    @Default('') String email,
    @Default('') String birthday,
    @Default('') String male,
  }) = _ProfileEditState;

  const ProfileEditState._();
}
