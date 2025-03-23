import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/models.dart';
import '../../domain/di/injection.dart';
import '../../domain/handlers/handlers.dart';
import '../../domain/interface/interfaces.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<ApiResult<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    final data = {'email': email, 'password': password};
    debugPrint('==> login request ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post('/api/v1/auth/login', data: data);
      return ApiResult.success(data: LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> login failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
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
    debugPrint('===> login with social request $data');
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/google/callback',
        queryParameters: data,
      );
      return ApiResult.success(data: LoginResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> login with google failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<RegisterResponse>> sendOtp({required String phone}) async {
    final data = {'phone': phone};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/register',
        data: data,
      );
      return ApiResult.success(data: RegisterResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> send otp failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<VerifyPhoneResponse>> verifyPhone({
    required String verifyId,
    required String verifyCode,
  }) async {
    final data = {'verifyId': verifyId, 'verifyCode': verifyCode};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/verify/phone',
        data: data,
      );
      return ApiResult.success(
          data: VerifyPhoneResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> verify phone failure: $e');
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }

  @override
  Future<ApiResult<void>> forgotPassword({required String email}) async {
    final data = {'email': email};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      await client.post('/api/v1/auth/forgot/email-password', data: data);
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> forgot password failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<LoginResponse>> forgotPasswordConfirm({
    required String verifyCode,
  }) async {
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/forgot/email-password/$verifyCode',
      );
      return ApiResult.success(
        data: LoginResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> forgot password confirm failure: $e');
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> sigUp({
    required String phone,
  }) async {
    final data = SignUpRequest(
      phone: phone,
    );
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/auth/register',
        data: data,
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      return ApiResult.failure(
          error: NetworkExceptions.getDioException(e),
          statusCode: NetworkExceptions.getDioStatus(e));
    }
  }
}
