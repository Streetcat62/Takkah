import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'reset_password_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/services/services.dart';

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final AuthRepository _authRepository;

  ResetPasswordNotifier(this._authRepository)
      : super(const ResetPasswordState());

  void setEmail(String text) {
    state = state.copyWith(email: text.trim(), isEmailError: false);
  }

  void setVerifyId(String? value) {
    state = state.copyWith(verifyId: value?.trim() ?? '');
  }

  Future<void> sendCode(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response =
          await _authRepository.forgotPassword(phone: state.email.trim());
      response.when(
        success: (data) async {
          state = state.copyWith(
            verifyId: data.data?.verifyId ?? '',
            isLoading: false,
          );
        },
        failure: (failure,status) {
          state = state.copyWith(isLoading: false, isEmailError: true);
          debugPrint('==> send otp failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckTopSnackBar(
          context,
          text: AppHelpers.trans(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }
}
