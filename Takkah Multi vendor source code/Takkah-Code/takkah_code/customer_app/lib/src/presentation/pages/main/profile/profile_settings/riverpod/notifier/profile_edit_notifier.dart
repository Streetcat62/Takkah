import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/profile_edit_state.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class ProfileEditNotifier extends StateNotifier<ProfileEditState> {
  final UserRepository _userRepository;

  ProfileEditNotifier(this._userRepository) : super(const ProfileEditState());

  Future<void> updateGeneralInfo({
    VoidCallback? checkYourNetwork,
    VoidCallback? updated,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.updateGeneralInfo(
        firstName: state.firstname.trim(),
        lastName: state.lastname.trim(),
        birthdate: state.birthday,
        gender: state.male,
        phone: state.isPhoneEditable ? state.phone : null,
        email: state.isEmailEditable ? state.email : null,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false);
          updated?.call();
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> update profile details failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setMale(String value) {
    state = state.copyWith(male: value);
  }

  Future<void> updatePassword({
    VoidCallback? checkYourNetwork,
    VoidCallback? afterUpdated,
    VoidCallback? afterFailure,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
    } else {
      checkYourNetwork?.call();
    }
  }

  void setInitialInfo({
    String? firstname,
    String? lastname,
    String? phone,
    String? email,
    String? birthday,
    String? male,
  }) {
    state = state.copyWith(
      firstname: firstname ?? '',
      lastname: lastname ?? '',
      phone: phone ?? '',
      email: email ?? '',
      isEmailEditable: email?.isEmpty ?? true,
      isPhoneEditable: phone?.isEmpty ?? true,
      birthday: birthday ?? '',
      male: male ?? '',
    );
  }

  void setFirstname(String value) {
    state = state.copyWith(firstname: value.trim());
  }

  void setLastname(String value) {
    state = state.copyWith(lastname: value.trim());
  }

  void setBirthday(DateTime? date) {
    final String formattedDate =
        DateFormat('yyyy-MM-dd').format(date ?? DateTime.now());
    state = state.copyWith(birthday: formattedDate);
  }

  void setPhone(String value) {
    state = state.copyWith(phone: value.trim());
  }

  void setEmail(String value) {
    state = state.copyWith(email: value.trim());
  }
}
