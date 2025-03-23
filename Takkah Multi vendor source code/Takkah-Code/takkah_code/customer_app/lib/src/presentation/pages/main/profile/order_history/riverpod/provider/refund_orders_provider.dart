import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sundaymart/src/core/di/dependency_manager.dart';
import 'package:sundaymart/src/presentation/pages/main/profile/order_history/riverpod/notifier/refund_order_notifier.dart';
import 'package:sundaymart/src/presentation/pages/main/profile/order_history/riverpod/state/refund_order_state.dart';

final refundOrderProvider = StateNotifierProvider.autoDispose<
    RefundOrderNotifier , RefundOrdersState >(
        (ref) => RefundOrderNotifier(ordersRepository));