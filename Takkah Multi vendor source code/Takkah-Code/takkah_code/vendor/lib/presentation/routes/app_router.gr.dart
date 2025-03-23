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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../pages/generate_image/generate_image_page.dart' as _i5;
import '../pages/main/create_order/shipping/widgets/select_address_page.dart'
    as _i4;
import '../pages/main/create_order/shipping/widgets/sub_categories_page.dart'
    as _i3;
import '../pages/main/foods/widgets/sub_category_products.dart' as _i2;
import '../pages/pages.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    OrderRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OrderPage(),
      );
    },
    IncomeRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.IncomePage(),
      );
    },
    SelectUserRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SelectUserPage(),
      );
    },
    SubCategoryProductsRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SubCategoryProductsPage(),
      );
    },
    SubCategoryProductsOrderRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SubCategoryProductsOrderPage(),
      );
    },
    SelectAddressFromListRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SelectAddressFromListPage(),
      );
    },
    DeliveryTimeRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DeliveryTimePage(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OrderHistoryPage(),
      );
    },
    DeliveryZoneRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DeliveryZonePage(),
      );
    },
    NoConnectionRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NoConnectionPage(),
      );
    },
    SelectAddressRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SelectAddressPage(),
      );
    },
    CreateOrderRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.CreateOrderPage(),
      );
    },
    ShippingAddressRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ShippingAddressPage(),
      );
    },
    ListNotificationRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ListNotificationPage(),
      );
    },
    GenerateImageRoute.name: (routeData) {
      return _i6.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i5.GenerateImagePage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          MainRoute.name,
          path: '/main',
        ),
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i6.RouteConfig(
          OrderRoute.name,
          path: '/order',
        ),
        _i6.RouteConfig(
          IncomeRoute.name,
          path: '/income',
        ),
        _i6.RouteConfig(
          SelectUserRoute.name,
          path: '/select-user',
        ),
        _i6.RouteConfig(
          SubCategoryProductsRoute.name,
          path: '/sub-category-products',
        ),
        _i6.RouteConfig(
          SubCategoryProductsOrderRoute.name,
          path: '/sub-category-orders-products',
        ),
        _i6.RouteConfig(
          SelectAddressFromListRoute.name,
          path: '/select-address-from-list',
        ),
        _i6.RouteConfig(
          DeliveryTimeRoute.name,
          path: '/delivery-time',
        ),
        _i6.RouteConfig(
          OrderHistoryRoute.name,
          path: '/order-history',
        ),
        _i6.RouteConfig(
          DeliveryZoneRoute.name,
          path: '/delivery-zone',
        ),
        _i6.RouteConfig(
          NoConnectionRoute.name,
          path: '/no-connection',
        ),
        _i6.RouteConfig(
          SelectAddressRoute.name,
          path: '/select-address',
        ),
        _i6.RouteConfig(
          CreateOrderRoute.name,
          path: '/order-products',
        ),
        _i6.RouteConfig(
          ShippingAddressRoute.name,
          path: '/shipping-address',
        ),
        _i6.RouteConfig(
          ListNotificationRoute.name,
          path: '/list-notification',
        ),
        _i6.RouteConfig(
          GenerateImageRoute.name,
          path: '/generate_image',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i1.OrderPage]
class OrderRoute extends _i6.PageRouteInfo<void> {
  const OrderRoute()
      : super(
          OrderRoute.name,
          path: '/order',
        );

  static const String name = 'OrderRoute';
}

/// generated route for
/// [_i1.IncomePage]
class IncomeRoute extends _i6.PageRouteInfo<void> {
  const IncomeRoute()
      : super(
          IncomeRoute.name,
          path: '/income',
        );

  static const String name = 'IncomeRoute';
}

/// generated route for
/// [_i1.SelectUserPage]
class SelectUserRoute extends _i6.PageRouteInfo<void> {
  const SelectUserRoute()
      : super(
          SelectUserRoute.name,
          path: '/select-user',
        );

