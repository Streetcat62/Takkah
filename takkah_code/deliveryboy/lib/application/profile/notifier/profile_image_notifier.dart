import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/profile_image_state.dart';
import '../../../../domain/interface/interfaces.dart';
import '../../../../infrastructure/services/services.dart';

class ProfileImageNotifier extends StateNotifier<ProfileImageState> {
  final UserRepository _userRepository;
  final SettingsRepository _settingsRepository;

  ProfileImageNotifier(this._userRepository, this._settingsRepository)
      : super(const ProfileImageState());

  void setCarImagePath(String path) {
    state = state.copyWith(carImagePath: path, carImageUrl: null);
  }

  Future<void> updateProfileImage({
    required BuildContext context,
    required String path,
    String? firstname,
  }) async {
    String? url;
    final imageResponse =
        await _settingsRepository.uploadImage(path, UploadType.users);
    imageResponse.when(
      success: (data) {
        url = data.imageData?.title;
      },
      failure: (failure, status) {
        debugPrint('==> upload profile image failure: $failure');
        AppHelpers.showCheckTopSnackBar(
          context,
          AppHelpers.getTranslation(status.toString()),
        );
      },
    );
    if (url == null) {
      return;
    }
    final response = await _userRepository.updateProfileImage(
      imageUrl: url,
      firstName: firstname,
    );
    response.when(
      success: (data) {
        LocalStorage.instance.setUser(data.data);
        setUrl(data.data?.img);
      },
      failure: (failure, status) {
        debugPrint('==> update profile image failure: $failure');
        AppHelpers.showCheckTopSnackBar(
          context,
          AppHelpers.getTranslation(status.toString()),
        );
      },
    );
  }

  Future<void> editCarImage(
    BuildContext context, {
    required String path,
  }) async {
    final imageResponse =
        await _settingsRepository.uploadImage(path, UploadType.deliveryCar);
    imageResponse.when(
      success: (data) {
        state = state.copyWith(carImageUrl: data.imageData?.title);
      },
      failure: (failure, status) {
        debugPrint('==> upload profile image failure: $failure');
        AppHelpers.showCheckTopSnackBar(
          context,
          AppHelpers.getTranslation(status.toString()),
        );
      },
    );
  }

  void setUrlCar() {
    state = state.copyWith(
      carImageUrl: (LocalStorage.instance
                  .getDriverInfo()
                  ?.data
                  ?.galleries
                  ?.isNotEmpty ??
              false)
          ? LocalStorage.instance.getDriverInfo()?.data?.galleries?.first.path
          : null,
      carImagePath: '',
    );
  }

  void changePhoto({
    String? path,
    String? firstname,
    required BuildContext context,
  }) {
    state = state.copyWith(path: path, imageUrl: null);
    if (path != null) {
      updateProfileImage(path: path, firstname: firstname, context: context);
    }
  }

  void setUrl(String? url) {
    state = state.copyWith(path: null, imageUrl: url);
  }
}
