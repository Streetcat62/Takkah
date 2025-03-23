import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../state/saved_locations_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';
import '../../../../../../core/constants/constants.dart';

class SavedLocationsNotifier extends StateNotifier<SavedLocationsState> {
  final UserRepository _userRepository;

  SavedLocationsNotifier(this._userRepository)
      : super(const SavedLocationsState());

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future<void> makeDefaultAddress(LocalAddressData address) async {
    int? selectedIndex;
    int? addressIndex;
    List<LocalAddressData> addresses = List.from(state.addresses);
    for (int i = 0; i < addresses.length; i++) {
      if (addresses[i].isSelected ?? false) {
        selectedIndex = i;
      }
      if (address == addresses[i]) {
        addressIndex = i;
      }
    }
    if (selectedIndex != null) {
      addresses[selectedIndex] =
          addresses[selectedIndex].copyWith(isSelected: false);
    }
    if (addressIndex != null) {
      addresses[addressIndex] =
          addresses[addressIndex].copyWith(isSelected: true);
    }
    LocalStorage.instance.setLocalAddressesList(addresses);
    state = state.copyWith(addresses: addresses);
  }

  Future<void> checkValidLocation(
      {
        required BuildContext context,
        required LocalAddressData? addressData,
        required VoidCallback? onSuccess,
      }) async{
    state = state.copyWith(isUpdating: true);
    if (addressData != null) {
      final response = await _userRepository.checkLocation(
          long: addressData.location?.longitude,
          lang: addressData.location?.latitude
      );

      response.when(
        success: (data) async {
          makeDefaultAddress(addressData);
          state = state.copyWith(isUpdating: false);
          onSuccess?.call();
        },
        failure: (fail, errorData) {
          AppHelpers.showCheckFlash(context, "Order unable to take this location");
          state = state.copyWith(isUpdating: false);
          debugPrint('==> checkLocation addresses failure: $fail');
          return;
        },
      );
    }
  }


  Future<void> checkNewLocation({required LocalAddressData? addressData}) async {
    state = state.copyWith(isNewLoading: true);
    if(addressData != null) {
      final response = await _userRepository.checkLocation(
          long: addressData.location?.longitude ?? AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude,
          lang: addressData.location?.latitude ?? AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude,
      );
      response.when(
          success: (data) async {
            state = state.copyWith(isNewLoading: false, isValid: true);
          },
          failure: (fail, errorData) {
            state = state.copyWith(isNewLoading: false, isValid: false);
          },
      );
    }
  }


  Future<void> fetchSavedLocations() async {
    state = state.copyWith(isLoading: true, addresses: []);
    final List<LocalAddressData> localAddresses =
        LocalStorage.instance.getLocalAddressesList();
    final Uint8List? customIcon = await getBytesFromAsset(AppAssets.pngIcLocationPin, 150);
    const MarkerId markerId = MarkerId('markerId');
    List<Map<MarkerId, Marker>> listOfMarkers = [];
    for (int i = 0; i < localAddresses.length; i++) {
      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
          localAddresses[i].location?.latitude ??
              (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude),
          localAddresses[i].location?.longitude ??
              (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
        ),
        draggable: false,
        icon: BitmapDescriptor.fromBytes(customIcon!),
      );
      final Map<MarkerId, Marker> markerData = {};
      markerData[markerId] = marker;
      listOfMarkers.add(markerData);
    }
    state = state.copyWith(
      isLoading: false,
      addresses: localAddresses,
      listOfMarkers: listOfMarkers,
    );
  }

  Future<void> deleteAddress(LocalAddressData address) async {
    int? index;
    final List<LocalAddressData> addresses = List.from(state.addresses);
    state = state.copyWith(isUpdating: true);
    if (address.id != null) {
      final response = await _userRepository.deleteAddress(address.id!);
      response.when(
        success: (data) async {
          for (int i = 0; i < addresses.length; i++) {
            if (address.id == addresses[i].id) {
              index = i;
              break;
            }
          }
        },
        failure: (fail, errorData) {
          state = state.copyWith(isUpdating: false);
          debugPrint('==> delete addresses failure: $fail');
          return;
        },
      );
    }
    if (index != null) {
      addresses.removeAt(index!);
    } else {
      addresses.remove(address);
    }
    LocalStorage.instance.setLocalAddressesList(addresses);
    state = state.copyWith(isUpdating: false, addresses: addresses);
  }
}
