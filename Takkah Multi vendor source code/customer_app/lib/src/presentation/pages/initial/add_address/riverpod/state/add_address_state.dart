import 'package:flutter/material.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../models/models.dart';

part 'add_address_state.freezed.dart';

@freezed
class AddAddressState with _$AddAddressState {
  const factory AddAddressState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isChoosing,
    @Default([]) List<Place> searchedPlaces,
    @Default('') String title,
    TextEditingController? textController,
    GoogleMapController? mapController,
    LocalLocationData? location,
  }) = _AddAddressState;

  const AddAddressState._();
}
