import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class ProductsRepository {
  Future<ApiResult<ProductsPaginateResponse>> getProductsPaginate({
    int? categoryId,
    int? brandId,
    int? page,
    int? shopId,
  });

  Future<ApiResult<void>> addReview({
    String? productUuid,
    required String comment,
    double? rating,
    List<String>? images,
  });

  Future<ApiResult<SingleProductResponse>> getProductDetails({String? uuid});

  Future<ApiResult<ProductsPaginateResponse>> getDiscountProducts({
    int? shopId,
    int? page,
  });

  Future<ApiResult<ShopCategoriesPaginateResponse>> getShopCategories({
    int? page,
    int? shopId,
  });

  Future<ApiResult<ProductsPaginateResponse>> searchProducts({
    String? query,
    int? categoryId,
    int? brandId,
    int? shopId,
  });

  Future<ApiResult<ProductsPaginateResponse>> getProductsByIds(
    List<LocalProductData> products,
  );
}
