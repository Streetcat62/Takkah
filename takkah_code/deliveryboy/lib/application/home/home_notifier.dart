import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'home_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/models/models.dart';
import '../../infrastructure/services/services.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final DrawRepository _drawRouting;
  final UserRepository _userRepository;
  final ImageCropperMarker image = ImageCropperMarker();

  HomeNotifier(this._drawRouting, this._userRepository)
      : super(const HomeState());

  Future<void>    setCurrentActiveOrder(
    BuildContext context, {
    OrderDetailData? order,
  }) async {
    if (order != null) {
      state = state.copyWith(orderDetail: order);
      LocalStorage.instance.setActiveOrderId(order.id);
      if (order.status == 'on_a_way') {
        getRoutingAll(context, order: order);
        state = state.copyWith(isGoRestaurant: false, isGoUser: true);
      } else {
        state = state.copyWith(isGoRestaurant: true, isGoUser: false);
        getRoutingAll(context, order: order);
      }
    } else {
      state = state.copyWith(
        orderDetail: null,
        isGoRestaurant: false,
        isGoUser: false,
      );
      LocalStorage.instance.setActiveOrderId(null);
    }
  }

  void updateState(int orderCount) {
      state = state.copyWith(isGoUser: false);
  }

  void scrolling(bool scroll) {
    state = state.copyWith(isScrolling: scroll);
  }

  Future<void> getRoutingAll(
    BuildContext context, {
    required OrderDetailData order,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(polylineCoordinates: [], markers: {});
      final start = LatLng(
        LocalStorage.instance.getAddressSelected()?.latitude ??
            AppConstants.demoLatitude,
        LocalStorage.instance.getAddressSelected()?.longitude ??
            AppConstants.demoLongitude,
      );
      final end = LatLng(
        double.tryParse(order.deliveryAddress?.location?.latitude ?? '0') ?? 0,
        double.tryParse(order.deliveryAddress?.location?.longitude ?? '0') ?? 0,
      );
      final marker = Marker(
        markerId: const MarkerId('User'),
        position: LatLng(
          double.tryParse(order.deliveryAddress?.location?.latitude ?? '0') ?? 0,
          double.tryParse(order.deliveryAddress?.location?.longitude ?? '0') ?? 0,
        ),
        icon: await image.resizeAndCircle(order.user?.img ?? '', 100),
      );
      final response = await _drawRouting.getRouting(start: start, end: end);
      response.when(
        success: (data) {
          List<LatLng> list = [];
          List ls = data.features[0].geometry.coordinates;
          for (int i = 0; i < ls.length; i++) {
            list.add(LatLng(ls[i][1], ls[i][0]));
          }
          state = state.copyWith(polylineCoordinates: list, markers: {marker});
        },

        failure: (failure, status) {
          state = state.copyWith(polylineCoordinates: [], markers: {});
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(
                AppHelpers.getTranslation(TrKeys.cannotFindARoute)),
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> getRouting({
    required BuildContext context,
    required LatLng start,
    required bool isOnline,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: state.isLoading);
      final response = await _userRepository.setCurrentLocation(start);
      response.when(
        success: (data) {},
        failure: (failure, status) {},
      );
    }
  }

  void setAlertOrderToActive(OrderDetailData? order) {
    state = state.copyWith(
      isGoRestaurant: true,
      isGoUser: false,
      isLoading: false,
      orderDetail: order,
    );
  }

  // Future<void> fetchCurrentOrder(BuildContext context) async {
  //   state = state.copyWith(isGoRestaurant: false, isGoUser: false);
  //   if (await AppConnectivity.connectivity()) {
  //     final response = await _userRepository.fetchCurrentOrder();
  //     response.when(
  //       success: (data) async {
  //         if (data.data?.isNotEmpty ?? false) {
  //           final currentOrder = data.data?.first;
  //           state = state.copyWith(orderDetail: currentOrder);
  //           if (currentOrder?.status == 'on_a_way') {
  //             getRoutingAll(
  //               context,
  //               start: LatLng(
  //                 LocalStorage.instance.getAddressSelected()?.latitude ??
  //                     AppConstants.demoLatitude,
  //                 LocalStorage.instance.getAddressSelected()?.longitude ??
  //                     AppConstants.demoLongitude,
  //               ),
  //               end: LatLng(
  //                 double.parse(currentOrder?.location?.latitude ?? '0'),
  //                 double.parse(currentOrder?.location?.longitude ?? '0'),
  //               ),
  //               market: Marker(
  //                 markerId: const MarkerId('User'),
  //                 position: LatLng(
  //                   double.parse(currentOrder?.location?.latitude ?? '0'),
  //                   double.parse(currentOrder?.location?.longitude ?? '0'),
  //                 ),
  //                 icon: await image.resizeAndCircle(
  //                     currentOrder?.user?.img ?? '', 100),
  //               ),
  //             );
  //             state = state.copyWith(isGoRestaurant: false, isGoUser: true);
  //           } else {
  //             state = state.copyWith(isGoRestaurant: true, isGoUser: false);
  //             getRoutingAll(
  //               context,
  //               start: LatLng(
  //                   LocalStorage.instance.getAddressSelected()?.latitude ??
  //                       AppConstants.demoLatitude,
  //                   LocalStorage.instance.getAddressSelected()?.longitude ??
  //                       AppConstants.demoLongitude),
  //               end: LatLng(
  //                 double.parse(currentOrder?.shop?.location?.latitude ?? '0'),
  //                 double.parse(currentOrder?.shop?.location?.longitude ?? '0'),
  //               ),
  //               market: Marker(
  //                 markerId: const MarkerId('Shop'),
  //                 position: LatLng(
  //                   double.parse(currentOrder?.shop?.location?.latitude ?? '0'),
  //                   double.parse(
  //                       currentOrder?.shop?.location?.longitude ?? '0'),
  //                 ),
  //                 icon: await image.resizeAndCircle(
  //                     currentOrder?.shop?.logoImg ?? '', 120),
  //               ),
  //             );
  //           }
  //         }
  //       },
  //       failure: (failure, status) {
  //         state = state.copyWith(isLoading: false);
  //         AppHelpers.showCheckTopSnackBar(
  //           context,
  //           AppHelpers.getTranslation(status.toString()),
  //         );
  //       },
  //     );
  //   } else {
  //     state = state.copyWith(isLoading: false);
  //     if (mounted) {
  //       AppHelpers.showNoConnectionSnackBar(context);
  //     }
  //   }
  // }

  Future<void> goClient(
    BuildContext context,
    int? orderId, {
    VoidCallback? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isApproveLoading: true);
      final response =
          await _userRepository.updateOrder(orderId ?? 0, 'on_a_way');
      response.when(
        success: (data) {
          state = state.copyWith(
            isGoUser: true,
            isGoRestaurant: false,
            isApproveLoading: false,
          );
          success?.call();
        },
        failure: (failure, status) {
          state = state.copyWith(isApproveLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> deliveredFinish(
    BuildContext context, {
    int? orderId,
    VoidCallback? success,
  }) async {
    state = state.copyWith(isApproveLoading: true);
    if (await AppConnectivity.connectivity()) {
      final response =
          await _userRepository.updateOrder(orderId ?? 0, 'delivered');
      response.when(
        success: (data) {
          state = state.copyWith(
            isGoUser: false,
            isGoRestaurant: false,
            polylineCoordinates: [],
            endPolylineCoordinates: [],
            markers: {},
          );
          success?.call();
        },
        failure: (failure, status) {
          state = state.copyWith(isApproveLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
