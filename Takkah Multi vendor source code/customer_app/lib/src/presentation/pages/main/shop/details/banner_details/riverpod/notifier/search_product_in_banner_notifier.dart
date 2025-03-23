import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../models/data/local_cart.dart';
import '../../../../../../../../models/models.dart';
import '../state/search_product_in_banner_state.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../../../../../../core/constants/constants.dart';

class SearchProductInBannerNotifier
    extends StateNotifier<SearchProductInBannerState> {
  final ProductsRepository _productsRepository;
  final CartsRepository _cartsRepository;
  Timer? _timer;

  SearchProductInBannerNotifier(this._productsRepository, this._cartsRepository)
      : super(const SearchProductInBannerState());

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
    state = state.copyWith(isSearchLoading: state.isSearchLoading);
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
    state = state.copyWith(isSearchLoading: state.isSearchLoading);
    await _cartsRepository.saveProductToCart(
      shopId: product.shop?.id,
      productId: product.id,
      quantity: count - 1,
    );
  }

  void setQuery(BuildContext context, String query) {
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
          searchProducts(
            checkYourNetwork: () {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
              );
            },
          );
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

  Future<void> searchProducts({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSearchLoading: true, isSearching: true);
      final response =
          await _productsRepository.searchProducts(query: state.query);
      response.when(
        success: (data) {
          state = state.copyWith(
            isSearchLoading: false,
            searchedProducts: data.data ?? [],
          );
        },
        failure: (fail, errorData) {
          state = state.copyWith(isSearchLoading: false);
          debugPrint('==> search products failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
