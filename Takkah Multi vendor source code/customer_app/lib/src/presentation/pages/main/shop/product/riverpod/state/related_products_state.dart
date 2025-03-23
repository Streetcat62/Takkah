import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'related_products_state.freezed.dart';

@freezed
class RelatedProductsState with _$RelatedProductsState {
  const factory RelatedProductsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> relatedProducts,
  }) = _RelatedProductsState;

  const RelatedProductsState._();
}
