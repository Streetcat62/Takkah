import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/banner_products_state.dart';
import '../notifier/banner_products_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final bannerProductsProvider =
    StateNotifierProvider<BannerProductsNotifier, BannerProductsState>(
  (ref) => BannerProductsNotifier(shopsRepository, cartRepository),
);
