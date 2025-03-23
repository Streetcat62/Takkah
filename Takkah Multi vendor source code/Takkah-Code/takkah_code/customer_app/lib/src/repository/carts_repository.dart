import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class CartsRepository {
  Future<ApiResult<CouponResponse>> checkCoupon({
    required String coupon,
     int? shopId,
  });

  Future<ApiResult<void>> deleteCartMember({int? cartId, String? memberUuid});

  Future<ApiResult<void>> deleteCart({int? cartId});

  Future<ApiResult<void>> insertProducts({
    int? shopId,
    List<RecipeProduct>? products,
  });

  Future<ApiResult<UserCartResponse>> openCart({int? shopId});

  Future<ApiResult<PaymentsResponse>> getPayments({int? shopId});

  Future<ApiResult<CartCalculateResponse>> getCartCalculate({int? cartId});

  Future<ApiResult<void>> deleteProductFromCart({
    int? cartDetailId,
  });

  Future<ApiResult<UserCartResponse>> saveProductToCart({
    int? shopId,
    int? productId,
    int? quantity,
  });

  Future<ApiResult<UserCartResponse>> getUserCart({int? shopId});
}
