import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/delivery_times_state.dart';

class DeliveryTimesNotifier extends StateNotifier<DeliveryTimesState> {
  DeliveryTimesNotifier()
      : super(DeliveryTimesState(selectedDateTime: DateTime.now()));

  void setSelectedDate(DateTime date) {
    state = state.copyWith(selectedDateTime: date);
  }
}
