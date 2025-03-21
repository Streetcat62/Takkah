import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'register_confirmation_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/services/services.dart';

class RegisterConfirmationNotifier
    extends StateNotifier<RegisterConfirmationState> {
  final AuthRepository _authRepository;
  Timer? _timer;
  int _initialTime = 300;

  RegisterConfirmationNotifier(this._authRepository)
      : super(const RegisterConfirmationState());

  void setCode(String? code) {
    state = state.copyWith(
      confirmCode: code?.trim() ?? '',
      isCodeError: false,
      isConfirm: code.toString().length == 4,
    );
  }

  Future<void> confirmCode(
    String verifyId, {
    VoidCallback? checkYourNetwork,
    VoidCallback? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await _authRepository.forgotPasswordConfirm(
        verifyId: verifyId,
        verifyCode: state.confirmCode.trim(),
      );
      response.when(
        success: (data) {
          LocalStorage.instance.setToken(data.data?.token);
          state = state.copyWith(isLoading: false);
          _timer?.cancel();
          success?.call();
        },
        failure: (failure,status) {
          state = state.copyWith(isLoading: false, isCodeError: true);

          debugPrint('==> confirm code failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> resendConfirmation(
    String email, {
    VoidCallback? checkYourNetwork,
    VoidCallback? failed,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isResending: true);
      final response = await _authRepository.sendOtp(phone: email.trim());
      response.when(
        success: (data) {
          state = state.copyWith(isResending: false);
          startTimer();
        },
        failure: (failure,status) {
          state = state.copyWith(isResending: false);
          debugPrint('==> send otp failure: $failure');
          failed?.call();
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void disposeTimer() {
    _timer?.cancel();
  }

  void startTimer() {
    _timer?.cancel();
    _initialTime = 300;
    state = state.copyWith(
      confirmCode: '',
      isCodeError: false,
    );
    if (_timer != null) {
      _initialTime = 300;
      _timer?.cancel();
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_initialTime < 1) {
          _timer?.cancel();
          state = state.copyWith(
            isTimeExpired: true,
          );
        } else {
          _initialTime--;
          state = state.copyWith(
            isTimeExpired: false,
            timerText: formatHHMMSS(_initialTime),
          );
        }
      },
    );
  }

  String formatHHMMSS(int seconds) {
    seconds = (seconds % 3600).truncate();
    final int minutes = (seconds / 60).truncate();
    final String minutesStr = (minutes).toString().padLeft(2, '0');
    final String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }
}
