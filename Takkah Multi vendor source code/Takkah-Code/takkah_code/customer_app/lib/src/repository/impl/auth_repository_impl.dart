import 'dart:convert';

import 'package:flutter/material.dart';

import '../repository.dart';
import '../../models/models.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<ApiResult<LoginResponse>> sendNewUserInfo({
    required String email,
    required String firstname,
    required String lastname,
    required String password,
    required String confirmPassword,
    required String birthday,
  }) async {
    final data = {
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'password': password,
      'password_confirmation': confirmPassword,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response =
          await client.post('/api/v1/auth/after-verify', data: data);
      return ApiResult.success(data: LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('===> send new user info error $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> verifyEmailOtp({required String code}) async {
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      await client.get('/api/v1/auth/verify/$code');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> verify email otp failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> sendEmailOtp({required String email}) async {
    final data = {'email': email};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      await client.post('/api/v1/auth/register', queryParameters: data);
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> send email otp failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<EnterPhoneResponse>> sendOtp({required String phone}) async {
    final data = {'phone': phone};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post('/api/v1/auth/register', data: data);
      return ApiResult.success(
        data: EnterPhoneResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> send otp failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<LoginResponse>> loginWithSocial({
    String? email,
    String? displayName,
    String? id,
  }) async {
    final data = {
      if (email != null) 'email': email,
      if (displayName != null) 'name': displayName,
      if (id != null) 'id': id,
    };
    debugPrint('===> login request ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/google/callback',
        data: data,
      );
      return ApiResult.success(data: LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> login with social failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    final data = {'email': email, 'password': password};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/login',
        queryParameters: data,
      );
      return ApiResult.success(
        data: LoginResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> login failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
