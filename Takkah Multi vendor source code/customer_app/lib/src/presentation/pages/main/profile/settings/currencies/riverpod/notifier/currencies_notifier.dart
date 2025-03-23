import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/currencies_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';

class CurrenciesNotifier extends StateNotifier<CurrenciesState> {
  final SettingsRepository _settingsRepository;

  CurrenciesNotifier(this._settingsRepository) : super(const CurrenciesState());

  Future<void> getCurrencies({
    VoidCallback? checkYourNetwork,
  }) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      state = state.copyWith(
        isLoading: true,
        currencies: [],
        selectedCurrency: null,
      );
      final response = await _settingsRepository.getCurrencies();
      response.when(
        success: (data) {
          final List<CurrencyData> currencies = data.data ?? [];
          final currency = LocalStorage.instance.getSelectedCurrency();
          int index = 0;
          for (int i = 0; i < currencies.length; i++) {
            if (currencies[i].id == currency?.id) {
              index = i;
              break;
            }
          }
          state = state.copyWith(
            isLoading: false,
            currencies: currencies,
            selectedCurrency: currencies.isEmpty ? null : currencies[index],
          );
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> error with currencies fetching $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setSelectedCurrency(CurrencyData? currency) {
    state = state.copyWith(selectedCurrency: currency);
  }

  Future<void> changeCurrency({
    VoidCallback? afterUpdating,
    VoidCallback? checkYourNetwork,
  }) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      LocalStorage.instance.setSelectedCurrency(state.selectedCurrency);
      afterUpdating?.call();
    } else {
      checkYourNetwork?.call();
    }
  }
}
