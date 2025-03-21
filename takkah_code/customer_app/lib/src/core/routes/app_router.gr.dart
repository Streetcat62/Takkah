// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i4;
import 'package:flutter/material.dart' as _i3;

import '../../models/models.dart' as _i5;
import '../../presentation/pages/pages.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ChatPage(),
      );
    },
    CartRoute.name: (routeData) {
      final args =
          routeData.argsAs<CartRouteArgs>(orElse: () => const CartRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.CartPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    BrandsRoute.name: (routeData) {
      final args = routeData.argsAs<BrandsRouteArgs>(
          orElse: () => const BrandsRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.BrandsPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.ProfilePage(
          key: args.key,
          fromHome: args.fromHome,
          shopId: args.shopId,
        ),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>(
          orElse: () => const ProductRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.ProductPage(
          key: args.key,
          product: args.product,
          shopId: args.shopId,
        ),
      );
    },
    RecipesRoute.name: (routeData) {
      final args = routeData.argsAs<RecipesRouteArgs>(
          orElse: () => const RecipesRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.RecipesPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SettingsPage(),
      );
    },
    CheckoutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutRouteArgs>(
          orElse: () => const CheckoutRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.CheckoutPage(
          key: args.key,
          shopId: args.shopId,
          cartId: args.cartId,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.RegisterPage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    AddReviewRoute.name: (routeData) {
      final args = routeData.argsAs<AddReviewRouteArgs>(
          orElse: () => const AddReviewRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.AddReviewPage(
          key: args.key,
          productData: args.productData,
          shopId: args.shopId,
        ),
      );
    },
    CurrenciesRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.CurrenciesPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OnBoardingPage(),
      );
    },
    ViewOnMapRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ViewOnMapPage(),
      );
    },
    SelectLangRoute.name: (routeData) {
      final args = routeData.argsAs<SelectLangRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.SelectLangPage(
          key: args.key,
          isRequired: args.isRequired,
        ),
      );
    },
    AddAddressRoute.name: (routeData) {
      final args = routeData.argsAs<AddAddressRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.AddAddressPage(
          key: args.key,
          isRequired: args.isRequired,
        ),
      );
    },
    MarketInfoRoute.name: (routeData) {
      final args = routeData.argsAs<MarketInfoRouteArgs>(
          orElse: () => const MarketInfoRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.MarketInfoPage(
          key: args.key,
          shop: args.shop,
          initialTabIndex: args.initialTabIndex,
        ),
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EnterPhonePage(),
      );
    },
    EnterEmailRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EnterEmailPage(),
      );
    },
    VerifyCodeRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyCodeRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.VerifyCodePage(
          key: args.key,
          email: args.email,
        ),
      );
    },
    BecomeSellerRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.BecomeSellerPage(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OrderHistoryPage(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NotificationsPage(),
      );
    },
    BannerDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BannerDetailsRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.BannerDetailsPage(
          key: args.key,
          banner: args.banner,
          shopId: args.shopId,
        ),
      );
    },
    LikedProductsRoute.name: (routeData) {
      final args = routeData.argsAs<LikedProductsRouteArgs>(
          orElse: () => const LikedProductsRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.LikedProductsPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    BrandProductsRoute.name: (routeData) {
      final args = routeData.argsAs<BrandProductsRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.BrandProductsPage(
          key: args.key,
          brand: args.brand,
          shopId: args.shopId,
        ),
      );
    },
    RecipeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeDetailsRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.RecipeDetailsPage(
          key: args.key,
          recipe: args.recipe,
          shopId: args.shopId,
        ),
      );
    },
    ViewedProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ViewedProductsRouteArgs>(
          orElse: () => const ViewedProductsRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.ViewedProductsPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    SavedLocationsRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SavedLocationsPage(),
      );
    },
    RecipeCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeCategoryRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.RecipeCategoryPage(
          key: args.key,
          categoryData: args.categoryData,
          shopId: args.shopId,
        ),
      );
    },
    ProfileSettingsRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileSettingsPage(),
      );
    },
    WalletHistoriesRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.WalletHistoriesPage(),
      );
    },
    CategoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailsRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.CategoryDetailsPage(
          key: args.key,
          category: args.category,
          shopId: args.shopId,
        ),
      );
    },
    RecipeCategoriesRoute.name: (routeData) {
      final args = routeData.argsAs<RecipeCategoriesRouteArgs>(
          orElse: () => const RecipeCategoriesRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.RecipeCategoriesPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    CategoryProductsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryProductsRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.CategoryProductsPage(
          key: args.key,
          category: args.category,
          shopId: args.shopId,
        ),
      );
    },
    MoreRecipeCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<MoreRecipeCategoryRouteArgs>(
          orElse: () => const MoreRecipeCategoryRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.MoreRecipeCategoryPage(
          key: args.key,
          categoryChild: args.categoryChild,
          shopId: args.shopId,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    ShopMainRoute.name: (routeData) {
      final args = routeData.argsAs<ShopMainRouteArgs>();
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: _i1.ShopMainPage(
          key: args.key,
          shopId: args.shopId,
          fromDelivery: args.fromDelivery,
        ),
        transitionsBuilder: _i2.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    DeliveryRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.DeliveryPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideRight,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PickupRoute.name: (routeData) {
      return _i2.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.PickupPage(),
        transitionsBuilder: _i2.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SearchShopsRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SearchShopsPage(),
      );
    },
    ShopDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ShopDetailsRouteArgs>();
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.ShopDetailsPage(
          key: args.key,
          shopId: args.shopId,
          fromDelivery: args.fromDelivery,
        ),
      );
    },
    ShopRecipesRoute.name: (routeData) {
      final args = routeData.argsAs<ShopRecipesRouteArgs>(
          orElse: () => const ShopRecipesRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.ShopRecipesPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
    SavedProductsRoute.name: (routeData) {
      final args = routeData.argsAs<SavedProductsRouteArgs>(
          orElse: () => const SavedProductsRouteArgs());
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i1.SavedProductsPage(
          key: args.key,
          shopId: args.shopId,
        ),
      );
    },
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i2.RouteConfig(
          ChatRoute.name,
          path: '/chat',
        ),
        _i2.RouteConfig(
          CartRoute.name,
          path: '/cart',
        ),
        _i2.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i2.RouteConfig(
          BrandsRoute.name,
          path: '/brands',
        ),
        _i2.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i2.RouteConfig(
          ProductRoute.name,
          path: '/product',
        ),
        _i2.RouteConfig(
          RecipesRoute.name,
          path: '/recipes',
        ),
        _i2.RouteConfig(
          SettingsRoute.name,
          path: '/settings',
        ),
        _i2.RouteConfig(
          CheckoutRoute.name,
          path: '/checkout',
        ),
        _i2.RouteConfig(
          RegisterRoute.name,
          path: '/register',
        ),
        _i2.RouteConfig(
          AddReviewRoute.name,
          path: '/add-review',
        ),
        _i2.RouteConfig(
          CurrenciesRoute.name,
          path: '/currencies',
        ),
        _i2.RouteConfig(
          OnBoardingRoute.name,
          path: '/onboarding',
        ),
        _i2.RouteConfig(
          ViewOnMapRoute.name,
          path: '/view-on-map',
        ),
        _i2.RouteConfig(
          SelectLangRoute.name,
          path: '/select-lang',
        ),
        _i2.RouteConfig(
          AddAddressRoute.name,
          path: '/add-address',
        ),
        _i2.RouteConfig(
          MarketInfoRoute.name,
          path: '/market-info',
        ),
        _i2.RouteConfig(
          EnterPhoneRoute.name,
          path: '/enter-phone',
        ),
        _i2.RouteConfig(
          EnterEmailRoute.name,
          path: '/enter-email',
        ),
        _i2.RouteConfig(
          VerifyCodeRoute.name,
          path: '/verify-code',
        ),
        _i2.RouteConfig(
          BecomeSellerRoute.name,
          path: '/become-seller',
        ),
        _i2.RouteConfig(
          OrderHistoryRoute.name,
          path: '/order-history',
        ),
        _i2.RouteConfig(
          NotificationsRoute.name,
          path: '/notifications',
        ),
        _i2.RouteConfig(
          BannerDetailsRoute.name,
          path: '/banner-details',
        ),
        _i2.RouteConfig(
          LikedProductsRoute.name,
          path: '/liked-products',
        ),
        _i2.RouteConfig(
          BrandProductsRoute.name,
          path: '/brand-products',
        ),
        _i2.RouteConfig(
          RecipeDetailsRoute.name,
          path: '/recipes-details',
        ),
        _i2.RouteConfig(
          ViewedProductsRoute.name,
          path: '/viewed-products',
        ),
        _i2.RouteConfig(
          SavedLocationsRoute.name,
          path: '/saved-locations',
        ),
        _i2.RouteConfig(
          RecipeCategoryRoute.name,
          path: '/recipe-category',
        ),
        _i2.RouteConfig(
          ProfileSettingsRoute.name,
          path: '/profile-settings',
        ),
        _i2.RouteConfig(
          WalletHistoriesRoute.name,
          path: '/wallet-histories',
        ),
        _i2.RouteConfig(
          CategoryDetailsRoute.name,
          path: '/category-details',
        ),
        _i2.RouteConfig(
          RecipeCategoriesRoute.name,
          path: '/recipe-categories',
        ),
        _i2.RouteConfig(
          CategoryProductsRoute.name,
          path: '/category-products',
        ),
        _i2.RouteConfig(
          MoreRecipeCategoryRoute.name,
          path: '/more-recipe-category',
        ),
        _i2.RouteConfig(
          MainRoute.name,
          path: '/main',
          children: [
            _i2.RouteConfig(
              DeliveryRoute.name,
              path: 'delivery',
              parent: MainRoute.name,
            ),
            _i2.RouteConfig(
              PickupRoute.name,
              path: 'pickup',
              parent: MainRoute.name,
            ),
            _i2.RouteConfig(
              SearchShopsRoute.name,
              path: 'search',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i2.RouteConfig(
          ShopMainRoute.name,
          path: '/shop',
          children: [
            _i2.RouteConfig(
              ShopDetailsRoute.name,
              path: 'details',
              parent: ShopMainRoute.name,
            ),
            _i2.RouteConfig(
              ShopRecipesRoute.name,
              path: 'recipes',
              parent: ShopMainRoute.name,
            ),
            _i2.RouteConfig(
              SavedProductsRoute.name,
              path: 'saved',
              parent: ShopMainRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i2.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i1.ChatPage]
class ChatRoute extends _i2.PageRouteInfo<void> {
  const ChatRoute()
      : super(
          ChatRoute.name,
          path: '/chat',
        );

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i2.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i4.Key? key,
    int? shopId,
  }) : super(
          CartRoute.name,
          path: '/cart',
          args: CartRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'CartRoute';
}

class CartRouteArgs {
  const CartRouteArgs({
    this.key,
    this.shopId,
  });

  final _i4.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i2.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i1.BrandsPage]
class BrandsRoute extends _i2.PageRouteInfo<BrandsRouteArgs> {
  BrandsRoute({
    _i4.Key? key,
    int? shopId,
  }) : super(
          BrandsRoute.name,
          path: '/brands',
          args: BrandsRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'BrandsRoute';
}

class BrandsRouteArgs {
  const BrandsRouteArgs({
    this.key,
    this.shopId,
  });

  final _i4.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'BrandsRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.ProfilePage]
class ProfileRoute extends _i2.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i4.Key? key,
    bool fromHome = false,
    int? shopId,
  }) : super(
          ProfileRoute.name,
          path: '/profile',
          args: ProfileRouteArgs(
            key: key,
            fromHome: fromHome,
            shopId: shopId,
          ),
        );

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    this.fromHome = false,
    this.shopId,
  });

  final _i4.Key? key;

  final bool fromHome;

  final int? shopId;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, fromHome: $fromHome, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.ProductPage]
class ProductRoute extends _i2.PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    _i4.Key? key,
    _i5.ProductData? product,
    int? shopId,
  }) : super(
          ProductRoute.name,
          path: '/product',
          args: ProductRouteArgs(
            key: key,
            product: product,
            shopId: shopId,
          ),
        );

  static const String name = 'ProductRoute';
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    this.product,
    this.shopId,
  });

  final _i4.Key? key;

  final _i5.ProductData? product;

  final int? shopId;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.RecipesPage]
