import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:venderfoodyman/infrastructure/models/data/brand_data.dart';
import 'package:venderfoodyman/infrastructure/models/data/category.dart';
import 'package:venderfoodyman/infrastructure/models/data/main_category.dart';
import 'package:venderfoodyman/infrastructure/models/data/unit_model.dart';
import '../services/services.dart';
import '../../domain/di/injection.dart';
import '../../domain/handlers/handlers.dart';
import '../../domain/interface/interfaces.dart';

class CatalogRepositoryImpl implements CatalogRepository {
  @override
  Future<ApiResult<UnitModelResponse>> getUnits() async {
    final data = {'lang': LocalStorage.instance.getLanguage()?.locale};
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/units/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: UnitModelResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get units paginate failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> createCategory({required String title}) async {
    final data = {
      'title': {
        LocalStorage.instance.getSystemLanguage()?.locale ?? 'en': title
      },
      'active': 1,
      'type': 'main',
    };
    debugPrint('===> create category request ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/seller/shop/category',
        queryParameters: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> create category failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<CategoryResponse>> getCategories({
    int? page,
    String? query,
  }) async {
    final data = {
      if (page != null) 'page': page,
      if (query != null) 'search': query,
      'perPage': 30,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/shop/category',
        queryParameters: data,
      );
      return ApiResult.success(
        data: CategoryResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get categories paginate failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<BrandModelResponse>> getBrands() async {
    final data = {'lang': LocalStorage.instance.getLanguage()?.locale};
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/shop/brand',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BrandModelResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get brands  failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<MainCategoryResponse>> getChildrenCategories(
      {int? page, String? query, required int parentId}) async {
    final data = {
      'parent_id': parentId,
      if (query != null) 'search': query,
      'perPage': 10,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/shop/category/children',
        queryParameters: data,
      );
      return ApiResult.success(
        data: MainCategoryResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get categories paginate failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
