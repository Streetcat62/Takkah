import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';
import 'products_state.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  ProductsNotifier() : super(const ProductsState());

  Future<void> setProductDetails({
    required ProductModel product,
    required List<ProductModel> productStocks,
  }) async {
    int count = product.cartCount ?? 0;

    state = state.copyWith(
      productData: product.copyWith(cartCount: count),
      selectedProduct: null,
      stockCount: 0,
    );
  }

  void increaseStockCount({required Function(int) updateCart}) {
    if ((state.productData?.quantity ?? 0) < (state.productData?.minQty ?? 0)) {
      return;
    }
    int newCount = state.stockCount;
    if (newCount >= (state.productData?.maxQty ?? 100000) ||
        newCount >= (state.productData?.quantity ?? 100000)) {
      return;
    }
    if (newCount < (state.productData?.minQty ?? 0)) {
      newCount = state.productData?.minQty ?? 1;
    } else {
      newCount = newCount + 1;
    }
    state = state.copyWith(stockCount: newCount);
    updateCart(newCount);
  }

  void decreaseStockCount({required Function(int) updateCart}) {
    int newCount = state.stockCount;
    if (newCount < 1) {
      return;
    }
    if (newCount <= (state.productData?.minQty ?? 0)) {
      newCount = 0;
    } else {
      newCount = newCount - 1;
    }
    state = state.copyWith(stockCount: newCount);
    updateCart(newCount);
  }
}
