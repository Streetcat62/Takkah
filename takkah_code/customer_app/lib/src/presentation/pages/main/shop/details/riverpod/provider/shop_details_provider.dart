import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_details_state.dart';
import '../notifier/shop_details_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final shopDetailsProvider =
    StateNotifierProvider<ShopDetailsNotifier, ShopDetailsState>(
  (ref) => ShopDetailsNotifier(shopsRepository),
);
