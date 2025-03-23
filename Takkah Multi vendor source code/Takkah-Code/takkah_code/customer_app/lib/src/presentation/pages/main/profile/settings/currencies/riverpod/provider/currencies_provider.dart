import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/currencies_state.dart';
import '../notifier/currencies_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final currenciesProvider =
    StateNotifierProvider.autoDispose<CurrenciesNotifier, CurrenciesState>(
  (ref) => CurrenciesNotifier(settingsRepository),
);
