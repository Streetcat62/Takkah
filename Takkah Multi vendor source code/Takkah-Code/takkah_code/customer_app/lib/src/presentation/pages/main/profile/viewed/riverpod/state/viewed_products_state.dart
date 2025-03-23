import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'viewed_products_state.freezed.dart';

@freezed
class ViewedProductsState with _$ViewedProductsState {
  const factory ViewedProductsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _ViewedProductsState;

  const ViewedProductsState._();
}
