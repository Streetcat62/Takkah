import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/view_on_map_state.dart';

class ViewOnMapNotifier extends StateNotifier<ViewOnMapState> {
  ViewOnMapNotifier() : super(const ViewOnMapState());

  void setChoosing(bool value) {
    state = state.copyWith(isChoosing: value);
  }
}
