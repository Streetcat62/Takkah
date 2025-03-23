import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/delete_user_state.dart';
import '../notifier/delete_user_notifier.dart';
import '../../../../../../core/di/dependency_manager.dart';

final deleteUserProvider =
    StateNotifierProvider<DeleteUserNotifier, DeleteUserState>(
  (ref) => DeleteUserNotifier(userRepository),
);
