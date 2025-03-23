import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'app_constants.dart';
import '../models/models.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  LocalStorage._();

  static LocalStorage? _localStorage;

  static LocalStorage instance = LocalStorage._();

  static Future<LocalStorage> getInstance() async {
    if (_localStorage == null) {
      _localStorage = LocalStorage._();
      await _localStorage!._init();
    }
    return _localStorage!;
  }

  static Future<SharedPreferences> getSharedPreferences() async {
    if (_preferences == null) {
      _localStorage = LocalStorage._();
      await _localStorage!._init();
    }
    return _preferences!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setActiveOrderId(int? id) async {
    if (_preferences != null) {
      await _preferences!.setInt(AppConstants.keyActiveOrderId, id ?? 0);
    }
  }

  int getActiveOrderId() =>
      _preferences?.getInt(AppConstants.keyActiveOrderId) ?? 0;

  void _deleteActiveOrderId() =>
      _preferences?.remove(AppConstants.keyActiveOrderId);

  Future<void> setToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyToken, token ?? '');
    }
  }

  String getToken() => _preferences?.getString(AppConstants.keyToken) ?? '';

  void _deleteToken() => _preferences?.remove(AppConstants.keyToken);

  Future<void> setLanguageSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangSelected, selected);
    }
  }

  bool getLanguageSelected() =>
      _preferences?.getBool(AppConstants.keyLangSelected) ?? false;

  void deleteLangSelected() =>
      _preferences?.remove(AppConstants.keyLangSelected);

  Future<void> setSettingsList(List<SettingsData> settings) async {
    if (_preferences != null) {
      final List<String> strings =
          settings.map((setting) => jsonEncode(setting.toJson())).toList();
      await _preferences!
          .setStringList(AppConstants.keyGlobalSettings, strings);
    }
  }

  List<SettingsData> getSettingsList() {
    final List<String> settings =
        _preferences?.getStringList(AppConstants.keyGlobalSettings) ?? [];
    final List<SettingsData> settingsList = settings
        .map(
          (setting) => SettingsData.fromJson(jsonDecode(setting)),
        )
        .toList();
    return settingsList;
  }

  Future<void> setTranslations(Map<String, dynamic>? translations) async {
    if (_preferences != null) {
      final String encoded = jsonEncode(translations);
      await _preferences!.setString(AppConstants.keyTranslations, encoded);
    }
  }

  Map<String, dynamic> getTranslations() {
    final String encoded =
        _preferences?.getString(AppConstants.keyTranslations) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  Future<void> setAppThemeMode(bool isDarkMode) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyAppThemeMode, isDarkMode);
    }
  }

  bool getAppThemeMode() =>
      _preferences?.getBool(AppConstants.keyAppThemeMode) ?? false;

  Future<void> setLanguageData(LanguageData? langData) async {
    if (_preferences != null) {
      final String lang = jsonEncode(langData?.toJson());
      await _preferences!.setString(AppConstants.keyLanguageData, lang);
    }
  }

  LanguageData? getLanguage() {
    final lang = _preferences?.getString(AppConstants.keyLanguageData);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  Future<void> setLangLtr(int? backward) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangLtr, backward == 0);
    }
  }

  bool getLangLtr() => _preferences?.getBool(AppConstants.keyLangLtr) ?? true;

  Future<void> setSelectedCurrency(CurrencyData? currency) async {
    if (_preferences != null) {
      final String currencyString = jsonEncode(currency?.toJson());
      await _preferences!
          .setString(AppConstants.keySelectedCurrency, currencyString);
    }
  }

  CurrencyData? getSelectedCurrency() {
    final savedString =
        _preferences?.getString(AppConstants.keySelectedCurrency);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return CurrencyData.fromJson(map);
  }

  Future<void> setAddressSelected(LatLng data) async {
    if (_preferences != null) {
      await _preferences!.setString(
          AppConstants.keyAddressSelected, jsonEncode(data.toJson()));
    }
  }

  LatLng? getAddressSelected() {
    String dataString =
        _preferences?.getString(AppConstants.keyAddressSelected) ?? '';
    if (dataString.isNotEmpty) {
      LatLng data = LatLng.fromJson(jsonDecode(dataString)) ??
          const LatLng(AppConstants.demoLatitude, AppConstants.demoLongitude);
      return data;
    } else {
      return null;
    }
  }

  Future<void> setUser(UserData? user) async {
    if (_preferences != null) {
      final String userString = user != null ? jsonEncode(user.toJson()) : '';
      await _preferences!.setString(AppConstants.keyUser, userString);
    }
  }

  UserData? getUser() {
    final savedString = _preferences?.getString(AppConstants.keyUser);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return UserData.fromJson(map);
  }

  void _deleteUser() => _preferences?.remove(AppConstants.keyUser);

  Future<void> setDriverInfo(DriverResponse? info) async {
    if (_preferences != null) {
      final String infoString =
          ((info != null) ? jsonEncode(info.toJson()) : '');
      await _preferences!.setString(AppConstants.keyCarInfo, infoString);
    }
  }

  DriverResponse? getDriverInfo() {
    final savedString = _preferences?.getString(AppConstants.keyCarInfo);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return DriverResponse.fromJson(map);
  }

  void _deleteDriverInfo() => _preferences?.remove(AppConstants.keyCarInfo);

  Future<void> setOnline(bool online) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyOnline, online);
    }
  }

  bool getOnline() {
    final online = _preferences?.getBool(AppConstants.keyOnline);
    if (online == null) {
      return false;
    }
    return online;
  }

  void _deleteOnline() => _preferences?.remove(AppConstants.keyOnline);

  Future<void> setWallet(Wallet? wallet) async {
    if (_preferences != null) {
      final String walletString =
          wallet != null ? jsonEncode(wallet.toJson()) : '';
      await _preferences!.setString(AppConstants.keyWallet, walletString);
    }
  }

  Wallet? getWallet() {
    final savedString = _preferences?.getString(AppConstants.keyWallet);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return Wallet.fromJson(map);
  }

  void _deleteWallet() => _preferences?.remove(AppConstants.keyWallet);

  void logout() {
    _deleteToken();
    _deleteUser();
    _deleteDriverInfo();
    _deleteWallet();
    _deleteOnline();
    _deleteActiveOrderId();
  }
}
