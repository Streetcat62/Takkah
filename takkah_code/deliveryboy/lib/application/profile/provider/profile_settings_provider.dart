import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/profile_settings_state.dart';
import '../notifier/profile_settings_notifier.dart';
import '../../../../domain/di/dependency_manager.dart';

final profileSettingsProvider =
    StateNotifierProvider<ProfileSettingsNotifier, ProfileSettingsState>(
  (ref) => ProfileSettingsNotifier(userRepository),
);
