import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/utils/app_helpers.dart';
import '../state/verify_code_state.dart';
import '../../../../../../../../repository/repository.dart';

class VerifyCodeNotifier extends StateNotifier<VerifyCodeState> {
  final AuthRepository _authRepository;
  Timer? _timer;
  int _initialTime = 300;

  VerifyCodeNotifier(this._authRepository) : super(const VerifyCodeState());

  Future<void> checkOtp(BuildContext context, {VoidCallback? success}) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _authRepository.verifyEmailOtp(code: state.confirmCode);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckFlash (context, AppHelpers.getTranslation(
            TrKeys
                .verificationIncorrect));
        debugPrint('===> check otp fail $fail');
      },
    );
  }

  void setCode(String? code) {
    state = state.copyWith(
      confirmCode: code?.trim() ?? '',
      isCodeError: false,
      isConfirm: code.toString().length == 6,
    );
  }

  void setValidation() {
    state = state.copyWith(isCodeError: true);
  }

  void disposeTimer() {
    _timer?.cancel();
  }

  void startTimer() {
    _timer?.cancel();
    _initialTime = 300;
    state = state.copyWith(confirmCode: '', isCodeError: false);
    if (_timer != null) {
      _initialTime = 300;
      _timer?.cancel();
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_initialTime < 1) {
          _timer?.cancel();
          state = state.copyWith(isTimeExpired: true);
        } else {
          _initialTime--;
          state = state.copyWith(
            isTimeExpired: false,
            timerText: _formatHHMMSS(_initialTime),
          );
        }
      },
    );
  }

  String _formatHHMMSS(int seconds) {
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }
}
