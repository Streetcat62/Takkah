import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/handlers/handlers.dart';
import '../../domain/di/injection.dart';
import '../../domain/interface/order_repository.dart';
import '../models/data/order_detail.dart';
import '../models/response/order_paginate_response.dart';
import '../services/services.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  @override
  Future<ApiResult<OrderDetailModel>> acceptAlertOrder(int? orderId) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/deliveryman/order/$orderId/attach/me',
      );
      return ApiResult.success(
        data: OrderDetailModel.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('===> error statistics settings $e');
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<OrderPaginateResponse>> getActiveOrders(int page) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale ?? 'en',
      'page': page,
      'statuses[1]': 'accepted',
      'statuses[2]': 'ready',
      'statuses[3]': 'on_a_way',
      'perPage': 10,
      'delivery_type': 'delivery',
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/deliveryman/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get active orders failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<List<OrderDetailData>>> getAvailableOrders(int page) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()!.id,
      'lang': LocalStorage.instance.getLanguage()?.locale ?? 'en',
      'page': page,
      'status': 'ready',
      'empty-deliveryman': 1,
      'perPage': 10,
      'delivery_type': 'delivery',
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/deliveryman/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderPaginateResponse.fromJson(response.data).data ?? [],
      );
    } catch (e ,s) {
      debugPrint('==> get canceled orders failure: $e $s');
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<OrderDetailModel>> showOrders(int? id) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/deliveryman/orders/$id',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderDetailModel.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get single order failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<List<OrderDetailData>>> getHistoryOrders(int page,
      {DateTime? start, DateTime? end}) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()!.id,
      'lang': LocalStorage.instance.getLanguage()?.locale ?? 'en',
      'page': page,
      'status': 'delivered',
      'perPage': 10,
      if (start != null)
        'delivery_date_from': DateFormat('yyyy-MM-dd').format(start),
      if (end != null) 'delivery_date_to': DateFormat('yyyy-MM-dd').format(end),
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/deliveryman/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderPaginateResponse.fromJson(response.data).data ?? [],
      );
    } catch (e) {
      debugPrint('==> get delivered orders failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<dynamic>> setCurrentOrder(int? orderId) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client
          .post('/api/v1/dashboard/deliveryman/orders/$orderId/current');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> get delivered orders failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
