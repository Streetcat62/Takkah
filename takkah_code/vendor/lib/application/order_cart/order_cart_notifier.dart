import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';

import 'order_cart_state.dart';

class OrderCartNotifier extends StateNotifier<OrderCartState> {
  OrderCartNotifier() : super(const OrderCartState());

  void deleteStockFromCart({
    required ProductModel product,
    Function(List<ProductModel>)? updateProducts,
  }) {
    List<ProductModel> products = List.from(state.products);
    products.remove(product);
    products = products.toSet().toList();
    num sum = 0;
    for (final stock in products) {
      sum += (stock.price ?? 0) * (stock.cartCount ?? 0);
    }
    state = state.copyWith(products: products, totalPrice: sum);
    if (updateProducts != null) {
      updateProducts(products);
    }
  }

  void clearAll() {
    state = state.copyWith(products: []);
  }

  void addStockToCart({
    required int count,
    ProductModel? product,
    Function(List<ProductModel>)? updateProducts,
  }) {
    debugPrint('===> add stock to cart count $count');
    debugPrint(
        '===> add stock to cart product ${product?.product?.translation?.title}');

    List<ProductModel> stocks = List.from(state.products);
    int? index;
    for (int i = 0; i < stocks.length; i++) {
      if (stocks[i].id == product?.id) {
        index = i;
        break;
      }
    }
    if (index != null) {
      if (count == 0) {
        stocks.removeAt(index);
      } else {
        stocks[index] = stocks[index].copyWith(cartCount: count);
      }
    } else {
      product = product?.copyWith(product: product.product, cartCount: count);
      if (product != null) {
        stocks.insert(0, product);
      }
    }
    stocks = stocks.toSet().toList();
    num sum = 0;
    for (final stock in stocks) {
      sum += (stock.price ?? 0) * (stock.cartCount ?? 0);
    }
    state = state.copyWith(products: stocks, totalPrice: sum, cartCount: count);
    if (updateProducts != null) {
      updateProducts(stocks);
    }
  }

  refreshStockCart() {
    state = state.copyWith(cartCount: 0);
  }
}
