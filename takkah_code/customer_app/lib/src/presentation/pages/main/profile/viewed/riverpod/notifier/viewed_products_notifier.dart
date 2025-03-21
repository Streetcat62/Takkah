import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../models/data/local_cart.dart';
import '../state/viewed_products_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class ViewedProductsNotifier extends StateNotifier<ViewedProductsState> {
  final ProductsRepository _productsRepository;
  final CartsRepository _cartsRepository;

  ViewedProductsNotifier(this._productsRepository, this._cartsRepository)
      : super(const ViewedProductsState());

  Future<void> decreaseProductCount({
    required ProductData product,
  }) async {
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            product.id, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    LocalStorage.instance.addProductQuantity(product.id ?? 0 , count - 1);
    state = state.copyWith(isLoading: state.isLoading);
    await _cartsRepository.saveProductToCart(
      shopId: product.shop?.id,
      productId: product.id,
      quantity: count - 1,
    );
  }

  Future<void> increaseProductCount({
    required ProductData product,
  }) async {
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            product.id, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    LocalStorage.instance.addProductQuantity(product.id ?? 0, count + 1);
    state = state.copyWith(isLoading: state.isLoading);
    await _cartsRepository.saveProductToCart(
      shopId: product.shop?.id,
      productId: product.id,
      quantity: count + 1,
    );
  }


  Future<void> fetchViewedProducts({
    int? shopId,
    CartData? cartData,
  }) async {
    final List<LocalProductData> products =
        LocalStorage.instance.getViewedProductsList();
    final List<LocalProductData> filteredLocalProducts = [];
    for (final product in products) {
      if (product.shopId == shopId) {
        filteredLocalProducts.add(product);
      }
    }
    if (filteredLocalProducts.isEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response =
        await _productsRepository.getProductsByIds(filteredLocalProducts);
    response.when(
      success: (data) {
        final List<ProductData> viewedProducts = data.data ?? [];
        final List<ProductData> filtered = [];
        for (final product in viewedProducts) {
          for (final localProduct in filteredLocalProducts) {
            if (product.id == localProduct.productId) {
              filtered.add(product);
            }
          }
        }
        for (int i = 0; i < filtered.length; i++) {
          final int cartCount =
          AppHelpers.getProductCartCount(cartData, filtered[i]);
          if (cartCount != 0) {
            filtered[i] = filtered[i].copyWith(
              cartCount: cartCount,
              localCartCount: cartCount,
            );
          }
        }
        state = state.copyWith(products: filtered, isLoading: false);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get viewed products failure: $fail');
      },
    );
  }

  updateState () {
    state = state.copyWith(isLoading: state.isLoading);
  }

  Future<void> likeOrUnlikeProduct({
    int? productId,
    int? shopId,
  }) async {
    final List<LocalProductData> likedProducts =
        LocalStorage.instance.getLikedProductsList();
    bool alreadyLiked = false;
    int indexLiked = 0;
    for (int i = 0; i < likedProducts.length; i++) {
      if (likedProducts[i].productId == productId) {
        alreadyLiked = true;
        indexLiked = i;
      }
    }
    if (alreadyLiked) {
      likedProducts.removeAt(indexLiked);
      LocalStorage.instance
          .setLikedProductsList(likedProducts.toSet().toList());
    } else {
      likedProducts.insert(
        0,
        LocalProductData(productId: productId ?? 0, shopId: shopId),
      );
      final setList = likedProducts.toSet().toList();
      final subList = setList.length > 16 ? setList.sublist(0, 16) : setList;
      LocalStorage.instance.setLikedProductsList(subList);
    }
    state = state.copyWith();
  }
}
