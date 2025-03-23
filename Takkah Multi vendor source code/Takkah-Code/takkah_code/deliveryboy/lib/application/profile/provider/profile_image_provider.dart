import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/profile_image_state.dart';
import '../notifier/profile_image_notifier.dart';
import '../../../../domain/di/dependency_manager.dart';

final profileImageProvider =
    StateNotifierProvider<ProfileImageNotifier, ProfileImageState>(
  (ref) => ProfileImageNotifier(userRepository, settingsRepository),
);
