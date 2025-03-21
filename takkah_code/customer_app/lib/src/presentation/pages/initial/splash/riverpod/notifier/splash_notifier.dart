import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/splash_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  final SettingsRepository _settingsRepository;
  final UserRepository _userRepository;

  SplashNotifier(this._settingsRepository, this._userRepository)
      : super(const SplashState());

  Future<void> getProfileDetails() async {
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.instance.setUser(data.data);
        if (data.data?.wallet != null) {
          LocalStorage.instance.setWallet(data.data?.wallet);
        }
      },
      failure: (fail, errorData) {
        debugPrint('==> error with fetching profile $fail');
      },
    );
  }

  Future<void> fetchSettings({
    VoidCallback? goMain,
    VoidCallback? goLogin,
    VoidCallback? goToSelectLang,
    VoidCallback? goToOnBoarding,
    VoidCallback? goToAddAddress,
  }) async {
    final response = await _settingsRepository.getGlobalSettings();
    response.when(
      success: (data) {
        LocalStorage.instance.setSettingsList(data.data ?? []);
      },
      failure: (fail, errorData) {
        debugPrint('==> error with settings fetched');
      },
    );
    final storage = LocalStorage.instance;
    if (storage.getLangSelected()) {
      if (storage.getToken().isEmpty) {
        if (storage.getIsGuest()) {
          if (storage.getAddressSelected()) {
            goMain?.call();
          } else {
            goToAddAddress?.call();
          }
        } else {
          goLogin?.call();
        }
      } else {
        if (storage.getAddressSelected()) {
          goMain?.call();
        } else {
          goToAddAddress?.call();
        }
      }
    } else {
      goToSelectLang?.call();
    }
  }

  Future<void> getTranslations() async {
    final response = await _settingsRepository.getMobileTranslations();
    response.when(
      success: (data) {
        LocalStorage.instance.setTranslations(data.data);
      },
      failure: (fail, errorData) {
        debugPrint('==> error with fetching translations $fail');
      },
    );
  }

  Future<void> fetchCurrencies() async {
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
      failure: (fail, errorData) {
        debugPrint('==> error with fetching currencies $fail');
      },
    );
  }
}
