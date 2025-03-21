import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:location/location.dart' as location;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../state/add_address_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';

class AddAddressNotifier extends StateNotifier<AddAddressState> {
  Timer? _timer;

  AddAddressNotifier()
      : super(AddAddressState(textController: TextEditingController()));

  void setQuery(BuildContext context) {
    if (state.textController?.text.trim().isNotEmpty ?? false) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          searchLocations();
        },
      );
    }
  }

  Future<void> searchLocations() async {
    state = state.copyWith(isSearching: true, isSearchLoading: true);
    try {
      final result = await Nominatim.searchByName(
        query: state.textController?.text.trim() ?? '',
        limit: 5,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      state = state.copyWith(searchedPlaces: result, isSearchLoading: false);
    } catch (e) {
      debugPrint('===> search location error $e');
      state = state.copyWith(isSearchLoading: false);
    }
  }

  void clearSearchField() {
    state.textController?.clear();
    state = state.copyWith(searchedPlaces: [], isSearching: false);
  }

  void setMapController(GoogleMapController controller) {
    state = state.copyWith(mapController: controller);
  }

  void setChoosing(bool value) {
    state = state.copyWith(isChoosing: value, isSearching: false);
  }

  void goToLocation({required Place place}) {
    state = state.copyWith(isSearching: false);
    state.textController?.text = place.displayName;
    state.mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(place.lat, place.lon),
          tilt: 0,
          zoom: 17,
        ),
      ),
    );
    state = state.copyWith(
      location: LocalLocationData(latitude: place.lat, longitude: place.lon),
    );
  }

  Future<void> goToMyLocation(location.LocationData locationData) async {
    state = state.copyWith(searchedPlaces: [], isSearching: false);
    Place? place;
    try {
      place = await Nominatim.reverseSearch(
        lat: locationData.latitude,
        lon: locationData.longitude,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      state.textController?.text = place.displayName;
    } catch (e) {
      debugPrint('===> go to my location error: $e');
      state.textController?.text = '';
    }
    if (place != null) {
      state.mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            bearing: 0,
            target: LatLng(place.lat, place.lon),
            tilt: 0,
            zoom: 17,
          ),
        ),
      );
      state = state.copyWith(
        location: LocalLocationData(latitude: place.lat, longitude: place.lon),
      );
    }
  }

  Future<void> findMyLocation() async {
    location.LocationData? myLocationData;
    final locationInstance = location.Location();
    bool serviceEnabled;
    location.PermissionStatus permissionGranted;
    serviceEnabled = await locationInstance.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationInstance.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await locationInstance.hasPermission();
    if (permissionGranted == location.PermissionStatus.denied) {
      permissionGranted = await locationInstance.requestPermission();
      if (permissionGranted != location.PermissionStatus.granted) {
        return;
      }
    }
    try {
      myLocationData = await locationInstance.getLocation();
    } catch (e) {
      myLocationData = null;
    }
    if (myLocationData != null) {
      goToMyLocation(myLocationData);
    }
  }

  Future<void> goToTappedLocation(LatLng latLng) async {
    state = state.copyWith(searchedPlaces: [], isSearching: false);
    Place? place;
    try {
      place = await Nominatim.reverseSearch(
        lat: latLng.latitude,
        lon: latLng.longitude,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      state.textController?.text = place.displayName;
    } catch (e) {
      state.textController?.text = '';
    }
    state.mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: latLng,
          tilt: 0,
          zoom: 17,
        ),
      ),
    );
    state = state.copyWith(
      location: LocalLocationData(
        latitude: latLng.latitude,
        longitude: latLng.longitude,
      ),
    );
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  Future<void> saveLocalAddress(
    bool? hasBack, {
    VoidCallback? onBack,
    VoidCallback? onGoMain,
  }) async {
    final List<LocalAddressData> localAddresses =
        LocalStorage.instance.getLocalAddressesList();
    for (int i = 0; i < localAddresses.length; i++) {
      if (localAddresses[i].isSelected ?? false) {
        final updated = localAddresses[i].copyWith(isSelected: false);
        localAddresses[i] = updated;
      }
    }
    localAddresses.insert(
      0,
      LocalAddressData(
        title: state.title,
        location: state.location,
        address: state.textController?.text,
        isDefault: false,
        isSelected: true,
      ),
    );
    LocalStorage.instance.setLocalAddressesList(localAddresses);
    if (hasBack ?? false) {
      onBack?.call();
    } else {
      LocalStorage.instance.setAddressSelected(true);
      onGoMain?.call();
    }
    clearSearchField();
    state.mapController?.dispose();
  }

  Future<void> fetchLocationName(LatLng? latLng) async {
    state = state.copyWith(
      location: LocalLocationData(
        latitude: latLng?.latitude,
        longitude: latLng?.longitude,
      ),
    );
    Place? place;
    try { 
      place = await Nominatim.reverseSearch(
        lat: latLng?.latitude,
        lon: latLng?.longitude,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      state.textController?.text = place.displayName;
    } catch (e) {
      state.textController?.text = '';
    }
  }
}
