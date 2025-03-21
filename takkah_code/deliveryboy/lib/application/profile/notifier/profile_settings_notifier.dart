import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/profile_settings_state.dart';
import '../../../../domain/interface/interfaces.dart';
import '../../../../infrastructure/models/models.dart';
import '../../../../infrastructure/services/services.dart';

class ProfileSettingsNotifier extends StateNotifier<ProfileSettingsState> {
  final UserRepository _userRepository;

  ProfileSettingsNotifier(this._userRepository)
      : super(const ProfileSettingsState());

  Future<void> fetchProfileDetails({
    ValueSetter<String?>? setImage,
    ValueSetter<UserData?>? setUserData,
    VoidCallback? checkYourNetwork,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.getProfileDetails();
      response.when(
        success: (data) {
          state = state.copyWith(userData: data.data, isLoading: false);
          if (setImage != null) {
            setImage(data.data?.img);
          }
          if (setUserData != null) {
            setUserData(data.data);
          }
          LocalStorage.instance.setUser(data.data);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get profile details failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void updateState() {
    state = state.copyWith(statistics: state.statistics);
  }

  Future<void> fetchProfileStatistics(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final response = await _userRepository.getDriverStatistics();
    response.when(
      success: (data) {
        state = state.copyWith(statistics: data, isLoading: false);
      },
      failure: (fail, status) {
        state = state.copyWith(isLoading: false);
        debugPrint('===> profile statistics fail $fail');
        AppHelpers.showCheckTopSnackBar(
          context,
          AppHelpers.getTranslation(status.toString()),
        );
      },
    );
  }
}
