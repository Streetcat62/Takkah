import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/search_shop_in_map_state.dart';
import '../notifier/search_shop_in_map_notifier.dart';
import '../../../../../../core/di/dependency_manager.dart';

final searchShopInMapProvider =
    StateNotifierProvider<SearchShopInMapNotifier, SearchShopInMapState>(
  (ref) => SearchShopInMapNotifier(shopsRepository),
);
