import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_categories_state.dart';
import '../notifier/shop_categories_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final shopCategoriesProvider =
    StateNotifierProvider<ShopCategoriesNotifier, ShopCategoriesState>(
  (ref) => ShopCategoriesNotifier(catalogRepository),
);
