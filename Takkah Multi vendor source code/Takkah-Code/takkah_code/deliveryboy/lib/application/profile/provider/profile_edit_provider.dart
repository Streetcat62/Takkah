import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/profile_edit_state.dart';
import '../notifier/profile_edit_notifier.dart';
import '../../../../domain/di/dependency_manager.dart';

final profileEditProvider =
    StateNotifierProvider<ProfileEditNotifier, ProfileEditState>(
  (ref) => ProfileEditNotifier(userRepository, settingsRepository),
);
