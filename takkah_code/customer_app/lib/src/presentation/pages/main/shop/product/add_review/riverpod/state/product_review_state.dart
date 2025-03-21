import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_review_state.freezed.dart';

@freezed
class ProductReviewState with _$ProductReviewState {
  const factory ProductReviewState({@Default(false) bool isReviewing}) =
      _ProductReviewState;

  const ProductReviewState._();
}