class RecipesRoute extends _i2.PageRouteInfo<RecipesRouteArgs> {
  RecipesRoute({
    _i4.Key? key,
    int? shopId,
  }) : super(
          RecipesRoute.name,
          path: '/recipes',
          args: RecipesRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'RecipesRoute';
}

class RecipesRouteArgs {
  const RecipesRouteArgs({
    this.key,
    this.shopId,
  });

  final _i4.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'RecipesRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.SettingsPage]
class SettingsRoute extends _i2.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i1.CheckoutPage]
class CheckoutRoute extends _i2.PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({
    _i4.Key? key,
    int? shopId,
    int? cartId,
  }) : super(
          CheckoutRoute.name,
          path: '/checkout',
          args: CheckoutRouteArgs(
            key: key,
            shopId: shopId,
            cartId: cartId,
          ),
        );

  static const String name = 'CheckoutRoute';
}

class CheckoutRouteArgs {
  const CheckoutRouteArgs({
    this.key,
    this.shopId,
    this.cartId,
  });

  final _i4.Key? key;

  final int? shopId;

  final int? cartId;

  @override
  String toString() {
    return 'CheckoutRouteArgs{key: $key, shopId: $shopId, cartId: $cartId}';
  }
}

/// generated route for
/// [_i1.RegisterPage]
class RegisterRoute extends _i2.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i4.Key? key,
    required String email,
  }) : super(
          RegisterRoute.name,
          path: '/register',
          args: RegisterRouteArgs(
            key: key,
            email: email,
          ),
        );

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    this.key,
    required this.email,
  });

  final _i4.Key? key;

  final String email;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i1.AddReviewPage]
