import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sundaymart/src/models/data/order_refund_info.dart';

import '../repository.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../core/constants/constants.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  @override
  Future<ApiResult<TransactionsResponse>> createTransaction({
    int? orderId,
    int? paymentId,
  }) async {
    final data = {'payment_sys_id': paymentId};
    debugPrint('===> create transaction body: ${jsonEncode(data)}');
    debugPrint('===> create transaction order id: $orderId');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/payments/order/$orderId/transactions',
        data: data,
      );
      return ApiResult.success(
        data: TransactionsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create transaction failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> cancelOrder({int? orderId}) async {
    final data = {'status': 'canceled'};
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/orders/$orderId/status/change',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> cancel order failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> refundOrder({int? orderId, String? messageUser,String? userImage}) async {
    final data = {
      'message_user': messageUser,
      'order_id' : orderId,
      'image' : [userImage]};
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/refund',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> cancel order failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleOrderResponse>> getOrderDetails({int? orderId}) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/orders/$orderId',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleOrderResponse.fromJson(response.data),
      );
    } catch (e , s) {
      debugPrint('==> get order details failure: $e $s');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<OrderRefundData>> getOrderRefundInfo({int? orderId}) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/refund/$orderId',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderRefundData.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get order details failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<OrdersPaginateResponse>> getOrders({
    required OrderStatus status,
    int? page,
  }) async {
    String statusText = 'new';
    switch (status) {
      case OrderStatus.accepted:
        statusText = 'accepted';
        break;
      case OrderStatus.ready:
        statusText = 'ready';
        break;
      case OrderStatus.onAWay:
        statusText = 'on_a_way';
        break;
      case OrderStatus.delivered:
        statusText = 'delivered';
        break;
      case OrderStatus.canceled:
        statusText = 'canceled';
        break;
      default:
        break;
    }
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      if (page != null) 'page': page,
      'status': statusText,
      'perPage': 10,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrdersPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get order $status failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
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
  }) async {
    final data = {
      if (shopId != null) 'shop_id': shopId,
      if (total != null) 'total': total,
      if (deliveryFee != null) 'delivery_fee': deliveryFee,
      if (coupon != null) 'coupon': coupon,
      if (addressId != null) 'delivery_address_id': addressId,
      if (totalDiscount != null) 'total_discount': totalDiscount,
      if (deliveryTypeId != null) 'delivery_type_id': deliveryTypeId,
      if (tax != null) 'tax': tax,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (deliveryTime != null) 'delivery_time': deliveryTime,
      if (cartId != null) 'cart_id': cartId,
      'lang': LocalStorage.instance.getLanguage()?.locale,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'rate': LocalStorage.instance.getSelectedCurrency()?.rate,
    };
    debugPrint('===> create order data ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/orders',
        data: data,
      );
      return ApiResult.success(
        data: CreateOrderResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create order failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
