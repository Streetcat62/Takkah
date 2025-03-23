import '../../infrastructure/models/data/add_location_data.dart';
import '../../infrastructure/models/data/delivery_fee_data.dart';
import '../../infrastructure/models/data/product_model.dart';
import '../../infrastructure/models/data/user_address_model.dart';
import '../handlers/handlers.dart';
import '../../infrastructure/models/models.dart';
import '../../infrastructure/services/services.dart';

abstract class OrdersRepository {
  Future<ApiResult<OrderCalculate>> getCalculate({
    required List<ProductModel> stocks,
    required Location? location,
    required String type,
  });

  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  });

  Future<ApiResult<PaymentsResponse>> getPayments();

  Future<ApiResult<CreateOrderResponse>> createOrder({
    required DeliveryType deliveryType,
    UserData? user,
    required List<ProductModel> stocks,
    required String deliveryTime,
    required int addressId,
  });

  Future<ApiResult<OrderStatusResponse>> updateOrderStatus({
    required OrderStatus status,
    int? orderId,
  });

  Future<ApiResult<SingleOrderResponse>> getOrderDetails({int? orderId});

  Future<ApiResult<OrdersPaginateResponse>> getOrders({
    OrderStatus? status,
    int? page,
    String? from,
    String? to,
  });

  Future<ApiResult<OrdersPaginateResponse>> getHistoryOrders({
    int? page,
    String? from,
    String? to,
  });

  Future<ApiResult<DeliveryFeeResponse>> getDeliveryFee({
    required Location? location,
  });

  Future<ApiResult<AddAddressResponse>> addLocationToUser({
      required String uuId,
      required String title,
      required String address,
      required Location? location,
  });
}
