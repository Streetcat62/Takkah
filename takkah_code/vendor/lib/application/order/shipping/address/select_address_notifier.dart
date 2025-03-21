import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../domain/interface/orders_repository.dart';
import '../../../../infrastructure/models/data/user_address_model.dart';
import '../../../../infrastructure/services/app_constants.dart';
import '../../../../infrastructure/services/app_helpers.dart';
import 'select_address_state.dart';


class SelectAddressNotifier extends StateNotifier<SelectAddressState> {
  Timer? _timer;
  final OrdersRepository _ordersRepository;

  SelectAddressNotifier(this._ordersRepository)
      : super(SelectAddressState(textController: TextEditingController()));

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

  void setTitle(String value) {
    state = state.copyWith(title: value.trim());
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
      location: Location(latitude: '${place.lat}', longitude: '${place.lon}'),
    );
  }

  Future<void> goToMyLocation({double? long, double? lat}) async {
    state = state.copyWith(searchedPlaces: [], isSearching: false);
    Place? place;

    try {
      place = await Nominatim.reverseSearch(
        lat: lat,
        lon: long,
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
        location: Location(latitude: '${place.lat}', longitude: '${place.lon}'),
      );
    }
  }

  Future<void> findMyLocation() async {
    Position position = await determinePosition();
    state.mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(position.latitude, position.longitude),
          tilt: 0,
          zoom: 17,
        ),
      ),
    );
    state = state.copyWith(
      location: Location(
          latitude: '${position.latitude}', longitude: '${position.longitude}'),
    );
    goToMyLocation(lat: position.latitude, long: position.longitude);
  }

  Future<void> saveLocalAddress(
    bool? hasBack, {
    VoidCallback? onBack,
    VoidCallback? onGoMain,
  }) async {
    clearSearchField();
    state.mapController?.dispose();
  }

  Future<void> fetchLocationName(LatLng? latLng) async {
    state = state.copyWith(
      location: Location(
        latitude: '${latLng?.latitude}',
        longitude: '${latLng?.longitude}',
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

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
  

  Future<void> addAddressToUser(
    BuildContext context, {
    VoidCallback? onSuccess,
    required String uuId,
  }) async {
    state = state.copyWith(isAddAddressLoading: true);
    var response = await _ordersRepository.addLocationToUser(
        address: state.textController?.text ?? '',
        location: state.location,
        title: state.title ?? '',
        uuId: uuId);
    response.when(
      success: (data) {
        state = state.copyWith(isAddAddressLoading: false);

        onSuccess?.call();
      },
      failure: (error, status) {
        debugPrint('====> add address fail $error');
        AppHelpers.showCheckTopSnackBar(context,
            text: AppHelpers.trans(
              status.toString(),
            ),
            type: SnackBarType.error);
      },
    );
  }
}
