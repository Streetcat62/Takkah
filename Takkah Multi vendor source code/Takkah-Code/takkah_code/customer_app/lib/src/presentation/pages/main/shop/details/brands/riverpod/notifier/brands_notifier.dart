import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/brands_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../../../../../../core/constants/constants.dart';

class BrandsNotifier extends StateNotifier<BrandsState> {
  final CatalogRepository _brandsRepository;
  int _page = 0;

  BrandsNotifier(this._brandsRepository) : super(const BrandsState());

  Future<void> fetchBrands({VoidCallback? checkYourNetwork}) async {
    if (!state.hasMore) {
      return;
    }
    if (await AppConnectivity.connectivity()) {
      if (_page == 0) {
        state = state.copyWith(isLoading: true);
        final response =
            await _brandsRepository.getBrandsPaginate(page: ++_page);
        response.when(
          success: (data) {
            state = state.copyWith(
              isLoading: false,
              brands: data.data ?? [],
              hasMore: (data.data ?? []).length >= 18,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isLoading: false, hasMore: false);
            debugPrint('==> get shop categories failure: $fail');
          },
        );
      } else {
        state = state.copyWith(isMoreLoading: true);
        final response =
            await _brandsRepository.getBrandsPaginate(page: ++_page);
        response.when(
          success: (data) {
            final List<BrandData> newList = List.from(state.brands);
            newList.addAll(data.data ?? []);
            state = state.copyWith(
              isMoreLoading: false,
              brands: newList,
              hasMore: (data.data ?? []).length >= 18,
            );
          },
          failure: (fail, errorData) {
            _page--;
            state = state.copyWith(isMoreLoading: false);
            debugPrint('==> get brands failure: $fail');
          },
        );
      }
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> updateBrands(BuildContext context) async {
    _page = 0;
    state = state.copyWith(hasMore: true);
    fetchBrands(
      checkYourNetwork: () => AppHelpers.showCheckFlash(
        context,
        AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
      ),
    );
  }
}
