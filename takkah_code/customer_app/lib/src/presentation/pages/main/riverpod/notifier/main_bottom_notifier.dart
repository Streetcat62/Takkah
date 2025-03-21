import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/main_bottom_state.dart';

class MainBottomNotifier extends StateNotifier<MainBottomState> {
  MainBottomNotifier() : super(const MainBottomState());

  void setVisible(bool value) {
    state = state.copyWith(isVisible: value);
  }
}
