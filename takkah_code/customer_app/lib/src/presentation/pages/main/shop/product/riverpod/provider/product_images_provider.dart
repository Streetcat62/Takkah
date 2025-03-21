import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/product_images_state.dart';
import '../notifier/product_images_notifier.dart';

final productImagesProvider =
    StateNotifierProvider<ProductImagesNotifier, ProductImagesState>(
  (ref) => ProductImagesNotifier(),
);
