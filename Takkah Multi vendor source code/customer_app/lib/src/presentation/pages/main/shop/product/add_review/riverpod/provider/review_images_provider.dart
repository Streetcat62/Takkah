import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/review_images_state.dart';
import '../notifier/review_images_notifier.dart';

final reviewImagesProvider =
    StateNotifierProvider.autoDispose<ReviewImagesNotifier, ReviewImagesState>(
  (ref) => ReviewImagesNotifier(),
);
