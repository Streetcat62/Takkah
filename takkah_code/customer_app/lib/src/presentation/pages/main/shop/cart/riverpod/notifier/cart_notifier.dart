import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/utils/local_storage.dart';
import '../../../../../../../models/data/local_cart.dart';
import '../state/cart_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../repository/repository.dart';

class CartNotifier extends StateNotifier<CartState> {
  final CartsRepository _cartsRepository;
  Timer? _timer;
  Timer? _cartTimer;

  CartNotifier(this._cartsRepository) : super(const CartState());

  void cancelTimer() {
    _cartTimer?.cancel();
  }

  Future<void> _updateCart({Function(CartData?)? updateCart}) async {
    final response =
        await _cartsRepository.getUserCart(shopId: state.cartData?.shopId);
    response.when(
      success: (data) {
        if (updateCart != null) {
          updateCart(data.data);
        }
        state = state.copyWith(cartData: data.data);
      },
      failure: (fail, errorData) {
        debugPrint('===> update cart failure $fail');
      },
    );
  }

  Future<void> clearCart({VoidCallback? clearedCart}) async {
    if (state.cartData == null) {
      return;
    }
    final response =
        await _cartsRepository.deleteCart(cartId: state.cartData?.id);
    response.when(
      success: (data) {
        state = state.copyWith(cartData: null);
        clearedCart?.call();
        LocalStorage.instance
            .deleteProductQuantityList();
      },
      failure: (fail, errorData) {
        debugPrint('===> clear cart failure $fail');
      },
    );
  }

  void clearLocaleCart () {
    List<UserCartData>? userCarts = state.cartData?.userCarts;
    userCarts?.forEach((element) {

    });
  }

  Future<void> _deleteFromCart({
    CartDetails? cartDetails,
    Function(CartData?)? updateCart,
  }) async {
    await _cartsRepository.deleteProductFromCart(
      cartDetailId: cartDetails?.id,
    );
    _updateCart(updateCart: updateCart);
  }

  void deleteCartProduct({
    int? userIndex,
    int? productIndex,
    int? shopId,
    Function(CartData?)? updateCart,
  }) {
    List<UserCartData>? userCarts = state.cartData?.userCarts;
    if (userCarts == null || userIndex == null || productIndex == null) {
      return;
    }
    List<CartDetails>? carts = userCarts[userIndex].cartDetails;
    if (carts == null) {
      return;
    }
    final product = carts[productIndex];
    carts.removeAt(productIndex);
    userCarts[userIndex] = userCarts[userIndex].copyWith(cartDetails: carts);
    final cartData = state.cartData?.copyWith(userCarts: userCarts);
    state = state.copyWith(cartData: cartData);
    _deleteFromCart(cartDetails: product, updateCart: updateCart);
    LocalStorage.instance.addProductQuantity(product.product?.id ?? 0 , 0);
  }

  Future<void> increaseCartProduct({
    int? userIndex,
    int? productIndex,
    int? shopId,
    Function(CartData?)? updateCart,
  }) async {
    List<UserCartData>? userCarts = state.cartData?.userCarts;
    if (userCarts == null || userIndex == null || productIndex == null) {
      return;
    }
    List<CartDetails>? carts = userCarts[userIndex].cartDetails;
    if (carts == null) {
      return;
    }
    final int maxQty = carts[productIndex].product?.maxQty ?? 0;
    final int productId = carts[productIndex].product?.id ?? 0;
    final int localCartCount = carts[productIndex].localQuantity ?? 0;
    if (localCartCount >= maxQty) {
      return;
    }
    _timer?.cancel();
    carts[productIndex] =
        carts[productIndex].copyWith(localQuantity: localCartCount + 1);
    userCarts[userIndex] = userCarts[userIndex].copyWith(cartDetails: carts);
    final cartData = state.cartData?.copyWith(userCarts: userCarts);
    state = state.copyWith(cartData: cartData);
    _timer = Timer(
      const Duration(milliseconds: 400),
          () {
        _saveToCart(
          userIndex: userIndex,
          productIndex: productIndex,
          shopId: shopId,
          updateCart: updateCart,
        );
      },
    );
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productId, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    LocalStorage.instance.addProductQuantity(productId, count + 1);
    state = state.copyWith(isLoading: state.isLoading);
  }

  Future<void> decreaseCartProduct({
    int? userIndex,
    int? productIndex,
    int? shopId,
    Function(CartData?)? updateCart,
  }) async {

    List<UserCartData>? userCarts = state.cartData?.userCarts;
    if (userCarts == null || userIndex == null || productIndex == null) {
      return;
    }
    List<CartDetails>? carts = userCarts[userIndex].cartDetails;
    if (carts == null) {
      return;
    }
    final int minQty = carts[productIndex].product?.minQty ?? 0;
    final int localCartCount = carts[productIndex].localQuantity ?? 0;
    final int productId = carts[productIndex].product?.id ?? 0;
    if (localCartCount <= minQty) {
      return;
    }
    _timer?.cancel();
    carts[productIndex] =
        carts[productIndex].copyWith(localQuantity: localCartCount - 1);
    userCarts[userIndex] = userCarts[userIndex].copyWith(cartDetails: carts);
    final cartData = state.cartData?.copyWith(userCarts: userCarts);
    state = state.copyWith(cartData: cartData);
    _timer = Timer(
      const Duration(milliseconds: 400),
      () {
        _saveToCart(
          userIndex: userIndex,
          productIndex: productIndex,
          shopId: shopId,
          updateCart: updateCart,
        );
      },
    );
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productId, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    LocalStorage.instance.addProductQuantity(productId, count - 1);
    state = state.copyWith(isLoading: state.isLoading);
  }

  CartDetails? _getProduct({
    required int userIndex,
    required int productIndex,
  }) {
    List<UserCartData>? userCarts = state.cartData?.userCarts;
    if (userCarts == null) {
      return null;
    }
    List<CartDetails>? carts = userCarts[userIndex].cartDetails;
    if (carts == null) {
      return null;
    }
    return carts[productIndex];
  }

  Future<void> _saveToCart({
    int? shopId,
    required int userIndex,
    required int productIndex,
    Function(CartData?)? updateCart,
  }) async {
    final product =
        _getProduct(userIndex: userIndex, productIndex: productIndex);
    final result = await _cartsRepository.saveProductToCart(
      shopId: shopId,
      productId: product?.product?.id,
      quantity: product?.localQuantity,
    );
    result.when(
      success: (data) {
        if (updateCart != null) {
          updateCart(data.data);
        }
        state = state.copyWith(cartData: data.data);
      },
      failure: (fail, errorData) {
        debugPrint('===> save product to cart failure $fail');
      },
    );
  }


  Future<void> fetchCart({int? shopId, Function(CartData?)? updateCart}) async {
    state = state.copyWith(isLoading: true, cartData: null);
    final response = await _cartsRepository.getUserCart(shopId: shopId);
    response.when(
      success: (data) {
        if (updateCart != null) {
          updateCart(data.data);
        }
        state = state.copyWith(cartData: data.data, isLoading: false);
        if (state.cartData?.together ?? false) {
          if (_cartTimer?.isActive ?? false) {
            _cartTimer?.cancel();
          }
          _cartTimer = Timer.periodic(
            const Duration(seconds: 5),
            (timer) {
              _updateCart(updateCart: updateCart);
            },
          );
        }
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get cart failure: $fail');
      },
    );
  }
}
