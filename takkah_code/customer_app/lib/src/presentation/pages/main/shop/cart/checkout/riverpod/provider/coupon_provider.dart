import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/coupon_state.dart';
import '../notifier/coupon_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final couponProvider = StateNotifierProvider<CouponNotifier, CouponState>(
  (ref) => CouponNotifier(cartRepository),
);
