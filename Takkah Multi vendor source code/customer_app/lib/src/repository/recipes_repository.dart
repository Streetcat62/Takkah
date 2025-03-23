import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class RecipesRepository {
  Future<ApiResult<SingleRecipeCategory>> getRecipeCategoryDetails({
    int? recipeCategoryId,
  });

  Future<ApiResult<SingleRecipeResponse>> getRecipeDetails({
    int? recipeId,
  });

  Future<ApiResult<RecipeCategoriesPaginate>> getRecipeCategoriesPaginate({
    int? page,
    int? shopId,
  });

  Future<ApiResult<RecipesPaginateResponse>> getRecipesPaginate({
    int? page,
    int? shopId,
  });
}
