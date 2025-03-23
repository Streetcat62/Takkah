import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../state/login_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';
import '../../../../../../core/handlers/handlers.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  LoginNotifier(this._authRepository, this._userRepository)
      : super(const LoginState());

  Future<void> loginWithGoogle(
    BuildContext context, {
    VoidCallback? checkYourNetwork,
    Function(String)? errorOccurred,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
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
          LocalStorage.instance.setToken(data.data?.accessToken ?? '');
          LocalStorage.instance.setUser(data.data?.user);
          getProfileDetails(
            checkYourNetwork: () {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
              );
            },
          );
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> error with getting firebase token');
          }
          _userRepository.updateFirebaseToken(fcmToken);
          final addressResponse = await _userRepository.getUserAddresses();
          addressResponse.when(
            success: (addressData) {
              state = state.copyWith(isGoogleLoading: false);
              if (saveAddressesToLocal(addressData.data)) {
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
          if (errorOccurred != null) {
            errorOccurred(fail.toString());
          }
          final GoogleSignIn signIn = GoogleSignIn();
          signIn.disconnect();
          signIn.signOut();
        },
      );
    } else {
      checkYourNetwork?.call();
    }
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

  void setShowPassword(bool show) {
    state = state.copyWith(showPassword: show);
  }

  Future<void> login(
    BuildContext context, {
    VoidCallback? checkYourNetwork,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
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
          LocalStorage.instance.setToken(data.data?.accessToken);
          getProfileDetails(
            checkYourNetwork: () {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
              );
            },
          );
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> getting firebase token error: $e');
          }
          _userRepository.updateFirebaseToken(fcmToken);
          final addressResponse = await _userRepository.getUserAddresses();
          addressResponse.when(
            success: (addressData) async {
              state = state.copyWith(isLoading: false);
              if (saveAddressesToLocal(addressData.data)) {
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
          state = state.copyWith(isLoading: false, isLoginError: true);
          if (fail == const NetworkExceptions.unauthorisedRequest()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.emailNotVerifiedYet),
            );
          }
          debugPrint('==> login failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> getProfileDetails({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isProfileDetailsLoading: true);
      final response = await _userRepository.getProfileDetails();
      response.when(
        success: (data) async {
          LocalStorage.instance.setUser(data.data);
          if (data.data?.wallet != null) {
            LocalStorage.instance.setWallet(data.data?.wallet);
          }
          state = state.copyWith(isProfileDetailsLoading: false);
        },
        failure: (fail, errorData) {
          state = state.copyWith(isProfileDetailsLoading: false);
          debugPrint('==> get profile details failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> loginWithFacebook(
    BuildContext context, {
    VoidCallback? checkYourNetwork,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
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
              getProfileDetails(
                checkYourNetwork: () {
                  AppHelpers.showCheckFlash(
                    context,
                    AppHelpers.getTranslation(
                        TrKeys.checkYourNetworkConnection),
                  );
                },
              );
              String? fcmToken;
              try {
                fcmToken = await FirebaseMessaging.instance.getToken();
              } catch (e) {
                debugPrint('===> getting firebase token error: $e');
              }
              _userRepository.updateFirebaseToken(fcmToken);
              final addressResponse = await _userRepository.getUserAddresses();
              addressResponse.when(
                success: (addressData) async {
                  state = state.copyWith(isLoading: false);
                  if (saveAddressesToLocal(addressData.data)) {
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
        }
      } catch (e) {
        state = state.copyWith(isFacebookLoading: false);
        debugPrint('===> login with facebook exception: $e');
      }
    } else {
      checkYourNetwork?.call();
    }
  }

  // Future<void> loginWithFacebook(BuildContext context) async {
  //   final connected = await AppConnectivity.connectivity();
  //   if (connected) {
  //     state = state.copyWith(isFacebookLoading: true);
  //     AccessToken? accessToken = await FacebookAuth.instance.accessToken;
  //     if (accessToken != null) {
  //       final LoginResult loginResult = await FacebookAuth.instance.login();
  //       if (loginResult.status == LoginStatus.success) {
  //         final userData = await FacebookAuth.instance.getUserData();
  //         debugPrint('==> facebook auth email: ${userData['email']}');
  //         debugPrint('==> facebook auth name: ${userData['name']}');
  //         debugPrint('==> facebook auth id: ${userData['id']}');
  //       }
  //       accessToken = loginResult.accessToken;
  //     } else {
  //       final userData = await FacebookAuth.instance.getUserData();
  //       debugPrint('==> facebook auth email: ${userData['email']}');
  //       debugPrint('==> facebook auth name: ${userData['name']}');
  //       debugPrint('==> facebook auth id: ${userData['id']}');
  //     }
  //     state = state.copyWith(isFacebookLoading: false);
  //   } else {
  //     if (mounted) {
  //       AppHelpers.showCheckFlash(
  //         context,
  //         AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
  //       );
  //     }
  //   }
  // }

  bool saveAddressesToLocal(List<AddressData>? data) {
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

  Future<void> skipForNow(BuildContext context) async {
    LocalStorage.instance.setIsGuest(true);
    if (LocalStorage.instance.getLocalAddressesList().isEmpty) {
      context.replaceRoute(AddAddressRoute(isRequired: true));
    } else {
      context.replaceRoute(const MainRoute());
    }
  }
}
