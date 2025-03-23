import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:venderfoodyman/infrastructure/models/data/delivery_fee_data.dart';
import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';
import '../models/data/add_location_data.dart';
import '../models/data/user_address_model.dart';
import '../models/models.dart';
import '../../domain/di/injection.dart';
import '../../domain/handlers/handlers.dart';
import '../../domain/interface/interfaces.dart';
import '../services/app_constants.dart';
import '../services/local_storage.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  @override
  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  }) async {
    final data = {'payment_sys_id': paymentId};
    debugPrint('===> create transaction body: ${jsonEncode(data)}');
    debugPrint('===> create transaction order id: $orderId');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/payments/order/$orderId/transactions',
        data: jsonEncode(data),
      );
      return ApiResult.success(
        data: TransactionsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create transaction failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<PaymentsResponse>> getPayments() async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/seller/payment');
      return ApiResult.success(
        data: PaymentsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get payments error: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<CreateOrderResponse>> createOrder({
    required DeliveryType deliveryType,
    required List<ProductModel> stocks,
    required String deliveryTime,
    required int addressId,
    UserData? user,
  }) async {
    List<Map<String, dynamic>> products = [];
    for (final stock in stocks) {
      products.add({
        'shop_product_id': stock.id,
        'qty': stock.cartCount,
        'price': stock.price,
        'tax': stock.tax,
        'discount': stock.discount
      });
    }
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'rate': LocalStorage.instance.getSelectedCurrency()?.rate,
      'shop_id': LocalStorage.instance.getShop()?.id,
      'delivery_type_id': deliveryType == DeliveryType.delivery ? 9 : 8,
      'user_id': user?.id,
      'products': products,
      'delivery_date': deliveryTime,
      'delivery_address_id': addressId
    };
    debugPrint('===> create order body ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/orders',
        data: jsonEncode(data),
      );
      return ApiResult.success(
        data: CreateOrderResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create order failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<OrderStatusResponse>> updateOrderStatus({
    required OrderStatus status,
    int? orderId,
  }) async {
    String? statusText;
    switch (status) {
      case OrderStatus.newOrder:
        statusText = 'new';
        break;
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
    }
    final data = {'status': statusText};
    debugPrint('===> update order status request ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/order/$orderId/status',
        data: data,
      );
      return ApiResult.success(
        data: OrderStatusResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update order status failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<SingleOrderResponse>> getOrderDetails({int? orderId}) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final data = {
        'lang': LocalStorage.instance.getLanguage()?.locale,
      };
      final response = await client.get(
          '/api/v1/dashboard/seller/orders/$orderId',
          queryParameters: data);
      return ApiResult.success(
        data: SingleOrderResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get order details failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<OrdersPaginateResponse>> getOrders({
    OrderStatus? status,
    int? page,
    String? from,
    String? to,
  }) async {
    String? statusText;
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
      case OrderStatus.newOrder:
        statusText = 'new';
        break;
      default:
        statusText = null;
        break;
    }
    final data = {
      if (page != null) 'page': page,
      if (statusText != null) 'status': statusText,
      if (from != null) 'date_from': from,
      if (to != null) 'date_to': to,
      'perPage': 10,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrdersPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get order $status failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<OrdersPaginateResponse>> getHistoryOrders({
    int? page,
    String? from,
    String? to,
  }) async {
    final data = {
      if (page != null) 'page': page,
      'statuses[0]': 'delivered',
      'statuses[1]': 'canceled',
      if (from != null) 'date_from': from,
      if (to != null) 'date_to': to,
      'perPage': 10,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrdersPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get order failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<OrderCalculate>> getCalculate({
    required List<ProductModel> stocks,
    required String type,
    required Location? location,
  }) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      // 'shop_id': LocalStorage.instance.getShop()?.id,
      for (int i = 0; i < stocks.length; i++)
        'products[$i][id]': '${stocks[i].id}',
      for (int i = 0; i < stocks.length; i++)
        'products[$i][quantity]': '${stocks[i].cartCount}',
      // 'type': type,
      // 'address[latitude]': location?.latitude,
      // 'address[longitude]': location?.longitude
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/seller/order/calculate/products',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderCalculate.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get order failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<DeliveryFeeResponse>> getDeliveryFee({
    required Location? location,
  }) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'address[latitude]': location?.latitude,
      'address[longitude]': location?.longitude
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/rest/shop/${LocalStorage.instance.getShop()?.id}/delivery-zone/check/distance',
        queryParameters: data,
      );
      return ApiResult.success(
        data: DeliveryFeeResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get deliveryFee failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<AddAddressResponse>> addLocationToUser(
      {required String uuId,
      required Location? location,
      required String title,
      required String address}) async {
    final data = {
      'title': title,
      'address': address,
      'active': 1,
      'location': '${location?.latitude}, ${location?.longitude}',
    };
    debugPrint('===> create order body ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/seller/users/$uuId/address',
        data: data,
      );
      return ApiResult.success(
        data: AddAddressResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> add address failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
