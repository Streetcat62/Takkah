import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/chat_state.dart';
import '../notifier/chat_notifier.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>(
  (ref) => ChatNotifier(),
);
