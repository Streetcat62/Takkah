import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    @Default(false) bool isLoading,
    ProductData? productData,
  }) = _ProductState;

  const ProductState._();
}
