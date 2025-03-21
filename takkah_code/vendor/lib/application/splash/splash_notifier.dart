import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'splash_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/models/models.dart';
import '../../infrastructure/services/services.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  final SettingsRepository _settingsRepository;
  final UsersRepository _userRepository;

  SplashNotifier(this._settingsRepository, this._userRepository)
      : super(const SplashState());

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
      failure: (failure,status) {
        debugPrint('==> error with fetching currencies $failure');
      },
    );
  }

  Future<void> fetchProfileDetails() async {
    final response = await _userRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.instance.setUser(data.data);
        if (data.data?.wallet != null) {
          LocalStorage.instance.setWallet(data.data?.wallet);
        }
      },
      failure: (failure,status) {
        debugPrint('==> error with fetching profile $failure');
      },
    );
  }

  Future<void> fetchGlobalSettings() async {
    final response = await _settingsRepository.getGlobalSettings();
    response.when(
      success: (data) {
        LocalStorage.instance.setSettingsList(data.data ?? []);
      },
      failure: (failure,status) {
        debugPrint('==> error with fetching settings $failure');
      },
    );
  }

  Future<void> getActiveLanguages(
    BuildContext context, {
    VoidCallback? goMain,
    VoidCallback? goLogin,
  }) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      final storage = LocalStorage.instance;
      if (storage.getToken().isEmpty) {
        goLogin?.call();
      } else {
        goMain?.call();
      }
    }
  }

  Future<void> fetchTranslations({
    VoidCallback? noConnection,
    VoidCallback? goMain,
    VoidCallback? goLogin,
  }) async {
    if (await AppConnectivity.connectivity()) {
      final response = await _settingsRepository.getTranslations();
      response.when(
        success: (data) {
          LocalStorage.instance.setTranslations(data.data);
        },
        failure: (failure,status) {
          debugPrint('==> error with fetching translations $failure');
        },
      );
      fetchGlobalSettings();
      if (LocalStorage.instance.getToken().isNotEmpty) {
        goMain?.call();
        fetchProfileDetails();
      } else {
        goLogin?.call();
      }
      if (LocalStorage.instance.getSelectedCurrency() == null) {
        fetchCurrencies();
      }
    } else {
      noConnection?.call();
    }
  }
}
