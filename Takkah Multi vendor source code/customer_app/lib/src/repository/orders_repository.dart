import 'package:sundaymart/src/models/data/order_refund_info.dart';

import '../models/models.dart';
import '../core/handlers/handlers.dart';
import '../core/constants/constants.dart';

abstract class OrdersRepository {
  Future<ApiResult<TransactionsResponse>> createTransaction({
    int? orderId,
    int? paymentId,
  });

  Future<ApiResult<void>> cancelOrder({int? orderId});

  Future<ApiResult<void>> refundOrder({int? orderId, String? messageUser,String? userImage});

  Future<ApiResult<SingleOrderResponse>> getOrderDetails({int? orderId});
  Future<ApiResult<OrderRefundData>> getOrderRefundInfo({int? orderId});

  Future<ApiResult<OrdersPaginateResponse>> getOrders({
    required OrderStatus status,
    int? page,
  });

  Future<ApiResult<CreateOrderResponse>> createOrder({
    int? shopId,
    double? total,
    double? deliveryFee,
    String? coupon,
    int? addressId,
    double? totalDiscount,
    int? deliveryTypeId,
    double? tax,
    String? deliveryDate,
    String? deliveryTime,
    int? cartId,
  });
}
