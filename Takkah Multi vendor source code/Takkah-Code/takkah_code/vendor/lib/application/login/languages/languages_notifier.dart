import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'languages_state.dart';
import '../../../domain/interface/interfaces.dart';
import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/services/services.dart';

class LanguagesNotifier extends StateNotifier<LanguagesState> {
  final SettingsRepository _settingsRepository;

  LanguagesNotifier(this._settingsRepository) : super(const LanguagesState());

  Future<void> checkLanguage() async {
    if (LocalStorage.instance.getLanguageSelected()) {
      state = state.copyWith(isSelectLanguage: false, isLoading: false);
    } else {
      final response = await _settingsRepository.getLanguages();
      response.when(
        success: (data) {
          final List<LanguageData> languages = data.data ?? [];
          for (final language in languages) {
            if (language.isDefault == 1) {
              LocalStorage.instance.setSystemLanguage(language);
            }
          }
          state = state.copyWith(
            languages: languages,
            isSelectLanguage: true,
            isLoading: false,
          );
        },
        failure: (failure,status) {
          state = state.copyWith(isSelectLanguage: false, isLoading: false);
        },
      );
    }
  }

  void change(int index) {
    state = state.copyWith(index: index);
  }

  void makeSelectedLang({Function(LanguageData)? afterUpdate}) {
    final storage = LocalStorage.instance;
    storage.setLanguageSelected(true);
    storage.setLanguageData(state.languages[state.index]);
    storage.setLangLtr(state.languages[state.index].backward);
    getTranslations(
      afterUpdate: () {
        if (afterUpdate != null) {
          afterUpdate(state.languages[state.index]);
        }
      },
    );
  }

  Future<void> getTranslations({VoidCallback? afterUpdate}) async {
    state = state.copyWith(isLoading: true, isSelectLanguage: false);
    final response = await _settingsRepository.getTranslations();
    response.when(
      success: (data) {
        LocalStorage.instance.setTranslations(data.data);
        if (afterUpdate != null) {
          afterUpdate();
        }
        state = state.copyWith(isLoading: false);
      },
      failure: (failure,status) {
        state = state.copyWith(isLoading: false);
      },
    );
  }
}
