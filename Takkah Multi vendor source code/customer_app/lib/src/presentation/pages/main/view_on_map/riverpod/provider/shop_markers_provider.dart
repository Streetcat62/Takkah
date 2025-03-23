import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_markers_state.dart';
import '../notifier/shop_markers_notifier.dart';

final shopMarkersProvider =
    StateNotifierProvider<ShopMarkersNotifier, ShopMarkersState>(
  (ref) => ShopMarkersNotifier(),
);
