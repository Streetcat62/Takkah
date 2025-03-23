import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/register_state.dart';
import '../notifier/register_notifier.dart';
import '../../../../../../../../../core/di/dependency_manager.dart';

final registerProvider =
    StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>(
  (ref) => RegisterNotifier(authRepository, userRepository),
);
