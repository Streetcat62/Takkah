import 'package:flutter/material.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../infrastructure/models/data/user_address_model.dart';



part 'select_address_state.freezed.dart';

@freezed
class SelectAddressState with _$SelectAddressState {
  const factory SelectAddressState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isChoosing,
    @Default(false) bool isAddAddressLoading,
    @Default([]) List<Place> searchedPlaces,
    TextEditingController? textController,
    @Default(null) String? title,
    GoogleMapController? mapController,
    Location? location,
  }) = _SelectAddressState;

  const SelectAddressState._();
}
