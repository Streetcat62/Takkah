import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../infrastructure/models/data/order_detail.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool isGoUser,
    @Default(false) bool isGoRestaurant,
    @Default(false) bool isScrolling,
    @Default(false) bool isApproveLoading,
    @Default([]) List<LatLng> polylineCoordinates,
    @Default([]) List<LatLng> endPolylineCoordinates,
    @Default({}) Set<Marker> markers,
    OrderDetailData? orderDetail,
  }) = _HomeState;

  const HomeState._();
}
