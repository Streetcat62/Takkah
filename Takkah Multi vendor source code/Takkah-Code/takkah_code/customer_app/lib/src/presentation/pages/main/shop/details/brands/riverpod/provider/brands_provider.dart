import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/brands_state.dart';
import '../notifier/brands_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final brandsProvider = StateNotifierProvider<BrandsNotifier, BrandsState>(
  (ref) => BrandsNotifier(catalogRepository),
);
