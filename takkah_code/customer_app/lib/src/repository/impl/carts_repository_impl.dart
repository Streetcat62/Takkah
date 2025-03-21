import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../repository.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';

class CartsRepositoryImpl implements CartsRepository {
  @override
  Future<ApiResult<CouponResponse>> checkCoupon({
    required String coupon,
    int? shopId,
  }) async {
    final data = {
      'coupon': coupon,
      'user_id': LocalStorage.instance.getUser()?.id,
      if (shopId != null) 'shop_id': shopId,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/rest/coupons/check',
        data: data,
      );
      return ApiResult.success(data: CouponResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> check coupon failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> deleteCartMember({
    int? cartId,
    String? memberUuid,
  }) async {
    final data = {if (cartId != null) 'cart_id': cartId};
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/user/cart/member/$memberUuid',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete cart member failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> deleteCart({int? cartId}) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.delete('/api/v1/dashboard/user/cart/$cartId');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete cart failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> insertProducts({
    int? shopId,
    List<RecipeProduct>? products,
  }) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      'lang': LocalStorage.instance.getLanguage()?.locale,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
    };
    List<Map> productsMap = [];
    if (products != null) {
      for (int i = 0; i < products.length; i++) {
        productsMap.add(
          {
            'shop_product_id': products[i].product?.id,
            'quantity': products[i].quantity,
          },
        );
      }
    }
    data['products'] = productsMap;
    log('===> insert products data ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/cart/insert-product',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> insert cart products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<UserCartResponse>> openCart({int? shopId}) async {
    final data = {if (shopId != null) 'shop_id': shopId};
    debugPrint('===> open cart data ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/cart/open',
        data: data,
      );
      return ApiResult.success(
        data: UserCartResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> open cart failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<PaymentsResponse>> getPayments({int? shopId}) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      'lang': LocalStorage.instance.getLanguage()?.locale,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/payments',
        queryParameters: data,
      );
      return ApiResult.success(
        data: PaymentsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get payments failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<CartCalculateResponse>> getCartCalculate({
    int? cartId,
  }) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client
          .post('/api/v1/dashboard/user/cart/calculate/$cartId', data: data);
      return ApiResult.success(
        data: CartCalculateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get cart calculate error: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> deleteProductFromCart({
    int? cartDetailId,
  }) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.delete('/api/v1/dashboard/user/cart/product/$cartDetailId');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete from cart failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<UserCartResponse>> saveProductToCart({
    int? shopId,
    int? productId,
    int? quantity,
  }) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      if (productId != null) 'shop_product_id': productId,
      if (quantity != null) 'quantity': quantity,
    };
    debugPrint('===> save to cart data ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/cart',
        data: data,
      );
      return ApiResult.success(
        data: UserCartResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> save to cart failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<UserCartResponse>> getUserCart({int? shopId}) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      'lang': LocalStorage.instance.getLanguage()?.locale,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/cart',
        queryParameters: data,
      );
      return ApiResult.success(
        data: UserCartResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get user cart failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
