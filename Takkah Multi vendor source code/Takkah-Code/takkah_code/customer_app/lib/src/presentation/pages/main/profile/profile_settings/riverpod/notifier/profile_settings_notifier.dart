import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'profile_edit_notifier.dart';
import 'profile_image_notifier.dart';
import '../state/profile_settings_state.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/handlers/handlers.dart';

class ProfileSettingsNotifier extends StateNotifier<ProfileSettingsState> {
  final UserRepository _userRepository;

  ProfileSettingsNotifier(this._userRepository)
      : super(const ProfileSettingsState());

  Future<void> fetchProfileDetails({
    VoidCallback? checkYourNetwork,
    VoidCallback? unauthorised,
    ProfileImageNotifier? imageNotifier,
    ProfileEditNotifier? editNotifier,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.getProfileDetails();
      response.when(
        success: (data) {
          state = state.copyWith(userData: data.data, isLoading: false);
          imageNotifier?.setUrl(data.data?.img);
          editNotifier?.setInitialInfo(
            firstname: data.data?.firstname,
            lastname: data.data?.lastname,
            phone: data.data?.phone,
            email: data.data?.email,
            birthday: data.data?.birthday?.substring(0, 10),
            male: data.data?.gender,
          );
          LocalStorage.instance.setUser(data.data);
          if (data.data?.wallet != null) {
            LocalStorage.instance.setWallet(data.data?.wallet);
          }
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          if (fail == const NetworkExceptions.unauthorisedRequest()) {
            unauthorised?.call();
          }
          debugPrint('==> get profile details failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
