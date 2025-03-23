import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'token_interceptor.dart';
import '../../infrastructure/services/services.dart';

class HttpService {
  Dio client({bool requireAuth = false, bool routing = false}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: routing ? AppConstants.drawingBaseUrl : AppConstants.baseUrl,
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
        sendTimeout: 60 * 1000,
        headers: {
          'Accept':
              'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8',
          'Content-type': 'application/json'
        },
      ),
    )..interceptors.add(TokenInterceptor(requireAuth: requireAuth));
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
    return dio;
  }
}
