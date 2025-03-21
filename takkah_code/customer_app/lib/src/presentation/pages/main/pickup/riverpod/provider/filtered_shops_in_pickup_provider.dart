import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/filtered_shops_in_pickup_state.dart';
import '../../../../../../core/di/dependency_manager.dart';
import '../notifier/filtered_shops_in_pickup_notifier.dart';

final filteredShopsInPickupProvider = StateNotifierProvider<
    FilteredShopsInPickupNotifier, FilteredShopsInPickupState>(
  (ref) => FilteredShopsInPickupNotifier(shopsRepository),
);
