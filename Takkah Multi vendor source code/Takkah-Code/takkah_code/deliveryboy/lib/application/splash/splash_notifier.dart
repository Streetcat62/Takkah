import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'splash_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/models/models.dart';
import '../../infrastructure/services/services.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  final SettingsRepository _settingsRepository;
  final UserRepository _userRepository;

  SplashNotifier(this._settingsRepository, this._userRepository)
      : super(const SplashState());

  Future<void> _updateFirebaseToken() async {
    String? fcmToken;
    try {
      fcmToken = await FirebaseMessaging.instance.getToken();
    } catch (e) {
      debugPrint('===> error with getting firebase token $e');
    }
    _userRepository.updateFirebaseToken(fcmToken);
  }

  Future<void> fetchDriverDetails() async {
    final response = await _userRepository.getDriverDetails();
    response.when(
      success: (data) {
        LocalStorage.instance.setDriverInfo(data);
        LocalStorage.instance.setOnline(data.data?.online ?? false);
      },
      failure: (failure, status) {
        debugPrint('==> error with fetching profile $failure $status');
      },
    );
  }

  Future<void> _fetchGlobalSettings() async {
    final response = await _settingsRepository.getGlobalSettings();
    response.when(
      success: (data) {
        LocalStorage.instance.setSettingsList(data.data ?? []);
      },
      failure: (failure, status) {
        debugPrint('==> error with fetching settings $failure');
      },
    );
  }

  Future<void> _fetchCurrencies() async {
    final response = await _settingsRepository.getCurrencies();
    response.when(
      success: (data) {
        int defaultCurrencyIndex = 0;
        final List<CurrencyData> currencies = data.data ?? [];
        for (int i = 0; i < currencies.length; i++) {
          if (currencies[i].isDefault ?? false) {
            defaultCurrencyIndex = i;
            break;
          }
        }
        LocalStorage.instance
            .setSelectedCurrency(currencies[defaultCurrencyIndex]);
      },
      failure: (failure, status) {
        debugPrint('==> error with fetching currencies $failure');
      },
    );
  }

  Future<void> _fetchProfileDetails() async {
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.instance.setUser(data.data);
        if (data.data?.wallet != null) {
          LocalStorage.instance.setWallet(data.data?.wallet);
        }
      },
      failure: (failure, status) {
        debugPrint('==> error with fetching profile $failure');
      },
    );
  }

  Future<void> fetchTranslations({
    VoidCallback? noConnection,
    VoidCallback? goMain,
    VoidCallback? goLogin,
  }) async {
    _fetchGlobalSettings();
    if (await AppConnectivity.connectivity()) {
      final response = await _settingsRepository.getTranslations();
      response.when(
        success: (data) {
          LocalStorage.instance.setTranslations(data.data);
        },
        failure: (failure, status) {
          debugPrint('==> error with fetching translations $failure');
        },
      );
      if (LocalStorage.instance.getToken().isNotEmpty) {
        goMain?.call();
        _fetchProfileDetails();
        _updateFirebaseToken();
        fetchDriverDetails();
      } else {
        goLogin?.call();
      }
      if (LocalStorage.instance.getSelectedCurrency() == null) {
        _fetchCurrencies();
      }
    } else {
      noConnection?.call();
    }
  }
}
