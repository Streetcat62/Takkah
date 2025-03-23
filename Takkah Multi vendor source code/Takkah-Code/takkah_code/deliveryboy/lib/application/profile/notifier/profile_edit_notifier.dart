import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/profile_edit_state.dart';
import '../../../../domain/interface/interfaces.dart';
import '../../../../infrastructure/models/models.dart';
import '../../../../infrastructure/services/services.dart';

class ProfileEditNotifier extends StateNotifier<ProfileEditState> {
  final UserRepository _userRepository;
  final SettingsRepository _settingsRepository;

  ProfileEditNotifier(this._userRepository, this._settingsRepository)
      : super(const ProfileEditState());

  void toggleShowConfirmPassword() {
    state = state.copyWith(showConfirmPassword: !state.showConfirmPassword);
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void setConfirmPassword(String value) {
    state = state.copyWith(
      confirmPassword: value.trim(),
      isConfirmPasswordError: false,
    );
  }

  void setPassword(String value) {
    state = state.copyWith(password: value.trim(), isPasswordError: false);
  }

  Future<void> updateGeneralInfo(
    BuildContext context, {
    VoidCallback? checkYourNetwork,
    VoidCallback? updated,
  }) async {
    if (state.firstname.trim().isEmpty) {
      state = state.copyWith(isFirstnameError: true);
      return;
    }
    if (state.lastname.trim().isEmpty) {
      state = state.copyWith(isLastnameError: true);
      return;
    }
    if (state.password.isNotEmpty && state.password.length < 6) {
      state = state.copyWith(isPasswordError: true);
      return;
    }
    if (state.confirmPassword != state.password) {
      state = state.copyWith(isConfirmPasswordError: true);
      return;
    }
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.updateGeneralInfo(
        firstName: state.firstname.trim(),
        lastName: state.lastname.trim(),
        phone: state.isPhoneEditable ? state.phone : null,
        email: state.isEmailEditable ? state.email : null,
        password: state.password.isEmpty ? null : state.password,
        confirmPassword: state.password.isEmpty ? null : state.confirmPassword,
      );
      response.when(
        success: (data) {
          LocalStorage.instance.setUser(data.data);
          state = state.copyWith(isLoading: false);
          updated?.call();
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
          debugPrint('==> update profile details failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
  void setInitialInfo(UserData? userData) {
    state = state.copyWith(
      firstname: userData?.firstname ?? '',
      lastname: userData?.lastname ?? '',
      phone: userData?.phone ?? '',
      email: userData?.email ?? '',
      isEmailEditable: userData?.email?.isEmpty ?? true,
      isPhoneEditable: userData?.phone?.isEmpty ?? true,
      isFirstnameError: false,
      isLastnameError: false,
      isPasswordError: false,
      isConfirmPasswordError: false,
      showPassword: false,
      showConfirmPassword: false,
      password: '',
      confirmPassword: '',
    );
  }

  void setFirstname(String value) {
    state = state.copyWith(firstname: value.trim(), isFirstnameError: false);
  }

  void setLastname(String value) {
    state = state.copyWith(lastname: value.trim(), isLastnameError: false);
  }

  void setPhone(String value) {
    state = state.copyWith(phone: value.trim());
  }

  void setEmail(String value) {
    state = state.copyWith(email: value.trim());
  }

  Future<void> editCarInfo(
    BuildContext context, {
    VoidCallback? checkYourNetwork,
    VoidCallback? updated,
    required String type,
    required String brand,
    required String model,
    required String number,
    required String color,
    String? path,
    String? carImageUrl,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      String? imageUrl;
      if (carImageUrl == null) {
        final imageResponse =
            await _settingsRepository.uploadImage(path ?? '', UploadType.deliveryCar);
        imageResponse.when(
          success: (data) {
            imageUrl = data.imageData?.title;
          },
          failure: (fail, status) {
            debugPrint('==> upload car image fail: $fail');
            AppHelpers.showCheckTopSnackBar(
              context,
              AppHelpers.getTranslation(status.toString()),
            );
          },
        );
      }

      final response = await _userRepository.editCarInfo(
        type: type,
        brand: brand,
        model: model,
        number: number,
        color: color,
        imageUrl: imageUrl ?? carImageUrl,
      );
      response.when(
        success: (data) {
          LocalStorage.instance.setDriverInfo(data);
          LocalStorage.instance.setOnline(data.data?.online ?? false);
          state = state.copyWith(isLoading: false);
          updated?.call();
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
          debugPrint('==> update profile details failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckTopSnackBar(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }
}