class AddReviewRoute extends _i2.PageRouteInfo<AddReviewRouteArgs> {
  AddReviewRoute({
    _i4.Key? key,
    _i5.ProductData? productData,
    int? shopId,
  }) : super(
          AddReviewRoute.name,
          path: '/add-review',
          args: AddReviewRouteArgs(
            key: key,
            productData: productData,
            shopId: shopId,
          ),
        );

  static const String name = 'AddReviewRoute';
}

class AddReviewRouteArgs {
  const AddReviewRouteArgs({
    this.key,
    this.productData,
    this.shopId,
  });

  final _i4.Key? key;

  final _i5.ProductData? productData;

  final int? shopId;

  @override
  String toString() {
    return 'AddReviewRouteArgs{key: $key, productData: $productData, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.CurrenciesPage]
class CurrenciesRoute extends _i2.PageRouteInfo<void> {
  const CurrenciesRoute()
      : super(
          CurrenciesRoute.name,
          path: '/currencies',
        );

  static const String name = 'CurrenciesRoute';
}

/// generated route for
/// [_i1.OnBoardingPage]
class OnBoardingRoute extends _i2.PageRouteInfo<void> {
  const OnBoardingRoute()
      : super(
          OnBoardingRoute.name,
          path: '/onboarding',
        );

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i1.ViewOnMapPage]
class ViewOnMapRoute extends _i2.PageRouteInfo<void> {
  const ViewOnMapRoute()
      : super(
          ViewOnMapRoute.name,
          path: '/view-on-map',
        );

  static const String name = 'ViewOnMapRoute';
}

/// generated route for
/// [_i1.SelectLangPage]
class SelectLangRoute extends _i2.PageRouteInfo<SelectLangRouteArgs> {
  SelectLangRoute({
    _i4.Key? key,
    required bool isRequired,
  }) : super(
          SelectLangRoute.name,
          path: '/select-lang',
          args: SelectLangRouteArgs(
            key: key,
            isRequired: isRequired,
          ),
        );

  static const String name = 'SelectLangRoute';
}

class SelectLangRouteArgs {
  const SelectLangRouteArgs({
    this.key,
    required this.isRequired,
  });

  final _i4.Key? key;

  final bool isRequired;

  @override
  String toString() {
    return 'SelectLangRouteArgs{key: $key, isRequired: $isRequired}';
  }
}

/// generated route for
/// [_i1.AddAddressPage]
class AddAddressRoute extends _i2.PageRouteInfo<AddAddressRouteArgs> {
  AddAddressRoute({
    _i4.Key? key,
    required bool isRequired,
  }) : super(
          AddAddressRoute.name,
          path: '/add-address',
          args: AddAddressRouteArgs(
            key: key,
            isRequired: isRequired,
          ),
        );

  static const String name = 'AddAddressRoute';
}

class AddAddressRouteArgs {
  const AddAddressRouteArgs({
    this.key,
    required this.isRequired,
  });

  final _i4.Key? key;

  final bool isRequired;

  @override
  String toString() {
    return 'AddAddressRouteArgs{key: $key, isRequired: $isRequired}';
  }
}

/// generated route for
/// [_i1.MarketInfoPage]
class MarketInfoRoute extends _i2.PageRouteInfo<MarketInfoRouteArgs> {
  MarketInfoRoute({
    _i4.Key? key,
    _i5.ShopData? shop,
    int? initialTabIndex,
  }) : super(
          MarketInfoRoute.name,
          path: '/market-info',
          args: MarketInfoRouteArgs(
            key: key,
            shop: shop,
            initialTabIndex: initialTabIndex,
          ),
        );

  static const String name = 'MarketInfoRoute';
}

class MarketInfoRouteArgs {
  const MarketInfoRouteArgs({
    this.key,
    this.shop,
    this.initialTabIndex,
  });

  final _i4.Key? key;

  final _i5.ShopData? shop;

  final int? initialTabIndex;

  @override
  String toString() {
    return 'MarketInfoRouteArgs{key: $key, shop: $shop, initialTabIndex: $initialTabIndex}';
  }
}

/// generated route for
/// [_i1.EnterPhonePage]
class EnterPhoneRoute extends _i2.PageRouteInfo<void> {
  const EnterPhoneRoute()
      : super(
          EnterPhoneRoute.name,
          path: '/enter-phone',
        );

  static const String name = 'EnterPhoneRoute';
}

/// generated route for
/// [_i1.EnterEmailPage]
class EnterEmailRoute extends _i2.PageRouteInfo<void> {
  const EnterEmailRoute()
      : super(
          EnterEmailRoute.name,
          path: '/enter-email',
        );

  static const String name = 'EnterEmailRoute';
}

/// generated route for
/// [_i1.VerifyCodePage]
class VerifyCodeRoute extends _i2.PageRouteInfo<VerifyCodeRouteArgs> {
  VerifyCodeRoute({
    _i4.Key? key,
    required String email,
  }) : super(
          VerifyCodeRoute.name,
          path: '/verify-code',
          args: VerifyCodeRouteArgs(
            key: key,
            email: email,
          ),
        );

  static const String name = 'VerifyCodeRoute';
}

class VerifyCodeRouteArgs {
  const VerifyCodeRouteArgs({
    this.key,
    required this.email,
  });

  final _i4.Key? key;

  final String email;

  @override
  String toString() {
    return 'VerifyCodeRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i1.BecomeSellerPage]
class BecomeSellerRoute extends _i2.PageRouteInfo<void> {
  const BecomeSellerRoute()
      : super(
          BecomeSellerRoute.name,
          path: '/become-seller',
        );

  static const String name = 'BecomeSellerRoute';
}

/// generated route for
/// [_i1.OrderHistoryPage]
class OrderHistoryRoute extends _i2.PageRouteInfo<void> {
  const OrderHistoryRoute()
      : super(
          OrderHistoryRoute.name,
          path: '/order-history',
        );

  static const String name = 'OrderHistoryRoute';
}

/// generated route for
/// [_i1.NotificationsPage]
class NotificationsRoute extends _i2.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/notifications',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i1.BannerDetailsPage]
class BannerDetailsRoute extends _i2.PageRouteInfo<BannerDetailsRouteArgs> {
  BannerDetailsRoute({
    _i4.Key? key,
    required _i5.BannerData banner,
    int? shopId,
  }) : super(
          BannerDetailsRoute.name,
          path: '/banner-details',
          args: BannerDetailsRouteArgs(
            key: key,
            banner: banner,
            shopId: shopId,
          ),
        );

  static const String name = 'BannerDetailsRoute';
}

class BannerDetailsRouteArgs {
  const BannerDetailsRouteArgs({
    this.key,
    required this.banner,
    this.shopId,
  });

  final _i4.Key? key;

  final _i5.BannerData banner;

  final int? shopId;

  @override
  String toString() {
    return 'BannerDetailsRouteArgs{key: $key, banner: $banner, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.LikedProductsPage]
class LikedProductsRoute extends _i2.PageRouteInfo<LikedProductsRouteArgs> {
  LikedProductsRoute({
    _i4.Key? key,
    int? shopId,
  }) : super(
          LikedProductsRoute.name,
          path: '/liked-products',
          args: LikedProductsRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'LikedProductsRoute';
}

class LikedProductsRouteArgs {
  const LikedProductsRouteArgs({
    this.key,
    this.shopId,
  });

  final _i4.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'LikedProductsRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.BrandProductsPage]
class BrandProductsRoute extends _i2.PageRouteInfo<BrandProductsRouteArgs> {
  BrandProductsRoute({
    _i4.Key? key,
    required _i5.BrandData brand,
    int? shopId,
  }) : super(
          BrandProductsRoute.name,
          path: '/brand-products',
          args: BrandProductsRouteArgs(
            key: key,
            brand: brand,
            shopId: shopId,
          ),
        );

  static const String name = 'BrandProductsRoute';
}

class BrandProductsRouteArgs {
  const BrandProductsRouteArgs({
    this.key,
    required this.brand,
    this.shopId,
  });

  final _i4.Key? key;

  final _i5.BrandData brand;

  final int? shopId;

  @override
  String toString() {
    return 'BrandProductsRouteArgs{key: $key, brand: $brand, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.RecipeDetailsPage]
class RecipeDetailsRoute extends _i2.PageRouteInfo<RecipeDetailsRouteArgs> {
  RecipeDetailsRoute({
    _i4.Key? key,
    required _i5.RecipeData recipe,
    int? shopId,
  }) : super(
          RecipeDetailsRoute.name,
          path: '/recipes-details',
          args: RecipeDetailsRouteArgs(
            key: key,
            recipe: recipe,
            shopId: shopId,
          ),
        );

  static const String name = 'RecipeDetailsRoute';
}

class RecipeDetailsRouteArgs {
  const RecipeDetailsRouteArgs({
    this.key,
    required this.recipe,
    this.shopId,
  });

  final _i4.Key? key;

  final _i5.RecipeData recipe;

  final int? shopId;

  @override
  String toString() {
    return 'RecipeDetailsRouteArgs{key: $key, recipe: $recipe, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.ViewedProductsPage]
class ViewedProductsRoute extends _i2.PageRouteInfo<ViewedProductsRouteArgs> {
  ViewedProductsRoute({
    _i4.Key? key,
    int? shopId,
  }) : super(
          ViewedProductsRoute.name,
          path: '/viewed-products',
          args: ViewedProductsRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'ViewedProductsRoute';
}

class ViewedProductsRouteArgs {
  const ViewedProductsRouteArgs({
    this.key,
    this.shopId,
  });

  final _i4.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'ViewedProductsRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.SavedLocationsPage]
class SavedLocationsRoute extends _i2.PageRouteInfo<void> {
  const SavedLocationsRoute()
      : super(
          SavedLocationsRoute.name,
          path: '/saved-locations',
        );

  static const String name = 'SavedLocationsRoute';
}

/// generated route for
/// [_i1.RecipeCategoryPage]
class RecipeCategoryRoute extends _i2.PageRouteInfo<RecipeCategoryRouteArgs> {
  RecipeCategoryRoute({
    _i4.Key? key,
    required _i5.RecipeCategoryData categoryData,
    int? shopId,
  }) : super(
          RecipeCategoryRoute.name,
          path: '/recipe-category',
          args: RecipeCategoryRouteArgs(
            key: key,
            categoryData: categoryData,
            shopId: shopId,
          ),
        );

  static const String name = 'RecipeCategoryRoute';
}

class RecipeCategoryRouteArgs {
  const RecipeCategoryRouteArgs({
    this.key,
    required this.categoryData,
    this.shopId,
  });

  final _i4.Key? key;

  final _i5.RecipeCategoryData categoryData;

  final int? shopId;

  @override
  String toString() {
    return 'RecipeCategoryRouteArgs{key: $key, categoryData: $categoryData, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.ProfileSettingsPage]
class ProfileSettingsRoute extends _i2.PageRouteInfo<void> {
  const ProfileSettingsRoute()
      : super(
          ProfileSettingsRoute.name,
          path: '/profile-settings',
        );

  static const String name = 'ProfileSettingsRoute';
}

/// generated route for
/// [_i1.WalletHistoriesPage]
class WalletHistoriesRoute extends _i2.PageRouteInfo<void> {
  const WalletHistoriesRoute()
      : super(
          WalletHistoriesRoute.name,
          path: '/wallet-histories',
        );

  static const String name = 'WalletHistoriesRoute';
}

/// generated route for
/// [_i1.CategoryDetailsPage]
class CategoryDetailsRoute extends _i2.PageRouteInfo<CategoryDetailsRouteArgs> {
  CategoryDetailsRoute({
    _i4.Key? key,
    required _i5.CategoryData category,
    int? shopId,
  }) : super(
          CategoryDetailsRoute.name,
          path: '/category-details',
          args: CategoryDetailsRouteArgs(
            key: key,
            category: category,
            shopId: shopId,
          ),
        );

  static const String name = 'CategoryDetailsRoute';
}

class CategoryDetailsRouteArgs {
  const CategoryDetailsRouteArgs({
    this.key,
    required this.category,
    this.shopId,
  });

  final _i4.Key? key;

  final _i5.CategoryData category;

  final int? shopId;

  @override
  String toString() {
    return 'CategoryDetailsRouteArgs{key: $key, category: $category, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.RecipeCategoriesPage]
class RecipeCategoriesRoute
    extends _i2.PageRouteInfo<RecipeCategoriesRouteArgs> {
  RecipeCategoriesRoute({
    _i4.Key? key,
    int? shopId,
  }) : super(
          RecipeCategoriesRoute.name,
          path: '/recipe-categories',
          args: RecipeCategoriesRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'RecipeCategoriesRoute';
}

class RecipeCategoriesRouteArgs {
  const RecipeCategoriesRouteArgs({
    this.key,
    this.shopId,
  });

  final _i4.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'RecipeCategoriesRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.CategoryProductsPage]
class CategoryProductsRoute
    extends _i2.PageRouteInfo<CategoryProductsRouteArgs> {
  CategoryProductsRoute({
    _i4.Key? key,
    required _i5.ShopCategoryData category,
    int? shopId,
  }) : super(
          CategoryProductsRoute.name,
          path: '/category-products',
          args: CategoryProductsRouteArgs(
            key: key,
            category: category,
            shopId: shopId,
          ),
        );

  static const String name = 'CategoryProductsRoute';
}

class CategoryProductsRouteArgs {
  const CategoryProductsRouteArgs({
    this.key,
    required this.category,
    this.shopId,
  });

  final _i4.Key? key;

  final _i5.ShopCategoryData category;

  final int? shopId;

  @override
  String toString() {
    return 'CategoryProductsRouteArgs{key: $key, category: $category, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.MoreRecipeCategoryPage]
class MoreRecipeCategoryRoute
    extends _i2.PageRouteInfo<MoreRecipeCategoryRouteArgs> {
  MoreRecipeCategoryRoute({
    _i4.Key? key,
    _i5.RecipeCategoryChild? categoryChild,
    int? shopId,
  }) : super(
          MoreRecipeCategoryRoute.name,
          path: '/more-recipe-category',
          args: MoreRecipeCategoryRouteArgs(
            key: key,
            categoryChild: categoryChild,
            shopId: shopId,
          ),
        );

  static const String name = 'MoreRecipeCategoryRoute';
}

class MoreRecipeCategoryRouteArgs {
  const MoreRecipeCategoryRouteArgs({
    this.key,
    this.categoryChild,
    this.shopId,
  });

  final _i4.Key? key;

  final _i5.RecipeCategoryChild? categoryChild;

  final int? shopId;

  @override
  String toString() {
    return 'MoreRecipeCategoryRouteArgs{key: $key, categoryChild: $categoryChild, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i2.PageRouteInfo<void> {
  const MainRoute({List<_i2.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/main',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i1.ShopMainPage]
class ShopMainRoute extends _i2.PageRouteInfo<ShopMainRouteArgs> {
  ShopMainRoute({
    _i4.Key? key,
    int? shopId,
    required bool fromDelivery,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          ShopMainRoute.name,
          path: '/shop',
          args: ShopMainRouteArgs(
            key: key,
            shopId: shopId,
            fromDelivery: fromDelivery,
          ),
          initialChildren: children,
        );

  static const String name = 'ShopMainRoute';
}

class ShopMainRouteArgs {
  const ShopMainRouteArgs({
    this.key,
    this.shopId,
    required this.fromDelivery,
  });

  final _i4.Key? key;

  final int? shopId;

  final bool fromDelivery;

  @override
  String toString() {
    return 'ShopMainRouteArgs{key: $key, shopId: $shopId, fromDelivery: $fromDelivery}';
  }
}

/// generated route for
/// [_i1.DeliveryPage]
class DeliveryRoute extends _i2.PageRouteInfo<void> {
  const DeliveryRoute()
      : super(
          DeliveryRoute.name,
          path: 'delivery',
        );

  static const String name = 'DeliveryRoute';
}

/// generated route for
/// [_i1.PickupPage]
class PickupRoute extends _i2.PageRouteInfo<void> {
  const PickupRoute()
      : super(
          PickupRoute.name,
          path: 'pickup',
        );

  static const String name = 'PickupRoute';
}

/// generated route for
/// [_i1.SearchShopsPage]
class SearchShopsRoute extends _i2.PageRouteInfo<void> {
  const SearchShopsRoute()
      : super(
          SearchShopsRoute.name,
          path: 'search',
        );

  static const String name = 'SearchShopsRoute';
}

/// generated route for
/// [_i1.ShopDetailsPage]
class ShopDetailsRoute extends _i2.PageRouteInfo<ShopDetailsRouteArgs> {
  ShopDetailsRoute({
    _i4.Key? key,
    int? shopId,
    required bool fromDelivery,
  }) : super(
          ShopDetailsRoute.name,
          path: 'details',
          args: ShopDetailsRouteArgs(
            key: key,
            shopId: shopId,
            fromDelivery: fromDelivery,
          ),
        );

  static const String name = 'ShopDetailsRoute';
}

class ShopDetailsRouteArgs {
  const ShopDetailsRouteArgs({
    this.key,
    this.shopId,
    required this.fromDelivery,
  });

  final _i4.Key? key;

  final int? shopId;

  final bool fromDelivery;

  @override
  String toString() {
    return 'ShopDetailsRouteArgs{key: $key, shopId: $shopId, fromDelivery: $fromDelivery}';
  }
}

/// generated route for
/// [_i1.ShopRecipesPage]
class ShopRecipesRoute extends _i2.PageRouteInfo<ShopRecipesRouteArgs> {
  ShopRecipesRoute({
    _i4.Key? key,
    int? shopId,
  }) : super(
          ShopRecipesRoute.name,
          path: 'recipes',
          args: ShopRecipesRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'ShopRecipesRoute';
}

class ShopRecipesRouteArgs {
  const ShopRecipesRouteArgs({
    this.key,
    this.shopId,
  });

  final _i4.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'ShopRecipesRouteArgs{key: $key, shopId: $shopId}';
  }
}

/// generated route for
/// [_i1.SavedProductsPage]
class SavedProductsRoute extends _i2.PageRouteInfo<SavedProductsRouteArgs> {
  SavedProductsRoute({
    _i4.Key? key,
    int? shopId,
  }) : super(
          SavedProductsRoute.name,
          path: 'saved',
          args: SavedProductsRouteArgs(
            key: key,
            shopId: shopId,
          ),
        );

  static const String name = 'SavedProductsRoute';
}

class SavedProductsRouteArgs {
  const SavedProductsRouteArgs({
    this.key,
    this.shopId,
  });

  final _i4.Key? key;

  final int? shopId;

  @override
  String toString() {
    return 'SavedProductsRouteArgs{key: $key, shopId: $shopId}';
  }
}
