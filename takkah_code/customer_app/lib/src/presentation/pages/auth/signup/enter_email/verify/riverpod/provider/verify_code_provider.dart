import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/verify_code_state.dart';
import '../notifier/verify_code_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final verifyCodeProvider =
    StateNotifierProvider.autoDispose<VerifyCodeNotifier, VerifyCodeState>(
  (ref) => VerifyCodeNotifier(authRepository),
);
