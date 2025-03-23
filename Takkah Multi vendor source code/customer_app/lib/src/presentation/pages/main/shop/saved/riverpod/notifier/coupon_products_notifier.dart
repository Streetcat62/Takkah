import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../models/data/local_cart.dart';
import '../state/coupon_products_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class CouponProductsNotifier extends StateNotifier<CouponProductsState> {
  final ProductsRepository _productsRepository;
  final CartsRepository _cartsRepository;
  int _couponProductsPage = 0;

  CouponProductsNotifier(this._productsRepository, this._cartsRepository)
      : super(const CouponProductsState());

  Future<void> decreaseProductCount({
    int? productId,
    int? shopId,
  }) async {
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productId, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    LocalStorage.instance.addProductQuantity(productId ?? 0 , count - 1);
    state = state.copyWith(isLoading: state.isLoading);
    await _cartsRepository.saveProductToCart(
      shopId: shopId,
      productId: productId,
      quantity: count - 1,
    );
  }

  Future<void> increaseProductCount({
    int? productId,
    int? shopId,
  }) async {
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productId, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    LocalStorage.instance.addProductQuantity(productId ?? 0, count + 1);
    state = state.copyWith(isLoading: state.isLoading);
    await _cartsRepository.saveProductToCart(
      shopId: shopId,
      productId: productId,
      quantity: count + 1,
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

  Future<void> fetchCouponProducts({
    int? shopId,
    VoidCallback? checkYourNetwork,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _productsRepository.getDiscountProducts(
        shopId: shopId,
        page: ++_couponProductsPage,
      );
      response.when(
        success: (data) {
          state = state.copyWith(
            isLoading: false,
            couponProducts: data.data ?? [],
          );
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get coupon products failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> updateCouponProducts(
    BuildContext context, {
    int? shopId,
  }) async {
    _couponProductsPage = 0;
    fetchCouponProducts(
      shopId: shopId,
      checkYourNetwork: () {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
    );
  }
}
