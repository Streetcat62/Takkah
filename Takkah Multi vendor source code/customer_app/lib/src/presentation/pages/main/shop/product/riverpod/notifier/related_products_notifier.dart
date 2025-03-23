import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../models/data/local_cart.dart';
import '../state/related_products_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class RelatedProductsNotifier extends StateNotifier<RelatedProductsState> {
  final ProductsRepository _productsRepository;
  final CartsRepository _cartsRepository;
  int? _activeProductIndex;
  Timer? _timer;

  RelatedProductsNotifier(this._productsRepository, this._cartsRepository)
      : super(const RelatedProductsState()) {
    _activeProductIndex = null;
  }

  Future<void> decreaseProductCount(int productIndex) async {
    final ProductData product = state.relatedProducts[productIndex];
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

  Future<void> increaseProductCount(int productIndex) async {
    final ProductData product = state.relatedProducts[productIndex];
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

  void _updateLoadingProduct(bool value, {int? productIndex}) {
    final List<ProductData> products = List.from(state.relatedProducts);
    products[productIndex!] = products[productIndex].copyWith(isLoading: value);
    state = state.copyWith(relatedProducts: products);
  }

  Future<void> _updateRemoteCart({int? productIndex}) async {
    if (productIndex == null) {
      return;
    }
    final ProductData product = state.relatedProducts[productIndex];
    if (product.localCartCount == null || product.localCartCount == 0) {
      return;
    }
    _updateLoadingProduct(true, productIndex: productIndex);
    final response = await _cartsRepository.saveProductToCart(
      shopId: product.shopId,
      productId: product.id,
      quantity: product.localCartCount,
    );
    response.when(
      success: (data) {
        _updateLoadingProduct(false, productIndex: productIndex);
      },
      failure: (fail, errorData) {
        debugPrint('==> save to cart failure: $fail');
        _updateLoadingProduct(false, productIndex: productIndex);
      },
    );
  }

  void updateChoosing({required int productIndex}) {
    List<ProductData> related = List.from(state.relatedProducts);
    // for (int i = 0; i < related.length; i++) {
    //   related[i] = related[i].copyWith(isChoosing: false);
    // }
    _timer?.cancel();
    // related[productIndex] = related[productIndex].copyWith(isChoosing: true);
    state = state.copyWith(relatedProducts: related);
    _updateRemoteCart(productIndex: _activeProductIndex);
    _activeProductIndex = productIndex;
    _timer = Timer(
      const Duration(milliseconds: 400),
      () {
        // related[productIndex] =
        //     related[productIndex].copyWith(isChoosing: false);
        state = state.copyWith(relatedProducts: related);
        _updateRemoteCart(productIndex: _activeProductIndex);
        _activeProductIndex = null;
      },
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

  Future<void> fetchRelatedProducts({
    int? shopId,
    int? productId,
    int? categoryId,
    int? brandId,
    CartData? cartData,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.searchProducts(
      shopId: shopId,
      categoryId: categoryId,
      brandId: brandId,
    );
    response.when(
      success: (data) {
        final List<ProductData> filtered = [];
        for (final related in (data.data ?? [])) {
          if (related.id == productId) {
            continue;
          }
          filtered.add(related);
        }
        for (int i = 0; i < filtered.length; i++) {
          final int cartCount = AppHelpers.getProductCartCount(
            cartData,
            filtered[i],
          );
          if (cartCount != 0) {
            filtered[i] = filtered[i].copyWith(
              cartCount: cartCount,
              localCartCount: cartCount,
            );
          }
        }
        state = state.copyWith(relatedProducts: filtered, isLoading: false);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get related products failure: $fail');
      },
    );
  }
}
