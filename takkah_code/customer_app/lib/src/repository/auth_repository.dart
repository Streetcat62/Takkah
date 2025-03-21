import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginResponse>> sendNewUserInfo({
    required String email,
    required String firstname,
    required String lastname,
    required String password,
    required String confirmPassword,
    required String birthday,
  });

  Future<ApiResult<void>> verifyEmailOtp({required String code});

  Future<ApiResult<void>> sendEmailOtp({required String email});

  Future<ApiResult<EnterPhoneResponse>> sendOtp({required String phone});

  Future<ApiResult<LoginResponse>> loginWithSocial({
    String? email,
    String? displayName,
    String? id,
  });

  Future<ApiResult<LoginResponse>> login({
    required String email,
    required String password,
  });
}
