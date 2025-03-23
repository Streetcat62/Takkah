import '../../domain/handlers/handlers.dart';
import '../../infrastructure/models/models.dart';

abstract class OrdersRepository {
  Future<ApiResult<OrderDetailModel>> acceptAlertOrder(int? orderId);

  Future<ApiResult<OrderDetailModel>> showOrders(int? id);

  Future<ApiResult<dynamic>> setCurrentOrder(int? orderId);

  Future<ApiResult<OrderPaginateResponse>> getActiveOrders(int page);

  Future<ApiResult<List<OrderDetailData>>> getAvailableOrders(int page);

  Future<ApiResult<List<OrderDetailData>>> getHistoryOrders(
    int page, {
    DateTime? start,
    DateTime? end,
  });
}
