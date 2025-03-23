import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/checkout_state.dart';

class CheckoutNotifier extends StateNotifier<CheckoutState> {
  CheckoutNotifier() : super(const CheckoutState());

  void setActiveTab(int page) {
    state = state.copyWith(activeTab: page);
  }
}
