import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_main_bottom_state.dart';
import '../notifier/shop_main_bottom_notifier.dart';

final shopMainBottomProvider =
    StateNotifierProvider<ShopMainBottomNotifier, ShopMainBottomState>(
  (ref) => ShopMainBottomNotifier(),
);
