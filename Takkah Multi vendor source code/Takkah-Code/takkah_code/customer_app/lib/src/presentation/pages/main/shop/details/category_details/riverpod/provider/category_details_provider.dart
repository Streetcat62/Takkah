import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/category_details_state.dart';
import '../notifier/category_details_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final categoryDetailsProvider =
    StateNotifierProvider<CategoryDetailsNotifier, CategoryDetailsState>(
  (ref) => CategoryDetailsNotifier(productsRepository, cartRepository),
);
