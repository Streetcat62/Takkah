import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'reset_password_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/services/services.dart';

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final AuthRepository _authRepository;
  String _email = '';

  ResetPasswordNotifier(this._authRepository)
      : super(const ResetPasswordState());

  void setEmail(String text) {
    if (state.isEmailError) {
      state = state.copyWith(isEmailError: false);
    }
    _email = text.trim();
  }

  Future<void> sendCode({
    VoidCallback? checkYourNetwork,
    ValueSetter<String>? success,
    ValueSetter<String>? error,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await _authRepository.forgotPassword(email: _email);
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false);
          success?.call(_email);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false, isEmailError: true);
          error?.call(status.toString());
          debugPrint('==> send otp failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
