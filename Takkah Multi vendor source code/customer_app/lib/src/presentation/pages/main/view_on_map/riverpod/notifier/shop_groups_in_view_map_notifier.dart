import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_groups_in_view_map_state.dart';

class ShopGroupsInViewMapNotifier
    extends StateNotifier<ShopGroupsInViewMapState> {
  ShopGroupsInViewMapNotifier() : super(const ShopGroupsInViewMapState());

  void setActiveIndex(int index) {
    state = state.copyWith(activeGroupIndex: index);
  }
}
