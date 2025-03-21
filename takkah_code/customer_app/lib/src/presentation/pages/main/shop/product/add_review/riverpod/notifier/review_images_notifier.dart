import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/review_images_state.dart';

class ReviewImagesNotifier extends StateNotifier<ReviewImagesState> {
  ReviewImagesNotifier() : super(const ReviewImagesState());

  void addReviewFile(String path) {
    List<String> imagePaths = List.from(state.reviewImages);
    imagePaths.add(path);
    state = state.copyWith(reviewImages: imagePaths);
  }

  void removeImage(int index) {
    List<String> imagePaths = List.from(state.reviewImages);
    imagePaths.removeAt(index);
    state = state.copyWith(reviewImages: imagePaths);
  }
}
