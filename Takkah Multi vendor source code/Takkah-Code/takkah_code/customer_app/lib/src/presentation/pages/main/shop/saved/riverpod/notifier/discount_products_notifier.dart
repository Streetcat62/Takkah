import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../models/data/local_cart.dart';
import '../state/discount_products_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class DiscountProductsNotifier extends StateNotifier<DiscountProductsState> {
  final ProductsRepository _productsRepository;
  final CartsRepository _cartsRepository;
  int _page = 0;

  DiscountProductsNotifier(this._productsRepository, this._cartsRepository)
      : super(const DiscountProductsState());

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

  updateState () {
    state = state.copyWith(isLoading: state.isLoading);
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

  Future<void> fetchDiscountProducts({
    int? shopId,
    CartData? cartData,
  }) async {
    if (!state.hasMore) {
      return;
    }
    if (_page == 0) {
      state = state.copyWith(isLoading: true);
      final response = await _productsRepository.getDiscountProducts(
        shopId: shopId,
        page: ++_page,
      );
      response.when(
        success: (data) {
          final List<ProductData> products = data.data ?? [];
          for (int i = 0; i < products.length; i++) {
            final int cartCount =
                AppHelpers.getProductCartCount(cartData, products[i]);
            if (cartCount != 0) {
              products[i] = products[i].copyWith(
                cartCount: cartCount,
                localCartCount: cartCount,
              );
            }
          }
          state = state.copyWith(
            isLoading: false,
            discountProducts: products,
            hasMore: products.length >= 14,
          );
        },
        failure: (fail, errorData) {
          _page--;
          state = state.copyWith(isLoading: false);
          debugPrint('==> get discount products failure: $fail');
        },
      );
    } else {
      state = state.copyWith(isMoreLoading: true);
      final response = await _productsRepository.getDiscountProducts(
        shopId: shopId,
        page: ++_page,
      );
      response.when(
        success: (data) {
          final List<ProductData> products = List.from(state.discountProducts);
          final List<ProductData> newList = data.data ?? [];
          products.addAll(newList);
          for (int i = 0; i < products.length; i++) {
            final int cartCount =
                AppHelpers.getProductCartCount(cartData, products[i]);
            if (cartCount != 0) {
              products[i] = products[i].copyWith(
                cartCount: cartCount,
                localCartCount: cartCount,
              );
            }
          }
          state = state.copyWith(
            isMoreLoading: false,
            discountProducts: products,
            hasMore: newList.length >= 14,
          );
        },
        failure: (fail, errorData) {
          _page--;
          state = state.copyWith(isLoading: false);
          debugPrint('==> get discount products failure: $fail');
        },
      );
    }
  }

  Future<void> updateDiscountProducts({int? shopId, CartData? cartData}) async {
    _page = 0;
    state = state.copyWith(hasMore: true, discountProducts: []);
    fetchDiscountProducts(shopId: shopId, cartData: cartData);
  }
}
