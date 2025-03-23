import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../models/data/local_cart.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';
import '../state/search_product_in_category_details_state.dart';

class SearchProductInCategoryDetailsNotifier
    extends StateNotifier<SearchProductInCategoryDetailsState> {
  final ProductsRepository _productsRepository;
  final CartsRepository _cartsRepository;
  Timer? _timer;

  SearchProductInCategoryDetailsNotifier(
    this._productsRepository,
    this._cartsRepository,
  ) : super(const SearchProductInCategoryDetailsState());

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
    state = state.copyWith(searchedProducts: state.searchedProducts);
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
    state = state.copyWith(searchedProducts: state.searchedProducts);
    await _cartsRepository.saveProductToCart(
      shopId: product.shop?.id,
      productId: product.id,
      quantity: count + 1,
    );
  }

  Future<void> likeOrUnlikeProduct({int? productId, int? shopId}) async {
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

  void setQuery(String query, {CartData? cartData, int? shopId}) {
    if (state.query == query) {
      return;
    }
    state = state.copyWith(query: query.trim());
    if (state.query.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          searchProducts(cartData: cartData, shopId: shopId);
        },
      );
    } else {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          state = state.copyWith(isSearching: false);
        },
      );
    }
  }

  Future<void> searchProducts({CartData? cartData, int? shopId}) async {
    state = state.copyWith(isSearchLoading: true, isSearching: true);
    final response = await _productsRepository.searchProducts(
      query: state.query,
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
        state =
            state.copyWith(isSearchLoading: false, searchedProducts: products);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isSearchLoading: false);
        debugPrint('==> search products failure: $fail');
      },
    );
  }
}
