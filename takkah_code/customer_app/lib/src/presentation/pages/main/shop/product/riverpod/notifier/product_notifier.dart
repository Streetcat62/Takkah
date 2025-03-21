import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../models/data/local_cart.dart';
import '../state/product_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductsRepository _productsRepository;
  final CartsRepository _cartsRepository;

  ProductNotifier(this._productsRepository, this._cartsRepository)
      : super(const ProductState());

  void updateProductCartCount({CartData? cartData}) {
    final int localCartCount =
        AppHelpers.getProductCartCount(cartData, state.productData);
    state = state.copyWith(
      productData: state.productData?.copyWith(localCartCount: localCartCount),
    );
  }

  Future<void> saveToCart({Function(CartData?)? onCartUpdate, required int quantity}) async {
    final result = await _cartsRepository.saveProductToCart(
      shopId: state.productData?.shopId,
      productId: state.productData?.id,
      quantity: quantity,
    );
    result.when(
      success: (data) {
        if (onCartUpdate != null) {
          onCartUpdate(data.data);
        }
      },
      failure: (fail, errorData) {
        debugPrint('===> save to cart failure $fail');
      },
    );
  }

  void increaseCartCount(int productId, int maxQty)  {
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productId, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    if (count >= (maxQty)) {
      return;
    }
    LocalStorage.instance.addProductQuantity(productId, count + 1);
    state = state.copyWith(isLoading: state.isLoading);
    saveToCart(quantity: count + 1);
  }

  void decreaseCartCount(int productId)  {
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productId, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    LocalStorage.instance.addProductQuantity(productId , count - 1);
    state = state.copyWith(isLoading: state.isLoading);
     saveToCart(quantity: count - 1);
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

  void updateState () {
    state = state.copyWith(isLoading: state.isLoading);
  }

  Future<void> fetchProductDetails({
    String? uuid,
    VoidCallback? checkYourNetwork,
    VoidCallback? fetchingFailed,
    int? shopId,
    CartData? cartData,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _productsRepository.getProductDetails(uuid: uuid);
      response.when(
        success: (data) {
          ProductData? product = data.data;
          final int cartCount =
              AppHelpers.getProductCartCount(cartData, product);
          if (cartCount != 0) {
            product = product?.copyWith(
              cartCount: cartCount,
              localCartCount: cartCount,
            );
          }
          state = state.copyWith(isLoading: false, productData: product);
          final List<LocalProductData> products =
              LocalStorage.instance.getViewedProductsList();
          bool alreadyViewed = false;
          int indexViewed = 0;
          for (int i = 0; i < products.length; i++) {
            if (products[i].productId == product?.id) {
              alreadyViewed = true;
              indexViewed = i;
            }
          }
          if (alreadyViewed) {
            products.removeAt(indexViewed);
          }
          products.insert(
            0,
            LocalProductData(productId: product?.id ?? 0, shopId: shopId),
          );
          final setList = products.toSet().toList();
          final subList =
              setList.length > 16 ? setList.sublist(0, 16) : setList;
          LocalStorage.instance.setViewedProductsList(subList);
        },
        failure: (fail, errorData) {
          fetchingFailed?.call();
          state = state.copyWith(isLoading: false);
          debugPrint('==> get product details failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
