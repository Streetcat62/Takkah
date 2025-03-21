import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/login_state.dart';
import '../notifier/login_notifier.dart';
import '../../../../../../core/di/dependency_manager.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(authRepository, userRepository),
);
