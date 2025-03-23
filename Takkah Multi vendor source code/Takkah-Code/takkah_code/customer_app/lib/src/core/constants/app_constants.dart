class AppConstants {
  AppConstants._();

  /// shared preferences keys
  static const String keyUser = 'keyUser';
  static const String keyToken = 'keyToken';
  static const String keyWallet = 'keyWallet';
  static const String keyLangLtr = 'keyLangLtr';
  static const String keyIsGuest = 'keyIsGuest';
  static const String keyOnBoarded = 'keyOnBoarded';
  static const String keySavedStores = 'keySavedStores';
  static const String keyLanguageData = 'keyLanguageData';
  static const String keyTranslations = 'keyTranslations';
  static const String keyLangSelected = 'keyLangSelected';
  static const String keyAppThemeMode = 'keyAppThemeMode';
  static const String keyLikedProducts = 'keyLikedProducts';
  static const String keyProductQuantity = 'keyProductQuantity';
  static const String keyLocalAddresses = 'keyLocalAddresses';
  static const String keyViewedProducts = 'keyViewedProducts';
  static const String keyGlobalSettings = 'keyGlobalSettings';
  static const String keyAddressSelected = 'keyAddressSelected';
  static const String keySelectedCurrency = 'keySelectedCurrency';

  /// hero tags
  static const String tagHeroMarketLogo = 'tagHeroMarketLogo';
  static const String tagHeroBannerImage = 'tagHeroBannerImage';
  static const String tagHeroMarketTitle = 'tagHeroMarketTitle';
  static const String tagHeroRecipeImage = 'tagHeroRecipeImage';

  /// api urls
  static const String webUrl = 'https://sundaymart.net';
  static const String baseUrl = 'https://api.sundaymart.net';
  static const String imageBaseUrl = '$baseUrl/storage/images';
  static const String adminPageUrl = 'https://admin.sundaymart.net';
  static const String privacyPolicyUrl =
      'https://sundaymart.net/privacy-policy';

  /// location
  static const double demoLatitude = 41.304223;
  static const double demoLongitude = 69.2348277;
  static const double pinLoadingMin = 0.116666667;
  static const double pinLoadingMax = 0.611111111;
}

enum MessageOwner { you, partner }

enum BannerType { banner, look }

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

enum ShopDeliveryType { delivery, pickup }

enum OrderStatus {
  ready,
  onAWay,
  accepted,
  canceled,
  newOrders,
  delivered,
}

enum OrderItemWidgetStatus { completed, current, notYet, canceled }

enum ShopStatus { notRequested, newShop, edited, approved, rejected }
