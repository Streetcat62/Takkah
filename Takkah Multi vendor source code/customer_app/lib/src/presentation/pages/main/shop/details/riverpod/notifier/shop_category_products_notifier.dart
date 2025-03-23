import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../models/data/local_cart.dart';
import '../../../../../../../models/models.dart';
import '../state/shop_category_products_state.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class ShopCategoryProductsNotifier
    extends StateNotifier<ShopCategoryProductsState> {
  final ProductsRepository _productsRepository;
  final CartsRepository _cartsRepository;
  int _categoriesPage = 0;
  Timer? _timer;
  int? activeProductIndex;
  int? activeCategoryIndex;

  ShopCategoryProductsNotifier(this._productsRepository, this._cartsRepository)
      : super(const ShopCategoryProductsState()) {
    activeProductIndex = null;
    activeCategoryIndex = null;
  }

  void updateShopCategoryProducts({CartData? cartData}) {
    List<ShopCategoryData> shopCategories =
        List.from(state.shopCategoryProducts);
    for (int i = 0; i < shopCategories.length; i++) {
      List<ProductData>? products = shopCategories[i].products;
      if (products != null) {
        for (int j = 0; j < products.length; j++) {
          final int cartCount =
              AppHelpers.getProductCartCount(cartData, products[j]);
          products[j] = products[j]
              .copyWith(cartCount: cartCount, localCartCount: cartCount);
        }
      }

      shopCategories[i] = shopCategories[i].copyWith(products: products);
    }
    state = state.copyWith(shopCategoryProducts: shopCategories);
  }

  Future<void> decreaseProductCount(int productID , int shopId) async {
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productID, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    LocalStorage.instance.addProductQuantity(productID, count - 1);
    state = state.copyWith(isLoading: state.isLoading);
    await _cartsRepository.saveProductToCart(
      shopId: shopId,
      productId: productID,
      quantity: count - 1,
    );
  }

  Future<void> increaseProductCount(int productID , int shopId) async {
    int count =  LocalStorage.instance
        .getProductQuantity()
        .firstWhere(
            (element) =>
        element.productId ==
            productID, orElse: () {
      return LocalCart(productId: 0, quantity: 0);
    })
        .quantity;
    LocalStorage.instance.addProductQuantity(productID, count + 1);
    state = state.copyWith(isLoading: state.isLoading);
    await _cartsRepository.saveProductToCart(
      shopId: shopId,
      productId: productID,
      quantity: count + 1,
    );
  }

  void updateState(){
    state = state.copyWith(isLoading: state.isLoading);
  }


  ProductData? _getActiveProduct({int? productIndex, int? categoryIndex}) {
    final List<ProductData>? products =
        state.shopCategoryProducts[categoryIndex ?? 0].products;
    if (products != null) {
      return products[productIndex!];
    }
    return null;
  }


  Future<void> _updateRemoteCart({
    required int? productIndex,
    int? shopId,
    int? categoryIndex,
    Function(CartData?)? onCartUpdate,
  }) async {
    final ProductData? product = _getActiveProduct(
      productIndex: productIndex,
      categoryIndex: categoryIndex,
    );
    if (product?.localCartCount == null || product?.localCartCount == 0) {
      return;
    }
    final response = await _cartsRepository.saveProductToCart(
      shopId: shopId,
      productId: product?.id,
      quantity: product?.localCartCount,
    );
    response.when(
      success: (data) {
        if (onCartUpdate != null) {
          onCartUpdate(data.data);
        }
      },
      failure: (fail, errorData) {
        debugPrint('==> save to cart failure: $fail');
      },
    );
  }


  void updateChoosing({
    int? shopId,
    required int productIndex,
    required int categoryIndex,
  }) {
    List<ShopCategoryData> listOfCategories =
        List.from(state.shopCategoryProducts);
    _timer?.cancel();
    for (int i = 0; i < listOfCategories.length; i++) {
      List<ProductData>? listOfProducts = listOfCategories[i].products;
      if (listOfProducts == null) {
        continue;
      }
      // for (int j = 0; j < listOfProducts.length; j++) {
      //   listOfProducts[j] = listOfProducts[j].copyWith(isChoosing: false);
      // }
      listOfCategories[i] =
          listOfCategories[i].copyWith(products: listOfProducts);
    }
    List<ProductData>? listOfProducts =
        listOfCategories[categoryIndex].products;
    if (listOfProducts == null) {
      return;
    }
    // listOfProducts[productIndex] =
    //     listOfProducts[productIndex].copyWith(isChoosing: true);
    _updateRemoteCart(
        productIndex: productIndex,
        categoryIndex: categoryIndex,
        shopId: shopId
    );
    activeProductIndex = productIndex;
    activeCategoryIndex = categoryIndex;
    listOfCategories[categoryIndex] =
        listOfCategories[categoryIndex].copyWith(products: listOfProducts);
    _timer = Timer(
      const Duration(milliseconds: 400),
      () {
        // listOfProducts[productIndex] =
        //     listOfProducts[productIndex].copyWith(isChoosing: false);
        listOfCategories[categoryIndex] =
            listOfCategories[categoryIndex].copyWith(products: listOfProducts);
        state = state.copyWith(shopCategoryProducts: listOfCategories);
        _updateRemoteCart(
          productIndex: productIndex,
          categoryIndex: categoryIndex,
          shopId: shopId,
        );
        activeProductIndex = null;
        activeCategoryIndex = null;
      },
    );
    state = state.copyWith(shopCategoryProducts: listOfCategories);
  }

  void likeOrUnlikeProduct({
    int? productId,
    int? shopId,
  }) {
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

  Future<void> fetchShopCategories({int? shopId, CartData? cartData}) async {
    if (!state.hasMore) {
      return;
    }
    if (_categoriesPage == 0) {
      state = state.copyWith(isLoading: true);
      final response = await _productsRepository.getShopCategories(
        page: ++_categoriesPage,
        shopId: shopId,
      );
      response.when(
        success: (data) {
          final List<ShopCategoryData> shopCategories = data.data ?? [];
          for (int i = 0; i < shopCategories.length; i++) {
            final List<ProductData>? products = shopCategories[i].products;
            if (products != null) {
              final List<ProductData> listOfProducts = List.from(products);
              for (int j = 0; j < listOfProducts.length; j++) {
                final int cartCount = AppHelpers.getProductCartCount(
                  cartData,
                  listOfProducts[j],
                );
                if (cartCount != 0) {
                  listOfProducts[j] = listOfProducts[j].copyWith(
                    cartCount: cartCount,
                    localCartCount: cartCount,
                  );
                  shopCategories[i] =
                      shopCategories[i].copyWith(products: listOfProducts);
                  state = state.copyWith(shopCategoryProducts: shopCategories);
                }
              }
            }
          }
          state = state.copyWith(
            isLoading: false,
            shopCategoryProducts: shopCategories,
            hasMore: (data.data ?? []).length >= 5,
          );
        },
        failure: (fail, errorData) {
          _categoriesPage--;
          state = state.copyWith(isLoading: false, hasMore: false);
          debugPrint('==> get shop categories failure: $fail');
        },
      );
    } else {
      state = state.copyWith(isMoreLoading: true);
      final response = await _productsRepository.getShopCategories(
        page: ++_categoriesPage,
        shopId: shopId,
      );
      response.when(
        success: (data) {
          final List<ShopCategoryData> newList =
              List.from(state.shopCategoryProducts);
          newList.addAll(data.data ?? []);
          state = state.copyWith(
            isMoreLoading: false,
            shopCategoryProducts: newList,
            hasMore: (data.data ?? []).length >= 5,
          );
        },
        failure: (fail, errorData) {
          _categoriesPage--;
          state = state.copyWith(isMoreLoading: false);
          debugPrint('==> get shop categories failure: $fail');
        },
      );
    }
  }

  Future<void> updateShopCategories(
    BuildContext context, {
    int? shopId,
    CartData? cartData,
  }) async {
    _categoriesPage = 0;
    state = state.copyWith(hasMore: true);
    fetchShopCategories(shopId: shopId, cartData: cartData);
  }
}
