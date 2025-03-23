import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../state/shop_markers_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/constants/constants.dart';

class ShopMarkersNotifier extends StateNotifier<ShopMarkersState> {
  ShopMarkersNotifier() : super(const ShopMarkersState());

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future<void> fetchMarkers(List<ShopData>? shops) async {
    Map<MarkerId, Marker> markers = {};
    for (int i = 0; i < (shops ?? []).length; i++) {
      final Uint8List? customIcon =
          await getBytesFromAsset(AppAssets.pngIcLocationPin, 150);
      final MarkerId markerId = MarkerId('$i-${shops?[i].id}');
      final latitude = double.tryParse(shops?[i].location?.latitude ?? '') ??
          (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude);
      final longitude = double.tryParse(shops?[i].location?.longitude ?? '') ??
          (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude);
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(latitude, longitude),
        icon: BitmapDescriptor.fromBytes(customIcon!),
        infoWindow: InfoWindow(
          title: shops?[i].translation?.title?.toUpperCase(),
          snippet:
              '${AppHelpers.getTranslation(TrKeys.workingHours)}: ${AppHelpers.checkWorkDate(shops![i].shopWorkingDay)}',
        ),
      );
      markers[markerId] = marker;
    }
    state = state.copyWith(markers: markers);
  }
}
