import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../models/data/local_cart.dart';
import '../state/category_details_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';

class CategoryDetailsNotifier extends StateNotifier<CategoryDetailsState> {
  final ProductsRepository _productsRepository;
  final CartsRepository _cartsRepository;
  int _page = 0;

  CategoryDetailsNotifier(this._productsRepository, this._cartsRepository)
      : super(const CategoryDetailsState());


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

  void likeOrUnlikeProduct({int? productId, int? shopId}) {
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

  Future<void> fetchCategoryProducts({
    int? categoryId,
    int? shopId,
    CartData? cartData,
  }) async {
    if (!state.hasMore) {
      return;
    }
    if (_page == 0) {
      state = state.copyWith(isLoading: true);
      final response = await _productsRepository.getProductsPaginate(
        page: ++_page,
        categoryId: categoryId,
        shopId: shopId,
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
            products: products,
            hasMore: products.length >= 10,
          );
        },
        failure: (fail, errorData) {
          _page--;
          state = state.copyWith(isLoading: false, hasMore: false);
          debugPrint('==> get category products failure: $fail');
        },
      );
    } else {
      state = state.copyWith(isMoreLoading: true);
      final response = await _productsRepository.getProductsPaginate(
        page: ++_page,
        categoryId: categoryId,
        shopId: shopId,
      );
      response.when(
        success: (data) {
          final List<ProductData> products = List.from(state.products);
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
            products: products,
            hasMore: newList.length >= 10,
          );
        },
        failure: (fail, errorData) {
          _page--;
          state = state.copyWith(isMoreLoading: false);
          debugPrint('==> get category products failure: $fail');
        },
      );
    }
  }

  Future<void> updateCategoryProducts({
    int? categoryId,
    int? shopId,
    CartData? cartData,
  }) async {
    _page = 0;
    state = state.copyWith(hasMore: true);
    fetchCategoryProducts(
      categoryId: categoryId,
      shopId: shopId,
      cartData: cartData,
    );
  }
}
