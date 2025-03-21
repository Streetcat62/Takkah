import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_state.dart';
import 'home_notifier.dart';
import '../../domain/di/dependency_manager.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(drawRepository, userRepository),
);
