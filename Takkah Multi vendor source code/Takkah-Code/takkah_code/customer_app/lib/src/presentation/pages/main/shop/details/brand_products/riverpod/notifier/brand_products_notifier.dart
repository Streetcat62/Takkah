import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../models/data/local_cart.dart';
import '../state/brand_products_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../../../../../../core/constants/constants.dart';

class BrandProductsNotifier extends StateNotifier<BrandProductsState> {
  final ProductsRepository _productsRepository;
  final CartsRepository _cartsRepository;
  int _page = 0;

  BrandProductsNotifier(this._productsRepository, this._cartsRepository)
      : super(const BrandProductsState());

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

  Future<void> decreaseProductCount({int? productId, int? shopId}) async {
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productId, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    LocalStorage.instance.addProductQuantity(productId ?? 0, count - 1);
    state = state.copyWith(isLoading: state.isLoading);
    await _cartsRepository.saveProductToCart(
      shopId: shopId,
      productId: productId,
      quantity: count - 1,
    );
  }

  Future<void> increaseProductCount({int? productId, int? shopId, required int maxQty}) async {
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productId, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    if (count >= maxQty) {
      return;
    }
    LocalStorage.instance.addProductQuantity(productId ?? 0, count + 1);
    state = state.copyWith(isLoading: state.isLoading);
    await _cartsRepository.saveProductToCart(
      shopId: shopId,
      productId: productId,
      quantity: count + 1,
    );
  }

  void updateState () {
    state = state.copyWith(isLoading: state.isLoading);
  }

  Future<void> fetchBrandProducts({
    int? brandId,
    VoidCallback? checkYourNetwork,
  }) async {
    if (!state.hasMore) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true);
        final response = await _productsRepository.getProductsPaginate(
          page: ++_page,
          brandId: brandId,
        );
        response.when(
          success: (data) {
            state = state.copyWith(
              isLoading: false,
              products: data.data ?? [],
              hasMore: (data.data ?? []).length >= 10,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isLoading: false, hasMore: false);
            debugPrint('==> get brand products failure: $fail');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response = await _productsRepository.getProductsPaginate(
          page: ++_page,
          brandId: brandId,
        );
        response.when(
          success: (data) {
            final List<ProductData> newList = List.from(state.products);
            newList.addAll(data.data ?? []);
            state = state.copyWith(
              isMoreLoading: false,
              products: newList,
              hasMore: (data.data ?? []).length >= 10,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get brand products failure: $fail');
          },
        );
      }
    } else {
      checkYourNetwork?.call();
    }
  }

  void updateBrandProducts(BuildContext context, {int? brandId}) {
    _page = 0;
    state = state.copyWith(hasMore: true);
    fetchBrandProducts(
      brandId: brandId,
      checkYourNetwork: () => AppHelpers.showCheckFlash(
        context,
        AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
      ),
    );
  }
}
