import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../state/become_seller_state.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class BecomeSellerNotifier extends StateNotifier<BecomeSellerState> {
  final SettingsRepository _settingsRepository;
  final ShopsRepository _shopsRepository;
  String _name = '';
  String _description = '';
  String _tax = '';
  String _deliveryRange = '';
  String _phone = '';
  String _minAmount = '';

  BecomeSellerNotifier(this._settingsRepository, this._shopsRepository)
      : super(BecomeSellerState(addressController: TextEditingController()));

  Future<void> createShop(
    BuildContext context,
    LatLng? latLng, {
    VoidCallback? checkYourNetwork,
    VoidCallback? fetchProfileDetails,
    VoidCallback? logoIsRequired,
    VoidCallback? backgroundIsRequired,
    VoidCallback? openTimeIsRequired,
    VoidCallback? closeTimeIsRequired,
  }) async {
    if (await AppConnectivity.connectivity()) {
      if (state.logoPath.isEmpty) {
        logoIsRequired?.call();
        return;
      }
      if (state.backgroundPath.isEmpty) {
        backgroundIsRequired?.call();
        return;
      }
      if (state.openTime==null) {
        openTimeIsRequired?.call();
        return;
      }
      if (state.closeTime==null) {
        closeTimeIsRequired?.call();
        return;
      }
      state = state.copyWith(isLoading: true);
      String? logoImage;
      String? backgroundImage;
      final logoResponse = await _settingsRepository.uploadImage(
        state.logoPath,
        UploadType.shopsLogo,
      );
      logoResponse.when(
        success: (data) {
          logoImage = data.imageData?.title;
        },
        failure: (fail, errorData) {
          debugPrint('===> upload logo image failure: $fail');
        },
      );
      final backgroundResponse = await _settingsRepository.uploadImage(
        state.backgroundPath,
        UploadType.shopsBack,
      );
      backgroundResponse.when(
        success: (data) {
          backgroundImage = data.imageData?.title;
        },
        failure: (fail, errorData) {
          debugPrint('===> upload background image failure: $fail');
        },
      );
      final response = await _shopsRepository.createShop(
        tax: double.tryParse(_tax),
        deliveryRange: double.tryParse(_deliveryRange),
        latitude: latLng?.latitude ??
            (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude),
        longitude: latLng?.longitude ??
            (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
        phone: _phone,
        openTime: DateFormat.Hm().format(state.openTime!),
        closeTime: DateFormat.Hm().format(state.closeTime!),
        name: _name,
        description: _description,
        minPrice: double.tryParse(_minAmount),
        address: state.addressController!.text,
        logoImage: logoImage,
        backgroundImage: backgroundImage,
      );
      response.when(
        success: (data) {
          Navigator.pop(context);
          state = state.copyWith(isLoading: false);
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> create shop fail: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> fetchLocationName(BuildContext context, LatLng? latLng) async {
    try {
      final Place place = await Nominatim.reverseSearch(
        lat: latLng?.latitude ??
            (AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude),
        lon: latLng?.longitude ??
            (AppHelpers.getInitialLongitude() ?? AppConstants.demoLongitude),
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      state.addressController?.text = place.displayName;
    } catch (e) {
      state.addressController?.text = '';
    }
  }

  void setDeliveryRange(String range) {
    _deliveryRange = range.trim();
  }

  void setTax(String tax) {
    _tax = tax.trim();
  }

  void setMinAmount(String amount) {
    _minAmount = amount.trim();
  }

  void setCloseTime(DateTime time) {
    state = state.copyWith(closeTime: time);
  }

  void setOpenTime(DateTime time) {
    state = state.copyWith(openTime: time);
  }

  void setDescription(String description) {
    _description = description.trim();
  }

  void setPhone(String phone) {
    _phone = phone.trim();
  }

  void setName(String name) {
    _name = name.trim();
  }

  void setLogo(String path) {
    state = state.copyWith(logoPath: path);
  }

  void setBackground(String path) {
    state = state.copyWith(backgroundPath: path);
  }
}
