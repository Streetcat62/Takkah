import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../models/models.dart';
import '../../../../../core/utils/utils.dart';
import '../state/main_product_search_state.dart';
import '../../../../../repository/repository.dart';

class MainProductSearchNotifier extends StateNotifier<MainProductSearchState> {
  final ProductsRepository _productsRepository;

  MainProductSearchNotifier(this._productsRepository)
      : super(const MainProductSearchState());

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

  Future<void> searchProducts({required String query}) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.searchProducts(query: query);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, products: data.data ?? []);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> search products failure: $fail');
      },
    );
  }
}
