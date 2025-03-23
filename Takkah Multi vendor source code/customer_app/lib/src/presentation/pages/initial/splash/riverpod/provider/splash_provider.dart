import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/splash_state.dart';
import '../notifier/splash_notifier.dart';
import '../../../../../../core/di/dependency_manager.dart';

final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>(
  (ref) => SplashNotifier(settingsRepository, userRepository),
);
