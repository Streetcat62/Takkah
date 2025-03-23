import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/main_product_search_state.dart';
import '../notifier/main_product_search_notifier.dart';
import '../../../../../core/di/dependency_manager.dart';

final mainProductSearchProvider =
    StateNotifierProvider<MainProductSearchNotifier, MainProductSearchState>(
  (ref) => MainProductSearchNotifier(productsRepository),
);
