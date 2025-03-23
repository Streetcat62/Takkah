import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'shop_markers_state.freezed.dart';

@freezed
class ShopMarkersState with _$ShopMarkersState {
  const factory ShopMarkersState({
    @Default({}) Map<MarkerId, Marker> markers,
  }) = _ShopMarkersState;

  const ShopMarkersState._();
}
