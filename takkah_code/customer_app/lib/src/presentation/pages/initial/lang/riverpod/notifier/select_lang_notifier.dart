import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/select_lang_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';
import '../../../../../../core/handlers/handlers.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';

class SelectLangNotifier extends StateNotifier<SelectLangState> {
  final SettingsRepository _settingsRepository;

  SelectLangNotifier(this._settingsRepository) : super(const SelectLangState());

  Future<void> getLanguages({bool? isRequired}) async {
    state = state.copyWith(
      isLoading: true,
      languages: [],
      languagesStore: [],
      selectedLanguage: null,
    );
    final response = await _settingsRepository.getLanguages();
    response.when(
      success: (data) {
        if (isRequired ?? true) {
          final List<LanguageData> languages = data.data ?? [];
          int index = 0;
          for (int i = 0; i < languages.length; i++) {
            if (languages[i].isDefault == 1) {
              index = i;
              break;
            }
          }
          state = state.copyWith(
            isLoading: false,
            languages: languages,
            languagesStore: languages,
            selectedLanguage: languages.isEmpty ? null : languages[index],
          );
        } else {
          final List<LanguageData> languages = data.data ?? [];
          final lang = LocalStorage.instance.getLanguage();
          int index = 0;
          for (int i = 0; i < languages.length; i++) {
            if (languages[i].id == lang?.id) {
              index = i;
              break;
            }
          }
          state = state.copyWith(
            isLoading: false,
            languages: languages,
            languagesStore: languages,
            selectedLanguage: languages.isEmpty ? null : languages[index],
          );
        }
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> error with languages fetched $fail');
      },
    );
  }

  void setSelectedLanguage(LanguageData? language) {
    state = state.copyWith(selectedLanguage: language);
  }

  Future<void> makeSelectedLang(
    BuildContext context,
    bool isRequired, {
    VoidCallback? afterUpdating,
  }) async {
    final storage = LocalStorage.instance;
    storage.setLangSelected(true);
    storage.setLanguageData(state.selectedLanguage);
    await getTranslations(
      checkYourNetwork: () {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
      translationsFetched: () {
        if (isRequired) {
          storage.setLangSelected(true);
          context.replaceRoute(const OnBoardingRoute());
        } else {
          storage.setLangSelected(true);
          context.popRoute();
        }
      },
      translationsNotFound: () {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.translationsNotFound),
        );
        if (storage.getOnBoarded()) {
          context.pushRoute(const OnBoardingRoute());
        } else {
          context.pushRoute(const OnBoardingRoute());
        }
      },
    );
    afterUpdating?.call();
  }

  Future<void> changeLang(
    BuildContext context, {
    VoidCallback? afterUpdating,
  }) async {
    LocalStorage.instance.setLanguageData(state.selectedLanguage);
    await getTranslations(
      checkYourNetwork: () {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      },
      translationsFetched: () {
        context.popRoute();
      },
      translationsNotFound: () {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.translationsNotFound),
        );
        if (LocalStorage.instance.getOnBoarded()) {
          context.pushRoute(const OnBoardingRoute());
        } else {
          context.pushRoute(const OnBoardingRoute());
        }
      },
    );
    afterUpdating?.call();
  }

  Future<void> getTranslations({
    VoidCallback? checkYourNetwork,
    VoidCallback? translationsFetched,
    VoidCallback? translationsNotFound,
  }) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      state = state.copyWith(isSaving: true);
      final response = await _settingsRepository.getMobileTranslations();
      response.when(
        success: (data) {
          LocalStorage.instance.setTranslations(data.data);
          state = state.copyWith(isSaving: false);
          translationsFetched?.call();
        },
        failure: (fail, errorData) {
          debugPrint('==> error with fetching translations $fail');
          if (fail == const NetworkExceptions.notFound('Not found')) {
            translationsNotFound?.call();
          }
          state = state.copyWith(isSaving: false);
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void onSearch(String text) {
    List<LanguageData> resultList = [];
    if (text.isNotEmpty) {
      for (var element in state.languages) {
        if (element.title!.toLowerCase().contains(text)) {
          resultList.add(element);
        }
      }
      state = state.copyWith(languages: resultList);
    } else {
      state = state.copyWith(languages: state.languagesStore);
    }
  }
}
