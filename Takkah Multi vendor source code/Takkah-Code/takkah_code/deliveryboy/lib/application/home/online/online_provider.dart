import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/di/dependency_manager.dart';
import 'online_notifier.dart';
import 'online_state.dart';

final onlineProvider = StateNotifierProvider<OnlineNotifier, OnlineState>(
  (ref) => OnlineNotifier(userRepository),
);
