import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/view_on_map_state.dart';
import '../notifier/view_on_map_notifier.dart';

final viewOnMapProvider =
    StateNotifierProvider<ViewOnMapNotifier, ViewOnMapState>(
  (ref) => ViewOnMapNotifier(),
);
