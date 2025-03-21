import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/liked_products_state.dart';
import '../notifier/liked_products_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final likedProductsProvider = StateNotifierProvider.autoDispose<
    LikedProductsNotifier, LikedProductsState>(
  (ref) => LikedProductsNotifier(productsRepository, cartRepository),
);
