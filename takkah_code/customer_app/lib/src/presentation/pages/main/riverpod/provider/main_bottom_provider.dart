import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/main_bottom_state.dart';
import '../notifier/main_bottom_notifier.dart';

final mainBottomProvider =
    StateNotifierProvider<MainBottomNotifier, MainBottomState>(
  (ref) => MainBottomNotifier(),
);
