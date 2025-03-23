import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'category_products_state.freezed.dart';

@freezed
class CategoryProductsState with _$CategoryProductsState {
  const factory CategoryProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(true) bool hasMore,
    @Default([]) List<ProductData> products,
  }) = _CategoryProductsState;

  const CategoryProductsState._();
}
