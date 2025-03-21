import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/app_state.dart';
import '../notifier/app_notifier.dart';

final appProvider = StateNotifierProvider<AppNotifier, AppState>(
      (ref) => AppNotifier(),
);
