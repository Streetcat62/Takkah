import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';

import '../../infrastructure/models/models.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(false) bool isLoading,
    @Default([]) List<TypedExtra> typedExtras,
    @Default([]) List<int> selectedIndexes,
    @Default(0) int stockCount,
    ProductModel? productData,
    ProductModel? selectedProduct,
  }) = _ProductsState;

  const ProductsState._();
}
