import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/enter_email_state.dart';
import '../notifier/enter_email_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final enterEmailProvider =
    StateNotifierProvider<EnterEmailNotifier, EnterEmailState>(
  (ref) => EnterEmailNotifier(authRepository, userRepository),
);
