import 'dart:convert';

import 'package:flutter/material.dart';

import '../repository.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<ApiResult<void>> deleteUser() async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.delete('/api/v1/dashboard/user/profile/delete');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete profile failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updateGeneralInfo({
    required String firstName,
    String? lastName,
    String? birthdate,
    String? gender,
    String? phone,
    String? email,
  }) async {
    final data = {
      'firstname': firstName,
      if (lastName != null) 'lastname': lastName,
      if (gender != null) 'gender': gender,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (birthdate != null) 'birthday': birthdate,
      if (gender != null) 'gender': gender,
    };
    debugPrint('===> update general info data ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/user/profile/update',
        data: data,
      );
      return ApiResult.success(
        data: ProfileResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> update profile details failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<WalletHistoriesResponse>> getWalletHistories({
    int? page,
  }) async {
    final data = {
      if (page != null) 'page': page,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/wallet/histories',
        queryParameters: data,
      );
      return ApiResult.success(
        data: WalletHistoriesResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get wallet histories failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updatePassword({
    String? password,
    String? passwordConfirmation,
  }) async {
    final data = {
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/profile/password/update',
        data: data,
      );
      return ApiResult.success(data: ProfileResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> update password failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updateProfileImage({
    String? firstName,
    String? imageUrl,
  }) async {
    final data = {
      'firstname': firstName,
      'images': [imageUrl],
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/user/profile/update',
        data: data,
      );
      return ApiResult.success(data: ProfileResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> update profile image failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> getProfileDetails() async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/profile/show',
        queryParameters: data,
      );
      return ApiResult.success(data: ProfileResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get profile details failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> updateFirebaseToken(String? token) async {
    final data = {if (token != null) 'firebase_token': token};
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/profile/firebase/token/update',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update firebase token failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<AddressesResponse>> getUserAddresses() async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/user/addresses');
      return ApiResult.success(
        data: AddressesResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get addresses failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> deleteAddress(int addressId) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.delete('/api/v1/dashboard/user/addresses/$addressId');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> delete address failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleAddressResponse>> createAddress(
    LocalAddressData? address,
  ) async {
    final data = {
      'address': address?.address,
      'location':
          '${address?.location?.latitude},${address?.location?.longitude}',
      'active': 1,
      'title': address?.title,
      'default': (address?.isSelected ?? false) ? 1 : 0,
    };
    debugPrint('===> create address data ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/addresses',
        data: data,
      );
      return ApiResult.success(
        data: SingleAddressResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create address failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> checkLocation({required double? long, required double? lang}) async {
    final data = {
      'address[longitude]' : long,
      'address[latitude]' : lang,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      await client.get('/api/v1/rest/shop/delivery-zone/check/distance/', queryParameters: data);
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> send checkLocation failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }


}
