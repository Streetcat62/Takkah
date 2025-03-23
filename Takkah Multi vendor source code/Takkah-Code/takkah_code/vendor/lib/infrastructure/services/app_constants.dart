class AppConstants {
  AppConstants._();

  /// shared preferences keys
  static const String keyLangSelected = 'keyLangSelected';
  static const String keyUser = 'keyUser';
  static const String keyToken = 'keyToken';
  static const String keySelectedCurrency = 'keySelectedCurrency';
  static const String keyAppThemeMode = 'keyAppThemeMode';
  static const String keyGlobalSettings = 'keyGlobalSettings';
  static const String keyTranslations = 'keyTranslations';
  static const String keyLanguageData = 'keyLanguageData';
  static const String keyLangLtr = 'keyLangLtr';
  static const String keyWallet = 'keyWallet';
  static const String keyProductQuantity = 'keyProductQuantity';
  static const String keyShop = 'keyShop';
  static const String keySystemLanguage = 'keySystemLanguage';

  /// hero tags
  static const String heroTagAddOrderButton = 'heroTagAddOrderButton';
  static const String heroTagListNotification = 'heroTagListNotification';
  static const String heroTagOrderHistory = 'heroTagOrderHistory';
  static const String heroTagIncomePage = 'heroTagIncomePage';

  /// api urls
  static const String baseUrl = 'https://api.sundaymart.net';
  static const String imageBaseUrl = '$baseUrl/storage/images';
  static const String chatGpt =
      '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';

  /// location
  static const double demoLatitude = 41.304223;
  static const double demoLongitude = 69.2348277;
  static const double pinLoadingMin = 0.116666667;
  static const double pinLoadingMax = 0.611111111;

  /// demo app info
  static const String demoSellerLogin = 'seller@githubit.com';
  static const String demoSellerPassword = 'Seller123@';
}

enum OrderStatus {
  newOrder,
  accepted,
  ready,
  onAWay,
  delivered,
  canceled,
}

enum SnackBarType { success, info, error }

enum ExtrasType { color, text, image }

enum DeliveryType { delivery, pickup }

enum UploadType {
  extras,
  brands,
  categories,
  shopsLogo,
  shopsBack,
  products,
  reviews,
  users,
}

enum ProductStatus { published, pending, unpublished }
