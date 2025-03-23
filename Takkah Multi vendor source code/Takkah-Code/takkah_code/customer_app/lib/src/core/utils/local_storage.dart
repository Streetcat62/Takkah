import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sundaymart/src/models/data/local_cart.dart';

import '../../models/models.dart';
import '../constants/constants.dart';

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

  Future<void> setLangSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangSelected, selected);
    }
  }

  bool getLangSelected() =>
      _preferences?.getBool(AppConstants.keyLangSelected) ?? false;

  Future<void> setToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyToken, token ?? '');
    }
  }

  String getToken() => _preferences?.getString(AppConstants.keyToken) ?? '';

  void _deleteToken() => _preferences?.remove(AppConstants.keyToken);

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

  Future<void> setOnBoarded({required bool onboarded}) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyOnBoarded, onboarded);
    }
  }

  bool getOnBoarded() =>
      _preferences?.getBool(AppConstants.keyOnBoarded) ?? false;

  Future<void> setLangLtr(int? backward) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangLtr, backward == 0);
    }
  }

  bool getLangLtr() => _preferences?.getBool(AppConstants.keyLangLtr) ?? true;

  Future<void> setAddressSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyAddressSelected, selected);
    }
  }

  bool getAddressSelected() =>
      _preferences?.getBool(AppConstants.keyAddressSelected) ?? false;

  void _deleteAddressSelected() =>
      _preferences?.remove(AppConstants.keyAddressSelected);

  Future<void> setIsGuest(bool guest) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyIsGuest, guest);
    }
  }

  bool getIsGuest() => _preferences?.getBool(AppConstants.keyIsGuest) ?? false;

  void _deleteIsGuest() => _preferences?.remove(AppConstants.keyIsGuest);

  Future<void> setLocalAddressesList(List<LocalAddressData> addresses) async {
    if (_preferences != null) {
      final List<String> newList =
          addresses.map((address) => jsonEncode(address.toJson())).toList();
      await _preferences!
          .setStringList(AppConstants.keyLocalAddresses, newList);
    }
  }

  List<LocalAddressData> getLocalAddressesList() {
    final List<String> addresses =
        _preferences?.getStringList(AppConstants.keyLocalAddresses) ?? [];
    final List<LocalAddressData> localAddresses = addresses
        .map(
          (address) => LocalAddressData.fromJson(jsonDecode(address)),
        )
        .toList();
    return localAddresses;
  }

  void _deleteLocalAddressesList() =>
      _preferences?.remove(AppConstants.keyLocalAddresses);

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

  Future<void> setLikedProductsList(List<LocalProductData> products) async {
    if (_preferences != null) {
      final List<String> saveStrings = [];
      for (final product in products) {
        saveStrings.add(jsonEncode(product.toJson()));
      }
      await _preferences!
          .setStringList(AppConstants.keyLikedProducts, saveStrings);
    }
  }

  List<LocalProductData> getLikedProductsList() {
    final List<String> productsStrings =
        _preferences?.getStringList(AppConstants.keyLikedProducts) ?? [];
    final List<LocalProductData> products = [];
    for (final productString in productsStrings) {
      final map = jsonDecode(productString);
      if (map == null) {
        continue;
      }
      products.add(LocalProductData.fromJson(map));
    }
    return products;
  }

  List<LocalCart> getProductQuantity() {
    List<LocalCart> list = [];
    List listJson =
        _preferences?.getStringList(AppConstants.keyProductQuantity) ?? [];
    for (var element in listJson) {
      list.add(LocalCart.fromJson(jsonDecode(element)));
    }
    return list;
  }

  Future<void> addProductQuantity(int productID, int quantity) async {
    List<LocalCart> list = getProductQuantity();
    for (int i = 0; i < list.length; i++) {
      if (list[i].productId == productID) {
        list.removeAt(i);
        list.insert(i, LocalCart(productId: productID, quantity: quantity));
      }
    }
    list.add(LocalCart(productId: productID, quantity: quantity));
    List<String> jsonList = [];
    for (var element in list) {
      jsonList.add(jsonEncode(element.toJson()));
    }
    _preferences?.setStringList(AppConstants.keyProductQuantity, jsonList);
  }

  Future<void> removeProductQuantity(int productID) async {
    List<LocalCart> list = getProductQuantity();
    for (int i = 0; i < list.length; i++) {
      if (list[i].productId == productID && list[i].quantity > 0) {
        list[i].quantity - 1;
      }
    }
    List<String> jsonList = [];
    for (var element in list) {
      jsonList.add(jsonEncode(element.toJson()));
    }
    _preferences?.setStringList(AppConstants.keyProductQuantity, jsonList);
  }

  void deleteProductQuantityList() =>
      _preferences?.remove(AppConstants.keyProductQuantity);

  void _deleteLikedProductsList() =>
      _preferences?.remove(AppConstants.keyLikedProducts);

  Future<void> setViewedProductsList(List<LocalProductData> products) async {
    if (_preferences != null) {
      final List<String> saveStrings = [];
      for (final product in products) {
        saveStrings.add(jsonEncode(product.toJson()));
      }
      await _preferences!
          .setStringList(AppConstants.keyViewedProducts, saveStrings);
    }
  }

  List<LocalProductData> getViewedProductsList() {
    final List<String> productsStrings =
        _preferences?.getStringList(AppConstants.keyViewedProducts) ?? [];
    final List<LocalProductData> products = [];
    for (final productString in productsStrings) {
      final map = jsonDecode(productString);
      if (map == null) {
        continue;
      }
      products.add(LocalProductData.fromJson(map));
    }
    return products;
  }

  void _deleteViewedProductsList() =>
      _preferences?.remove(AppConstants.keyViewedProducts);

  Future<void> setSavedShopsList(List<int> ids) async {
    if (_preferences != null) {
      final List<String> idsStrings = ids.map((e) => e.toString()).toList();
      await _preferences!
          .setStringList(AppConstants.keySavedStores, idsStrings);
    }
  }

  List<int> getSavedShopsList() {
    final List<String> strings =
        _preferences?.getStringList(AppConstants.keySavedStores) ?? [];
    final List<int> ids = strings.map((e) => int.parse(e)).toList();
    return ids;
  }

  void _deleteSavedShopsList() =>
      _preferences?.remove(AppConstants.keySavedStores);

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
    _deleteAddressSelected();
    _deleteToken();
    _deleteIsGuest();
    _deleteLocalAddressesList();
    _deleteUser();
    _deleteLikedProductsList();
    _deleteViewedProductsList();
    _deleteSavedShopsList();
    _deleteWallet();
  }
}
