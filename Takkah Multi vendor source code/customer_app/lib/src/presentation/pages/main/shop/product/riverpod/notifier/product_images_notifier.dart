import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/product_images_state.dart';

class ProductImagesNotifier extends StateNotifier<ProductImagesState> {
  ProductImagesNotifier() : super(const ProductImagesState());

  void setActiveImageIndex(int imageIndex) {
    state = state.copyWith(activeImageIndex: imageIndex);
  }
}
