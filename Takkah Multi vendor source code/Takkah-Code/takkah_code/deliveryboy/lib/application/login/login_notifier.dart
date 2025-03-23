import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'login_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/services/services.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  LoginNotifier(this._authRepository, this._userRepository)
      : super(const LoginState());

  Future<void> loginWithGoogle({
    required BuildContext context,
    VoidCallback? checkYourNetwork,
    Function(String)? errorOccurred,
    VoidCallback? loginSuccess,
    VoidCallback? youAreNotDeliveryman,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isGoogleLoading: true);
      GoogleSignInAccount? googleUser;
      try {
        googleUser = await GoogleSignIn().signIn();
      } catch (e) {
        state = state.copyWith(isGoogleLoading: false);
        debugPrint('===> login with google exception: $e');
        if (errorOccurred != null) {
          errorOccurred(e.toString());
        }
      }
      if (googleUser == null) {
        state = state.copyWith(isGoogleLoading: false);
        return;
      }
      final response = await _authRepository.loginWithSocial(
        email: googleUser.email,
        displayName: googleUser.displayName,
        id: googleUser.id,
      );
      response.when(
        success: (data) async {
          if (data.data?.user?.role != 'deliveryman') {
            state = state.copyWith(isGoogleLoading: false);
            final GoogleSignIn signIn = GoogleSignIn();
            signIn.disconnect();
            signIn.signOut();
            youAreNotDeliveryman?.call();
            return;
          }
          LocalStorage.instance.setToken(data.data?.accessToken ?? '');
          await getProfileDetails(context);
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> error with getting firebase token $e');
          }
          _userRepository.updateFirebaseToken(fcmToken);
          state = state.copyWith(isGoogleLoading: false);
          loginSuccess?.call();
        },
        failure: (failure, status) {
          debugPrint('===> login error google $failure');
          state = state.copyWith(isGoogleLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> getProfileDetails(BuildContext context) async {
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.instance.setUser(data.data);
      },
      failure: (failure, status) {
        debugPrint('==> get profile details failure: $failure');
      },
    );
  }

  void setPassword(String text) {
    state = state.copyWith(
      password: text.trim(),
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setEmail(String text) {
    state = state.copyWith(
      email: text.trim(),
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void toggleKeepLogin() {
    state = state.copyWith(isKeepLogin: !state.isKeepLogin);
  }

  Future<void> login({
    required BuildContext context,
    VoidCallback? checkYourNetwork,
    VoidCallback? youAreNotDeliveryman,
    VoidCallback? loginSuccess,
  }) async {
    if (await AppConnectivity.connectivity()) {
      if (!AppValidators.isValidEmail(state.email)) {
        state = state.copyWith(isEmailNotValid: true);
        return;
      }
      if (!AppValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordNotValid: true);
        return;
      }
      state = state.copyWith(isLoading: true);
      final response = await _authRepository.login(
        email: state.email,
        password: state.password,
      );
      response.when(
        success: (data) async {
          if (data.data?.user?.role != 'deliveryman') {
            state = state.copyWith(isLoading: false, isLoginError: true);
            youAreNotDeliveryman?.call();
            return;
          }
          LocalStorage.instance.setToken(data.data?.accessToken ?? '');
          await getProfileDetails(context);
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> error with getting firebase token $e');
          }
          _userRepository.updateFirebaseToken(fcmToken);
          state = state.copyWith(isLoading: false);
          loginSuccess?.call();
        },
        failure: (failure, status) {
          debugPrint('===> login request failure $failure');
          state = state.copyWith(isLoading: false, isLoginError: true);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
