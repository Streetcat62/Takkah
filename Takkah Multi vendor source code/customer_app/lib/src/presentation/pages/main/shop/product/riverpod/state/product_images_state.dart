import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_images_state.freezed.dart';

@freezed
class ProductImagesState with _$ProductImagesState {
  const factory ProductImagesState({@Default(0) int activeImageIndex}) =
      _ProductImagesState;

  const ProductImagesState._();
}
