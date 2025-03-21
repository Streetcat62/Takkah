import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/delivery_times_state.dart';
import '../notifier/delivery_times_notifier.dart';

final deliveryTimesProvider =
    StateNotifierProvider<DeliveryTimesNotifier, DeliveryTimesState>(
  (ref) => DeliveryTimesNotifier(),
);
