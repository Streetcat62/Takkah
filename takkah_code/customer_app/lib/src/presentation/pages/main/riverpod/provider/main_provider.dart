import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/main_state.dart';
import '../notifier/main_notifier.dart';

final mainProvider = StateNotifierProvider<MainNotifier, MainState>(
  (ref) => MainNotifier(),
);
