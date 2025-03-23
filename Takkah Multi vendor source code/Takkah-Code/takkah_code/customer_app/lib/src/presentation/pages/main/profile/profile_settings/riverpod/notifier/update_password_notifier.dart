import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/update_password_state.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class UpdatePasswordNotifier extends StateNotifier<UpdatePasswordState> {
  final UserRepository _userRepository;

  UpdatePasswordNotifier(this._userRepository)
      : super(const UpdatePasswordState());

  Future<void> updatePassword({
    VoidCallback? checkYourNetwork,
    VoidCallback? afterUpdated,
    VoidCallback? afterFailure,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (state.newPassword != state.confirmPassword) {
        state = state.copyWith(areTheSame: false);
        return;
      }
      state = state.copyWith(isSaving: true);
      final response = await _userRepository.updatePassword(
        password: state.newPassword,
        passwordConfirmation: state.confirmPassword,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isSaving: false);
          afterUpdated?.call();
        },
        failure: (fail, errorData) {
          state = state.copyWith(isSaving: false);
          afterFailure?.call();
          debugPrint('==> update profile image failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setShowNewPasswd(bool value) {
    state = state.copyWith(showNewPasswd: value);
  }

  void setShowConfirmPasswd(bool value) {
    state = state.copyWith(showConfirmPasswd: value);
  }

  void setConfirmPasswd(String value) {
    state = state.copyWith(confirmPassword: value.trim(), areTheSame: true);
  }

  void setNewPasswd(String value) {
    state = state.copyWith(newPassword: value.trim(), areTheSame: true);
  }
}
