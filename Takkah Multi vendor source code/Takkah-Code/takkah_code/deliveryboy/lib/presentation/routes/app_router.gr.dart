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
import 'package:flutter/material.dart' as _i3;

import '../pages/pages.dart' as _i1;

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
    HomeRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginPage(),
      );
    },
    StoryRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.StoryPage(),
      );
    },
    IncomeRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.IncomePage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ProfilePage(),
      );
    },
    OrdersRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OrdersPage(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.OrderHistoryPage(),
      );
    },
    NoConnectionRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.NoConnectionPage(),
      );
    },
    ListNotificationRoute.name: (routeData) {
      return _i2.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ListNotificationPage(),
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
          HomeRoute.name,
          path: '/home',
        ),
        _i2.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i2.RouteConfig(
          StoryRoute.name,
          path: '/story',
        ),
        _i2.RouteConfig(
          IncomeRoute.name,
          path: '/income',
        ),
        _i2.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i2.RouteConfig(
          OrdersRoute.name,
          path: '/ordersPage',
        ),
        _i2.RouteConfig(
          OrderHistoryRoute.name,
          path: '/orderHistory',
        ),
        _i2.RouteConfig(
          NoConnectionRoute.name,
          path: '/no-connection',
        ),
        _i2.RouteConfig(
          ListNotificationRoute.name,
          path: '/listNotification',
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
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
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
/// [_i1.StoryPage]
class StoryRoute extends _i2.PageRouteInfo<void> {
  const StoryRoute()
      : super(
          StoryRoute.name,
          path: '/story',
        );

  static const String name = 'StoryRoute';
}

/// generated route for
/// [_i1.IncomePage]
class IncomeRoute extends _i2.PageRouteInfo<void> {
  const IncomeRoute()
      : super(
          IncomeRoute.name,
          path: '/income',
        );

  static const String name = 'IncomeRoute';
}

/// generated route for
/// [_i1.ProfilePage]
class ProfileRoute extends _i2.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i1.OrdersPage]
class OrdersRoute extends _i2.PageRouteInfo<void> {
  const OrdersRoute()
      : super(
          OrdersRoute.name,
          path: '/ordersPage',
        );

  static const String name = 'OrdersRoute';
}

/// generated route for
/// [_i1.OrderHistoryPage]
class OrderHistoryRoute extends _i2.PageRouteInfo<void> {
  const OrderHistoryRoute()
      : super(
          OrderHistoryRoute.name,
          path: '/orderHistory',
        );

  static const String name = 'OrderHistoryRoute';
}

/// generated route for
/// [_i1.NoConnectionPage]
class NoConnectionRoute extends _i2.PageRouteInfo<void> {
  const NoConnectionRoute()
      : super(
          NoConnectionRoute.name,
          path: '/no-connection',
        );

  static const String name = 'NoConnectionRoute';
}

/// generated route for
/// [_i1.ListNotificationPage]
class ListNotificationRoute extends _i2.PageRouteInfo<void> {
  const ListNotificationRoute()
      : super(
          ListNotificationRoute.name,
          path: '/listNotification',
        );

  static const String name = 'ListNotificationRoute';
}
