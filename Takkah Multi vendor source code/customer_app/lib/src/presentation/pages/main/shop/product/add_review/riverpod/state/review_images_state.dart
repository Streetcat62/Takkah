import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_images_state.freezed.dart';

@freezed
class ReviewImagesState with _$ReviewImagesState {
  const factory ReviewImagesState({
    @Default([]) List<String> reviewImages,
  }) = _ReviewImagesState;

  const ReviewImagesState._();
}
