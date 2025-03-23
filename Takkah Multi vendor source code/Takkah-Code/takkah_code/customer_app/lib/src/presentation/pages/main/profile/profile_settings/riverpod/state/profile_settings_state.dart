import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'profile_settings_state.freezed.dart';

@freezed
class ProfileSettingsState with _$ProfileSettingsState {
  const factory ProfileSettingsState({
    @Default(false) bool isLoading,
    UserData? userData,
  }) = _ProfileSettingsState;

  const ProfileSettingsState._();
}
