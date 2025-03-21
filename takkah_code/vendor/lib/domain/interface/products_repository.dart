import '../../infrastructure/models/data/product_model.dart';
import '../handlers/handlers.dart';
import '../../infrastructure/models/models.dart';
import '../../infrastructure/services/services.dart';

abstract class ProductsRepository {
  Future<ApiResult<SingleProductResponse>> updateProduct({
    required String tax,
    required String minQty,
    required String maxQty,
    required String price,
    required bool active,
    required int quantity,
    String? image,
    required int id,
    required int productId,
  });

  Future<ApiResult<SingleProductResponse>> createProduct({
    required int brandId,
    required int quantity,
    required String price,
    required String title,
    required String description,
    required String tax,
    required String minQty,
    required String maxQty,
    required String qrcode,
    required bool active,
    int? categoryId,
    int? unitId,
    String? image,
    bool isAddon = false,
  });

  Future<ApiResult<SingleProductResponse>> getProductDetails(String uuid);

  Future<ApiResult<ProductResponse>> getProducts({
    int? page,
    int? categoryId,
    String? query,
    ProductStatus? status,
    bool needAddons = false,
  });
}
