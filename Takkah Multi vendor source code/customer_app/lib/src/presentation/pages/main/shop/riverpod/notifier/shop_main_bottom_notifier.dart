import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_main_bottom_state.dart';

class ShopMainBottomNotifier extends StateNotifier<ShopMainBottomState> {
  ShopMainBottomNotifier() : super(const ShopMainBottomState());

  void setVisible(bool value) {
    state = state.copyWith(isVisible: value);
  }
}
