import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_groups_in_delivery_state.dart';
import '../../../../../../core/di/dependency_manager.dart';
import '../notifier/shop_groups_in_delivery_notifier.dart';

final shopGroupsInDeliveryProvider = StateNotifierProvider<
    ShopGroupsInDeliveryNotifier, ShopGroupsInDeliveryState>(
  (ref) => ShopGroupsInDeliveryNotifier(shopsRepository),
);
