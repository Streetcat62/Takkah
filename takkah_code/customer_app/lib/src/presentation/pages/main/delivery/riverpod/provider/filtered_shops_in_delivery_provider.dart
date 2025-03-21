import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/filtered_shops_in_delivery_state.dart';
import '../../../../../../core/di/dependency_manager.dart';
import '../notifier/filtered_shops_in_delivery_notifier.dart';

final filteredShopsInDeliveryProvider = StateNotifierProvider<
    FilteredShopsInDeliveryNotifier, FilteredShopsInDeliveryState>(
  (ref) => FilteredShopsInDeliveryNotifier(shopsRepository),
);
