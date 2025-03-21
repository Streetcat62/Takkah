import 'package:dio/dio.dart';

import 'token_interceptor.dart';
import '../../infrastructure/services/services.dart';

class HttpService {
  Dio client({bool requireAuth = false,bool chatGpt = false}) => Dio(
        BaseOptions(
          baseUrl: chatGpt ? "https://api.openai.com" : AppConstants.baseUrl,
          connectTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          sendTimeout: 60 * 1000,
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json'
          },
        ),
      )
        ..interceptors.add(TokenInterceptor(requireAuth: requireAuth,chatGPT: chatGpt))
        ..interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
}