  static const String name = 'SelectUserRoute';
}

/// generated route for
/// [_i2.SubCategoryProductsPage]
class SubCategoryProductsRoute extends _i6.PageRouteInfo<void> {
  const SubCategoryProductsRoute()
      : super(
          SubCategoryProductsRoute.name,
          path: '/sub-category-products',
        );

  static const String name = 'SubCategoryProductsRoute';
}

/// generated route for
/// [_i3.SubCategoryProductsOrderPage]
class SubCategoryProductsOrderRoute extends _i6.PageRouteInfo<void> {
  const SubCategoryProductsOrderRoute()
      : super(
          SubCategoryProductsOrderRoute.name,
          path: '/sub-category-orders-products',
        );

  static const String name = 'SubCategoryProductsOrderRoute';
}

/// generated route for
/// [_i4.SelectAddressFromListPage]
class SelectAddressFromListRoute extends _i6.PageRouteInfo<void> {
  const SelectAddressFromListRoute()
      : super(
          SelectAddressFromListRoute.name,
          path: '/select-address-from-list',
        );

  static const String name = 'SelectAddressFromListRoute';
}

/// generated route for
/// [_i1.DeliveryTimePage]
class DeliveryTimeRoute extends _i6.PageRouteInfo<void> {
  const DeliveryTimeRoute()
      : super(
          DeliveryTimeRoute.name,
          path: '/delivery-time',
        );

  static const String name = 'DeliveryTimeRoute';
}

/// generated route for
/// [_i1.OrderHistoryPage]
class OrderHistoryRoute extends _i6.PageRouteInfo<void> {
  const OrderHistoryRoute()
      : super(
          OrderHistoryRoute.name,
          path: '/order-history',
        );

  static const String name = 'OrderHistoryRoute';
}

/// generated route for
/// [_i1.DeliveryZonePage]
class DeliveryZoneRoute extends _i6.PageRouteInfo<void> {
  const DeliveryZoneRoute()
      : super(
          DeliveryZoneRoute.name,
          path: '/delivery-zone',
        );

  static const String name = 'DeliveryZoneRoute';
}

/// generated route for
/// [_i1.NoConnectionPage]
class NoConnectionRoute extends _i6.PageRouteInfo<void> {
  const NoConnectionRoute()
      : super(
          NoConnectionRoute.name,
          path: '/no-connection',
        );

  static const String name = 'NoConnectionRoute';
}

/// generated route for
/// [_i1.SelectAddressPage]
class SelectAddressRoute extends _i6.PageRouteInfo<void> {
  const SelectAddressRoute()
      : super(
          SelectAddressRoute.name,
          path: '/select-address',
        );

  static const String name = 'SelectAddressRoute';
}

/// generated route for
/// [_i1.CreateOrderPage]
class CreateOrderRoute extends _i6.PageRouteInfo<void> {
  const CreateOrderRoute()
      : super(
          CreateOrderRoute.name,
          path: '/order-products',
        );

  static const String name = 'CreateOrderRoute';
}

/// generated route for
/// [_i1.ShippingAddressPage]
class ShippingAddressRoute extends _i6.PageRouteInfo<void> {
  const ShippingAddressRoute()
      : super(
          ShippingAddressRoute.name,
          path: '/shipping-address',
        );

  static const String name = 'ShippingAddressRoute';
}

/// generated route for
/// [_i1.ListNotificationPage]
class ListNotificationRoute extends _i6.PageRouteInfo<void> {
  const ListNotificationRoute()
      : super(
          ListNotificationRoute.name,
          path: '/list-notification',
        );

  static const String name = 'ListNotificationRoute';
}

/// generated route for
/// [_i5.GenerateImagePage]
class GenerateImageRoute extends _i6.PageRouteInfo<void> {
  const GenerateImageRoute()
      : super(
          GenerateImageRoute.name,
          path: '/generate_image',
        );

  static const String name = 'GenerateImageRoute';
}
