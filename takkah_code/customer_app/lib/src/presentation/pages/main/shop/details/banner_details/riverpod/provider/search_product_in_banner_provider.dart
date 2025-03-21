import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/search_product_in_banner_state.dart';
import '../notifier/search_product_in_banner_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final searchProductInBannerProvider = StateNotifierProvider<
    SearchProductInBannerNotifier, SearchProductInBannerState>(
  (ref) => SearchProductInBannerNotifier(productsRepository,cartRepository),
);
