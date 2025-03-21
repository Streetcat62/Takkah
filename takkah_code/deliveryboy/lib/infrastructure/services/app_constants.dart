class AppConstants {
  AppConstants._();

  /// shared preferences keys
  static const String keyUser = 'keyUser';
  static const String keyToken = 'keyToken';
  static const String keyOnline = 'keyOnline';
  static const String keyWallet = 'keyWallet';
  static const String keyCarInfo = 'keyCarInfo';
  static const String keyLangLtr = 'keyLangLtr';
  static const String keyAppThemeMode = 'keyAppThemeMode';
  static const String keyLanguageData = 'keyLanguageData';
  static const String keyTranslations = 'keyTranslations';
  static const String keyLangSelected = 'keyLangSelected';
  static const String keyActiveOrderId = 'keyActiveOrderId';
  static const String keyGlobalSettings = 'keyGlobalSettings';
  static const String keyAddressSelected = 'keyAddressSelected';
  static const String keySelectedCurrency = 'keySelectedCurrency';

  /// hero tags
  static const String heroTagProfileAvatar = 'heroTagProfileAvatar';

  /// api urls
  static const String baseUrl = 'https://api.sundaymart.net';
  static const String imageBaseUrl = '$baseUrl/storage/images';
  static const String privacyPolicyUrl = '$baseUrl/privacy-policy';
  static const String drawingBaseUrl = 'https://api.openrouteservice.org';
  static const String googleApiKey = 'AIzaSyBgNvtPqsuKcgp26ukVPobjKw0Igx2dp5M';
  static const String routingKey =
      '5b3ce3597851110001cf62480384c1db92764d1b8959761ea2510ac8';

  /// location
  static const double demoLatitude = 41.304223;
  static const double demoLongitude = 69.2348277;
  static const double pinLoadingMin = 0.116666667;
  static const double pinLoadingMax = 0.611111111;

  /// demo app info
  static const String demoSellerPassword = 'deliveryman123';
  static const String demoSellerLogin = 'deliveryman@gmail.com';
}

enum UploadType {
  users,
  extras,
  brands,
  reviews,
  products,
  shopsLogo,
  shopsBack,
  categories,
  deliveryCar,
}
