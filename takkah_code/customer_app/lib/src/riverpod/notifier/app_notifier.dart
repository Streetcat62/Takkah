import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/app_state.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier() : super(const AppState()) {
    fetchThemeAndLocale();
  }

  void fetchThemeAndLocale() {
    final isDarkMode = LocalStorage.instance.getAppThemeMode();
    final lang = LocalStorage.instance.getLanguage();
    final ltr = LocalStorage.instance.getLangLtr();
    state = state.copyWith(
      isDarkMode: isDarkMode,
      activeLanguage: lang,
      isLtr: ltr,
    );
  }

  Future<void> changeTheme(bool? isDarkMode) async {
    await LocalStorage.instance.setAppThemeMode(isDarkMode ?? false);
    state = state.copyWith(isDarkMode: isDarkMode ?? false);
  }

  Future<void> changeLocale(LanguageData? language) async {
    await LocalStorage.instance.setLanguageData(language);
    await LocalStorage.instance.setLangLtr(language?.backward);
    state = state.copyWith(
      activeLanguage: language,
      isLtr: language?.backward == 0,
    );
  }
}
