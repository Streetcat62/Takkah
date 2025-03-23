import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/enter_phone_state.dart';
import '../notifier/enter_phone_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final enterPhoneProvider =
    StateNotifierProvider<EnterPhoneNotifier, EnterPhoneState>(
  (ref) => EnterPhoneNotifier(authRepository, userRepository),
);
