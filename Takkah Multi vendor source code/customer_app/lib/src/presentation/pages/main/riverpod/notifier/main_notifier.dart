import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/main_state.dart';
import 'main_shop_search_notifier.dart';
import 'main_product_search_notifier.dart';

class MainNotifier extends StateNotifier<MainState> {
  Timer? _timer;
  int _lastActiveTab = 0;

  MainNotifier() : super(const MainState());

  void setQuery(
    BuildContext context, {
    required String query,
    required TabsRouter tabsRouter,
    required MainShopSearchNotifier shopSearchNotifier,
    required MainProductSearchNotifier productSearchNotifier,
  }) {
    if (state.query == query) {
      return;
    }
    state = state.copyWith(query: query.trim());
    if (state.query.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          if (!state.isSearching) {
            _lastActiveTab = tabsRouter.activeIndex;
            state = state.copyWith(isSearching: true);
          }
          tabsRouter.setActiveIndex(2);
          shopSearchNotifier.searchShops(query: query);
          productSearchNotifier.searchProducts(query: query);
        },
      );
    } else {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          debugPrint('===> set query go back $_lastActiveTab');
          state = state.copyWith(isSearching: false);
          tabsRouter.setActiveIndex(_lastActiveTab);
        },
      );
    }
  }
}
