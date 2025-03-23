import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class UserRepository {

  Future<ApiResult<void>> deleteUser();

  Future<ApiResult<ProfileResponse>> updateGeneralInfo({
    required String firstName,
    String? lastName,
    String? birthdate,
    String? gender,
    String? phone,
    String? email,
  });

  Future<ApiResult<WalletHistoriesResponse>> getWalletHistories({int? page});

  Future<ApiResult<ProfileResponse>> updatePassword({
    String? password,
    String? passwordConfirmation,
  });

  Future<ApiResult<ProfileResponse>> updateProfileImage({
    String? firstName,
    String? imageUrl,
  });

  Future<ApiResult<ProfileResponse>> getProfileDetails();

  Future<ApiResult<AddressesResponse>> getUserAddresses();

  Future<ApiResult<void>> deleteAddress(int addressId);

  Future<ApiResult<void>> checkLocation({required double? long, required double? lang});

  Future<ApiResult<SingleAddressResponse>> createAddress(
    LocalAddressData? address,
  );

  Future<ApiResult<void>> updateFirebaseToken(String? token);
}
