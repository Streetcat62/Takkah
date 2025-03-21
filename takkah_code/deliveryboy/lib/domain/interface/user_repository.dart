import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../handlers/handlers.dart';
import '../../infrastructure/models/models.dart';

abstract class UserRepository {
  Future<ApiResult<DriverResponse>> getDriverDetails();

  Future<ApiResult<StatisticsResponse>> getDriverStatistics();

  Future<ApiResult<ProfileResponse>> updateGeneralInfo({
    required String firstName,
    String? lastName,
    String? phone,
    String? email,
    String? password,
    String? confirmPassword,
  });

  Future<ApiResult<DriverResponse>> editCarInfo({
    required String type,
    required String brand,
    required String model,
    required String number,
    required String color,
    String? imageUrl,
  });

  Future<ApiResult<StatisticsIncomeResponse>> getStatistics({
    required DateTime startTime,
    required DateTime endTime,
  });

  Future<ApiResult<StatisticsOrderResponse>> getStatisticsOrder(
      {DateTime? startTime, DateTime? endTime, int? page, int? perPage});

  Future<ApiResult<ProfileResponse>> getProfileDetails();

  Future<ApiResult<dynamic>> setOnline();

  Future<ApiResult<dynamic>> setCurrentLocation(LatLng location);

  Future<ApiResult<ProfileResponse>> editProfile({required EditProfile? user});

  Future<ApiResult<ProfileResponse>> updateProfileImage({
    String? firstName,
    String? imageUrl,
  });

  Future<ApiResult<ProfileResponse>> updatePassword({
    required String password,
    required String passwordConfirmation,
  });

  Future<ApiResult<void>> updateFirebaseToken(String? token);

  Future<ApiResult<OrderDetailModel>> setOrder(String orderId);

  Future<ApiResult<OrderPaginateResponse>> fetchCurrentOrder();

  Future<ApiResult<OrderDetailModel>> updateOrder(int? orderId, String? status);

  Future<ApiResult<void>> addReview(
    int orderId, {
    required double rating,
    String? comment,
  });
}
