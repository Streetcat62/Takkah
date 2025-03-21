import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/become_seller_state.dart';
import '../notifier/become_seller_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final becomeSellerProvider =
    StateNotifierProvider.autoDispose<BecomeSellerNotifier, BecomeSellerState>(
  (ref) => BecomeSellerNotifier(settingsRepository, shopsRepository),
);
