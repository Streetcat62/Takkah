import 'dart:convert';

import 'package:flutter/material.dart';

import '../repository.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<ApiResult<ProductsPaginateResponse>> getProductsPaginate({
    int? categoryId,
    int? brandId,
    int? page,
    int? shopId,
  }) async {
    final data = {
      if (brandId != null) 'brand_id': brandId,
      if (categoryId != null) 'category_id': categoryId,
      'perPage': 10,
      if (page != null) 'page': page,
      if (shopId != null) 'shop_id': shopId,
      'lang' : LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get products paginate failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> addReview({
    String? productUuid,
    required String comment,
    double? rating,
    List<String>? images,
  }) async {
    final data = {
      'rating': rating ?? 1,
      'comment': comment,
      if (images != null && images.isNotEmpty) 'images': images,
    };
    debugPrint('===> add review data: ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/rest/products/review/$productUuid',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> add review failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleProductResponse>> getProductDetails({
    String? uuid,
  }) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/$uuid',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleProductResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get product details failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getDiscountProducts({
    int? shopId,
    int? page,
  }) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      if (page != null) 'page': page,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'perPage': 14,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/discount',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get discount products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopCategoriesPaginateResponse>> getShopCategories({
    int? page,
    int? shopId,
  }) async {
    final data = {
      'perPage': 5,
      if (page != null) 'page': page,
      if (shopId != null) 'shop_id': shopId,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/categories/product/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopCategoriesPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get shop categories failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> searchProducts({
    String? query,
    int? categoryId,
    int? brandId,
    int? shopId,
  }) async {
    final data = {
      'search': query,
      if (categoryId != null) 'category_id': categoryId,
      if (brandId != null) 'brand_id': brandId,
      if (shopId != null) 'shop_id': shopId,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getProductsByIds(
    List<LocalProductData> products,
  ) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    for (int i = 0; i < products.length; i++) {
      data['products[$i]'] = products[i].productId;
    }
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/products/ids',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get products by ids failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
