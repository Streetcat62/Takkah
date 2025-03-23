import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/main_shop_search_state.dart';
import '../notifier/main_shop_search_notifier.dart';
import '../../../../../core/di/dependency_manager.dart';

final mainShopSearchProvider =
    StateNotifierProvider<MainShopSearchNotifier, MainShopSearchState>(
  (ref) => MainShopSearchNotifier(shopsRepository),
);
