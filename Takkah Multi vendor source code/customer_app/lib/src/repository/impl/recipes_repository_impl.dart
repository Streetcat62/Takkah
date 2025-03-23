import 'package:flutter/material.dart';

import '../repository.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  @override
  Future<ApiResult<SingleRecipeCategory>> getRecipeCategoryDetails({
    int? recipeCategoryId,
  }) async {
    final data = {
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/recipe-category/$recipeCategoryId',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleRecipeCategory.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get recipe category details failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleRecipeResponse>> getRecipeDetails({
    int? recipeId,
  }) async {
    final data = {
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/recipe/$recipeId',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleRecipeResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get recipe details failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<RecipeCategoriesPaginate>> getRecipeCategoriesPaginate({
    int? page,
    int? shopId,
  }) async {
    final data = {
      if (page != null) 'page': page,
      if (shopId != null) 'shop_id': shopId,
      'perPage': 14,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/recipe-category/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: RecipeCategoriesPaginate.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get recipe categories paginate failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<RecipesPaginateResponse>> getRecipesPaginate({
    int? page,
    int? shopId,
  }) async {
    final data = {
      if (page != null) 'page': page,
      if (shopId != null) 'shop_id': shopId,
      'perPage': 14,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/recipe/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: RecipesPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get recipes paginate failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
