import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_groups_in_view_map_state.dart';
import '../notifier/shop_groups_in_view_map_notifier.dart';

final shopGroupsInViewMapProvider = StateNotifierProvider<
    ShopGroupsInViewMapNotifier, ShopGroupsInViewMapState>(
  (ref) => ShopGroupsInViewMapNotifier(),
);
