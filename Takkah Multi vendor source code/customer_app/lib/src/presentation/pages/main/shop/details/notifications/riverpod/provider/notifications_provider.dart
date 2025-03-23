import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/notifications_state.dart';
import '../notifier/notifications_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final notificationsProvider = StateNotifierProvider.autoDispose<
    NotificationsNotifier, NotificationsState>(
  (ref) => NotificationsNotifier(catalogRepository),
);
