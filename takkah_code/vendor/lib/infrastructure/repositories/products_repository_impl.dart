import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../../domain/di/injection.dart';
import '../../domain/handlers/handlers.dart';
import '../../domain/interface/interfaces.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  Future<ApiResult<CalculateResponse>> getProductsCalculation(
    List<Stock> stocks,
  ) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
    };
    for (int i = 0; i < stocks.length; i++) {
      data['products[$i][stock_id]'] = stocks[i].id;
      data['products[$i][quantity]'] = stocks[i].cartCount;
    }
    debugPrint('===> get calculation ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/order/products/calculate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: CalculateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get calculations failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleProductResponse>> createProduct({
    required String title,
    required String description,
    required String tax,
    required String minQty,
    required String maxQty,
    required String qrcode,
    required int quantity,
    required String price,
    required bool active,
    required int brandId,
    int? categoryId,
    int? unitId,
    String? image,
    bool isAddon = false,
  }) async {
    final data = {
      'title': {LocalStorage.instance.getLanguage()?.locale ?? 'en': title},
      'description': {
        LocalStorage.instance.getLanguage()?.locale ?? 'en': description
      },
      'tax': num.tryParse(tax),
      'min_qty': num.tryParse(minQty),
      'max_qty': num.tryParse(maxQty),
      'active': active ? 1 : 0,
      'qr_code': qrcode,
      'brand_id': brandId,
      'price': num.tryParse(price),
      'quantity': quantity,
      if (categoryId != null) 'category_id': categoryId,
      if (unitId != null) 'unit_id': unitId,
      if (image != null) 'images': [image],
    };
    debugPrint('===> create product ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/products',
        data: data,
      );
      return ApiResult.success(
        data: SingleProductResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create product fail: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleProductResponse>> getProductDetails(
    String uuid,
  ) async {
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
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<ProductResponse>> getProducts({
    int? page,
    int? categoryId,
    String? query,
    ProductStatus? status,
    bool needAddons = false,
  }) async {
    String? statusText;
    if (status != null) {
      switch (status) {
        case ProductStatus.pending:
          statusText = 'pending';
          break;
        case ProductStatus.published:
          statusText = 'published';
          break;
        case ProductStatus.unpublished:
          statusText = 'unpublished';
          break;
        default:
          statusText = 'published';
          break;
      }
    }
    final data = {
      'lang': LocalStorage.instance.getLanguage()?.locale ?? 'en',
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      if (page != null) 'page': page,
      if (categoryId != null) 'category_id': categoryId,
      if (query != null) 'search': query,
      if (statusText != null) 'status': statusText,
      'perPage': 10,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/shop/product',
        queryParameters: data,
      );

      return ApiResult.success(
        data: ProductResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get products failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleProductResponse>> updateProduct(
      {required String tax,
      required String minQty,
      required String maxQty,
      required String price,
      required bool active,
      required int quantity,
      required int productId,
      String? image,
      ProductModel? product,
      required int id}) async {
    final data = {
      'product_id': productId,
      'tax': num.tryParse(tax),
      'min_qty': num.tryParse(minQty),
      'max_qty': num.tryParse(maxQty),
      'active': active ? 1 : 0,
      'price': num.tryParse(price) ?? product?.price,
      'quantity': quantity,
      if (image != null) 'images': [image],
    };
    debugPrint('===> update product ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/seller/shop/product/$id',
        data: jsonEncode(data),
      );
      return ApiResult.success(
        data: SingleProductResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update product fail: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
