import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_brands_state.dart';
import '../notifier/shop_brands_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final shopBrandsProvider =
    StateNotifierProvider<ShopBrandsNotifier, ShopBrandsState>(
  (ref) => ShopBrandsNotifier(catalogRepository),
);
