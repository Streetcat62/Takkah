import 'dart:convert';

import 'package:flutter/material.dart';

import '../../models/data/shop_delivery_list.dart';
import '../repository.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../core/constants/constants.dart';

class ShopsRepositoryImpl implements ShopsRepository {
  @override
  Future<ApiResult<void>> createShop({
    required double latitude,
    required double longitude,
    required String phone,
    required String openTime,
    required String closeTime,
    required String name,
    required String description,
    required String address,
    double? tax,
    double? deliveryRange,
    double? minPrice,
    String? logoImage,
    String? backgroundImage,
  }) async {
    final data = {
      'tax': tax,
      'delivery_range': deliveryRange,
      'location': '$latitude,$longitude',
      'phone': phone,
      'open_time': openTime,
      'close_time': closeTime,
      'title': {'en': name},
      'description': {'en': description},
      'min_price': minPrice,
      'address': {'en': address},
      if (backgroundImage != null && logoImage != null)
        'images': [backgroundImage, logoImage],
    };
    debugPrint('===> create shop body: ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post('/api/v1/dashboard/user/shops', data: data);
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> create shop error: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopDeliveryList>> getShopDeliveries(
    List<int> shopIds,
  ) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
      // 'address[longitude]' : AppHelpers.getActiveLocalAddress()?.location?.longitude,
      // 'address[latitude]' : AppHelpers.getActiveLocalAddress()?.location?.latitude,
    };
    for (int i = 0; i < shopIds.length; i++) {
      data['shops[$i]'] = shopIds[i];
    }
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/deliveries',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopDeliveryList.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get shops deliveries error: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getPickupShops() async {
    final data = {
      'address[longitude]' : AppHelpers.getActiveLocalAddress()?.location?.longitude,
      'address[latitude]' : AppHelpers.getActiveLocalAddress()?.location?.latitude,
      'delivery': 'pickup',
      'perPage': 100,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get pickup shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getNewShops() async {
    final data = {
      'sort': 'desc',
      'perPage': 100,
      'address[longitude]' : AppHelpers.getActiveLocalAddress()?.location?.longitude,
      'address[latitude]' : AppHelpers.getActiveLocalAddress()?.location?.latitude,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get new shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getWork247Shops() async {
    final data = {
      'always_open': 1,
      'perPage': 100,
      'lang': LocalStorage.instance.getLanguage()?.locale,
      'address[longitude]' : AppHelpers.getActiveLocalAddress()?.location?.longitude,
      'address[latitude]' : AppHelpers.getActiveLocalAddress()?.location?.latitude,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get work 24/7 shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getNearbyShops({
    double? latitude,
    double? longitude,
  }) async {
    final data = {
      'address[longitude]' : AppHelpers.getActiveLocalAddress()?.location?.longitude,
      'address[latitude]' : AppHelpers.getActiveLocalAddress()?.location?.latitude,
      'clientLocation':
          '${latitude ?? AppConstants.demoLatitude},${longitude ?? AppConstants.demoLongitude}',
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/nearby',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get nearby shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getOpenNowShops() async {
    final data = {
      'open': 1,
      'perPage': 100,
      'address[longitude]' : AppHelpers.getActiveLocalAddress()?.location?.longitude,
      'address[latitude]' : AppHelpers.getActiveLocalAddress()?.location?.latitude,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get open shops error: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopGroupsResponse>> getShopGroups({int? page}) async {
    final data = {
      'lang': LocalStorage.instance.getLanguage()?.locale,
      if (page != null) 'page': page,
      'address[longitude]' : AppHelpers.getActiveLocalAddress()?.location?.longitude,
      'address[latitude]' : AppHelpers.getActiveLocalAddress()?.location?.latitude,
      'perPage': 100,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/groups',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopGroupsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get shop groups failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProductsPaginateResponse>> getBannerProducts(
    int? bannerId,
  ) async {
    final data = {
      'lang': LocalStorage.instance.getLanguage()?.locale,
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/banners/$bannerId/products',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ProductsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get banner products failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<BannersPaginateResponse>> getBannersPaginate(
    BannerType bannerType, {
    int? page,
    int? shopId,
  }) async {
    final data = {
      'type': bannerType == BannerType.look ? 'look' : 'banner',
      'perPage': page != null ? 10 : 100,
      if (page != null) 'page': page,
      if (shopId != null) 'shop_id': shopId,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/banners/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: BannersPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get banners paginate failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleShopResponse>> getShopDetailsById({
    int? shopId,
  }) async {
    final data = {'lang': LocalStorage.instance.getLanguage()?.locale};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/byId/$shopId',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleShopResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get single shop failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getFilteredShops({
    int? page,
    int? groupId,
    ShopDeliveryType? deliveryType,
  }) async {
    // String? delivery;
    // switch (deliveryType) {
    //   case ShopDeliveryType.delivery:
    //     delivery = 'delivery';
    //     break;
    //   case ShopDeliveryType.pickup:
    //     delivery = 'pickup';
    //     break;
    //   default:
    //     delivery = null;
    //     break;
    // }
    final data = {
      'lang': LocalStorage.instance.getLanguage()?.locale,
      'currency_id' : LocalStorage.instance.getSelectedCurrency()?.id,
      if (page != null) 'page': page,
      if (groupId != null) 'group_id': groupId,
     //if (delivery != null) 'delivery': delivery,
      'address[longitude]' : AppHelpers.getActiveLocalAddress()?.location?.longitude,
      'address[latitude]' : AppHelpers.getActiveLocalAddress()?.location?.latitude,
      'perPage': 8,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e , s) {
      debugPrint('==> get filtered shops failure: $e');
      debugPrint('==> get filtered shops failure: $s');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> getShopsByIds(
    List<int> shopIds,
  ) async {
    final data = <String, dynamic>{
      'lang': LocalStorage.instance.getLanguage()?.locale,
      'address[longitude]' : AppHelpers.getActiveLocalAddress()?.location?.longitude,
      'address[latitude]' : AppHelpers.getActiveLocalAddress()?.location?.latitude,
    };
    for (int i = 0; i < shopIds.length; i++) {
      data['shops[$i]'] = shopIds[i];
    }
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get shops by ids failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ShopsPaginateResponse>> searchShops({String? query}) async {
    final data = {
      'search': query,
      'perPage': 5,
      'address[longitude]' : AppHelpers.getActiveLocalAddress()?.location?.longitude,
      'address[latitude]' : AppHelpers.getActiveLocalAddress()?.location?.latitude,
      'lang': LocalStorage.instance.getLanguage()?.locale,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.get(
        '/api/v1/rest/shops/search',
        queryParameters: data,
      );
      return ApiResult.success(
        data: ShopsPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> search shops failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
