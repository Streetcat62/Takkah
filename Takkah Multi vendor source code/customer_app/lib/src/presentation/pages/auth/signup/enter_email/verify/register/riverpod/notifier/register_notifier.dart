import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../state/register_state.dart';
import '../../../../../../../../../models/models.dart';
import '../../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../../repository/repository.dart';
import '../../../../../../../../../core/routes/app_router.gr.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  String _password = '';
  String _confirmPassword = '';
  String _firstname = '';
  String _lastname = '';

  RegisterNotifier(this._authRepository, this._userRepository)
      : super(const RegisterState());

  Future<void> registerWithFacebook(
    BuildContext context, {
    VoidCallback? checkYourNetwork,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isFacebookLoading: true);
      final fb = FacebookLogin();
      try {
        final user = await fb.logIn(
          permissions: [
            FacebookPermission.publicProfile,
            FacebookPermission.email,
          ],
        );
        if (user.status == FacebookLoginStatus.success) {
          final email = await fb.getUserEmail();
          final profile = await fb.getUserProfile();
          final response = await _authRepository.loginWithSocial(
            email: email ?? '',
            displayName: '${profile?.firstName} ${profile?.lastName}',
            id: user.accessToken?.userId ?? '',
          );
          response.when(
            success: (data) async {
              LocalStorage.instance.setToken(data.data?.accessToken ?? '');
              LocalStorage.instance.setUser(data.data?.user);
              _fetchProfile();
              _updateFirebaseToken();
              final addressResponse = await _userRepository.getUserAddresses();
              addressResponse.when(
                success: (addressData) {
                  state = state.copyWith(isLoading: false);
                  if (_saveAddressesToLocal(addressData.data)) {
                    context.replaceRoute(const MainRoute());
                  } else {
                    context.replaceRoute(AddAddressRoute(isRequired: true));
                  }
                },
                failure: (addressFail, addressErrorData) {
                  state = state.copyWith(isLoading: false);
                  debugPrint('==> address failure: $addressFail');
                },
              );
            },
            failure: (fail, errorData) {},
          );
        } else {
          state = state.copyWith(isFacebookLoading: false);
          debugPrint('===> login with facebook fail: ${user.status}');
        }
      } catch (e) {
        state = state.copyWith(isFacebookLoading: false);
        debugPrint('===> login with facebook exception: $e');
      }
    } else {
      checkYourNetwork?.call();
    }
  }

  bool _saveAddressesToLocal(List<AddressData>? data) {
    if (data == null || data.isEmpty) {
      return false;
    } else {
      int activeIndex = 0;
      final List<LocalAddressData> localAddresses = [];
      for (int i = 0; i < data.length; i++) {
        final double? latitude =
            double.tryParse(data[i].location?.latitude ?? '');
        final double? longitude =
            double.tryParse(data[i].location?.longitude ?? '');
        if (latitude != null && longitude != null) {
          final local = LocalAddressData(
            id: data[i].id,
            title: data[i].title,
            address: data[i].address,
            location: LocalLocationData(
              latitude: double.parse(data[i].location?.latitude ?? ''),
              longitude: double.parse(data[i].location?.longitude ?? ''),
            ),
            isDefault: false,
            isSelected: false,
          );
          localAddresses.add(local);
          if (data[i].isDefault ?? false) {
            activeIndex = i;
          }
        }
      }
      final local = localAddresses[activeIndex]
          .copyWith(isSelected: true, isDefault: true);
      localAddresses[activeIndex] = local;
      LocalStorage.instance.setLocalAddressesList(localAddresses);
      LocalStorage.instance.setAddressSelected(true);
      return true;
    }
  }

  Future<void> registerWithGoogle(
    BuildContext context, {
    ValueSetter<String>? errorOccurred,
  }) async {
    state = state.copyWith(isGoogleLoading: true);
    GoogleSignInAccount? googleUser;
    try {
      googleUser = await GoogleSignIn().signIn();
    } catch (e) {
      state = state.copyWith(isGoogleLoading: false);
      debugPrint('===> register with google exception: $e');
      errorOccurred?.call(e.toString());
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
        LocalStorage.instance.setToken(data.data?.accessToken ?? '');
        LocalStorage.instance.setUser(data.data?.user);
        _fetchProfile();
        _updateFirebaseToken();
        final addressResponse = await _userRepository.getUserAddresses();
        addressResponse.when(
          success: (addressData) {
            state = state.copyWith(isGoogleLoading: false);
            if (_saveAddressesToLocal(addressData.data)) {
              context.replaceRoute(const MainRoute());
            } else {
              context.replaceRoute(AddAddressRoute(isRequired: true));
            }
          },
          failure: (addressFail, addressErrorData) {
            state = state.copyWith(isLoading: false);
            debugPrint('==> address failure: $addressFail');
          },
        );
      },
      failure: (fail, errorData) {
        state = state.copyWith(isGoogleLoading: false);
        debugPrint('===> register google fail $fail');
        errorOccurred?.call(fail.toString());
        final GoogleSignIn signIn = GoogleSignIn();
        signIn.disconnect();
        signIn.signOut();
      },
    );
  }

  void setBirthday(DateTime? date) {
    final String formattedDate =
        DateFormat('yyyy-MM-dd').format(date ?? DateTime.now());
    state = state.copyWith(birthdate: formattedDate);
  }

  Future<void> _fetchProfile() async {
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.instance.setUser(data.data);
        LocalStorage.instance.setWallet(data.data?.wallet);
      },
      failure: (fail, errorData) {
        debugPrint('===> fetch profile fail $fail');
      },
    );
  }

  Future<void> _updateFirebaseToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    _userRepository.updateFirebaseToken(fcmToken);
  }

  void setPassword(String text) {
    _password = text.trim();
  }

  void setConfirmPassword(String text) {
    _confirmPassword = text.trim();
  }

  void setFirstname(String value) {
    _firstname = value.trim();
  }

  void setLastname(String value) {
    _lastname = value.trim();
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void toggleShowConfirmPassword() {
    state = state.copyWith(showConfirmPassword: !state.showConfirmPassword);
  }

  Future<void> register({
    required String email,
    VoidCallback? checkYourNetwork,
    VoidCallback? success,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await _authRepository.sendNewUserInfo(
        email: email,
        firstname: _firstname,
        lastname: _lastname,
        password: _password,
        confirmPassword: _confirmPassword,
        birthday: state.birthdate,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false);
          LocalStorage.instance.setToken(data.data?.token ?? '');
          LocalStorage.instance.setUser(data.data?.user);
          _updateFirebaseToken();
          _fetchProfile();
          success?.call();
        },
        failure: (fail, errorData) {
          debugPrint('===> register new user fail $fail');
          state = state.copyWith(isLoading: false);
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
