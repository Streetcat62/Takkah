import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'languages_state.dart';
import '../../../domain/interface/interfaces.dart';
import '../../../infrastructure/models/models.dart';
import '../../../infrastructure/services/services.dart';

class LanguagesNotifier extends StateNotifier<LanguagesState> {
  final SettingsRepository _settingsRepository;

  LanguagesNotifier(this._settingsRepository) : super(const LanguagesState());

  Future<void> fetchLanguages(BuildContext context) async {
    if (state.languages.isEmpty) {
      state = state.copyWith(isLoading: true);
    }
    final response = await _settingsRepository.getLanguages();
    response.when(
      success: (data) {
        final List<LanguageData> languages = data.data ?? [];
        int index = 0;
        for (int i = 0; i < languages.length; i++) {
          if (languages[i].id == LocalStorage.instance.getLanguage()?.id) {
            index = i;
          }
        }
        state = state.copyWith(
          languages: data.data ?? [],
          index: index,
          isLoading: false,
        );
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(
          context,
          AppHelpers.getTranslation(status.toString()),
        );
      },
    );
  }

  Future<void> checkLanguage(BuildContext context) async {
    if (LocalStorage.instance.getLanguageSelected()) {
      state = state.copyWith(isSelectLanguage: false, isLoading: false);
    } else {
      final response = await _settingsRepository.getLanguages();
      response.when(
        success: (data) {
          state = state.copyWith(
            languages: data.data ?? [],
            isSelectLanguage: true,
            isLoading: false,
          );
        },
        failure: (failure, status) {
          state = state.copyWith(isSelectLanguage: false, isLoading: false);
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    }
  }

  void change(int index) {
    state = state.copyWith(index: index);
  }

  Future<void> makeSelectedLang({
    required BuildContext context,
    ValueSetter<LanguageData>? afterUpdate,
  }) async {
    final storage = LocalStorage.instance;
    storage.setLanguageSelected(true);
    storage.setLanguageData(state.languages[state.index]);
    storage.setLangLtr(state.languages[state.index].backward);
    await getTranslations(
      context: context,
      afterUpdate: () {
        if (afterUpdate != null) {
          afterUpdate(state.languages[state.index]);
        }
      },
    );
  }

  Future<void> getTranslations({
    VoidCallback? afterUpdate,
    required BuildContext context,
  }) async {
    state = state.copyWith(
      isLoading: true,
      isSuccess: false,
      isSelectLanguage: false,
    );
    final response = await _settingsRepository.getTranslations();
    response.when(
      success: (data) {
        LocalStorage.instance.setTranslations(data.data);
        if (afterUpdate != null) {
          afterUpdate();
        }
        state = state.copyWith(isLoading: false, isSuccess: true);
      },
      failure: (failure, status) {
        AppHelpers.showCheckTopSnackBar(
          context,
          AppHelpers.getTranslation(status.toString()),
        );
        state = state.copyWith(isLoading: false);
      },
    );
  }
}
