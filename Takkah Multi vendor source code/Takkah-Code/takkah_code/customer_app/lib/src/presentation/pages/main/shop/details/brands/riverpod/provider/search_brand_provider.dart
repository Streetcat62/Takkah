import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/search_brand_state.dart';
import '../notifier/search_brand_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final searchBrandProvider =
    StateNotifierProvider<SearchBrandNotifier, SearchBrandState>(
  (ref) => SearchBrandNotifier(catalogRepository),
);
