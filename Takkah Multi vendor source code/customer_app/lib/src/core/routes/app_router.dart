import 'package:auto_route/auto_route.dart';

import '../../presentation/pages/pages.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CupertinoRoute(path: '/', page: SplashPage),
    CupertinoRoute(path: '/chat', page: ChatPage),
    CupertinoRoute(path: '/cart', page: CartPage),
    CupertinoRoute(path: '/login', page: LoginPage),
    CupertinoRoute(path: '/brands', page: BrandsPage),
    CupertinoRoute(path: '/profile', page: ProfilePage),
    CupertinoRoute(path: '/product', page: ProductPage),
    CupertinoRoute(path: '/recipes', page: RecipesPage),
    CupertinoRoute(path: '/settings', page: SettingsPage),
    CupertinoRoute(path: '/checkout', page: CheckoutPage),
    CupertinoRoute(path: '/register', page: RegisterPage),
    CupertinoRoute(path: '/add-review', page: AddReviewPage),
    CupertinoRoute(path: '/currencies', page: CurrenciesPage),
    CupertinoRoute(path: '/onboarding', page: OnBoardingPage),
    CupertinoRoute(path: '/view-on-map', page: ViewOnMapPage),
    CupertinoRoute(path: '/select-lang', page: SelectLangPage),
    CupertinoRoute(path: '/add-address', page: AddAddressPage),
    CupertinoRoute(path: '/market-info', page: MarketInfoPage),
    CupertinoRoute(path: '/enter-phone', page: EnterPhonePage),
    CupertinoRoute(path: '/enter-email', page: EnterEmailPage),
    CupertinoRoute(path: '/verify-code', page: VerifyCodePage),
    CupertinoRoute(path: '/become-seller', page: BecomeSellerPage),
    CupertinoRoute(path: '/order-history', page: OrderHistoryPage),
    CupertinoRoute(path: '/notifications', page: NotificationsPage),
    CupertinoRoute(path: '/banner-details', page: BannerDetailsPage),
    CupertinoRoute(path: '/liked-products', page: LikedProductsPage),
    CupertinoRoute(path: '/brand-products', page: BrandProductsPage),
    CupertinoRoute(path: '/recipes-details', page: RecipeDetailsPage),
    CupertinoRoute(path: '/viewed-products', page: ViewedProductsPage),
    CupertinoRoute(path: '/saved-locations', page: SavedLocationsPage),
    CupertinoRoute(path: '/recipe-category', page: RecipeCategoryPage),
    CupertinoRoute(path: '/profile-settings', page: ProfileSettingsPage),
    CupertinoRoute(path: '/wallet-histories', page: WalletHistoriesPage),
    CupertinoRoute(path: '/category-details', page: CategoryDetailsPage),
    CupertinoRoute(path: '/recipe-categories', page: RecipeCategoriesPage),
    CupertinoRoute(path: '/category-products', page: CategoryProductsPage),
    CupertinoRoute(path: '/more-recipe-category', page: MoreRecipeCategoryPage),
    CupertinoRoute(
      path: '/main',
      page: MainPage,
      children: [
        CustomRoute(
          path: 'delivery',
          page: DeliveryPage,
          transitionsBuilder: TransitionsBuilders.slideRight,
        ),
        CustomRoute(
          path: 'pickup',
          page: PickupPage,
          transitionsBuilder: TransitionsBuilders.slideLeft,
        ),
        AutoRoute(
          path: 'search',
          page: SearchShopsPage,
        ),
      ],
    ),
    CustomRoute(
      path: '/shop',
      page: ShopMainPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      children: [
        AutoRoute(
          path: 'details',
          page: ShopDetailsPage,
        ),
        AutoRoute(
          path: 'recipes',
          page: ShopRecipesPage,
        ),
        AutoRoute(
          path: 'saved',
          page: SavedProductsPage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
