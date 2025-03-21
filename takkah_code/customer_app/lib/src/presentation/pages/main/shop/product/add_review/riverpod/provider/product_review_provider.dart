import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/product_review_state.dart';
import '../notifier/product_review_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final productReviewProvider = StateNotifierProvider.autoDispose<
    ProductReviewNotifier, ProductReviewState>(
  (ref) => ProductReviewNotifier(productsRepository, settingsRepository),
);
