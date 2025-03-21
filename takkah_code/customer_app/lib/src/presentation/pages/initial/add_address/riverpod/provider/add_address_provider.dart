import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/add_address_state.dart';
import '../notifier/add_address_notifier.dart';

final addAddressProvider =
    StateNotifierProvider.autoDispose<AddAddressNotifier, AddAddressState>(
  (ref) => AddAddressNotifier(),
);
