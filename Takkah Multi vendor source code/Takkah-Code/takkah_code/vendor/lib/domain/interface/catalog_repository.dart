import 'package:venderfoodyman/infrastructure/models/data/category.dart';

import '../../infrastructure/models/data/brand_data.dart';
import '../../infrastructure/models/data/main_category.dart';
import '../../infrastructure/models/data/unit_model.dart';
import '../handlers/handlers.dart';

abstract class CatalogRepository {
  Future<ApiResult<UnitModelResponse>> getUnits();

  Future<ApiResult<void>> createCategory({required String title});

  Future<ApiResult<CategoryResponse>> getCategories({
    int? page,
    String? query,
  });

  Future<ApiResult<BrandModelResponse>> getBrands();

  Future<ApiResult<MainCategoryResponse>> getChildrenCategories({
    int? page,
    String? query,
    required int parentId
  });
}
