import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/wallet_histories_state.dart';
import '../../../../../../../repository/repository.dart';

class WalletHistoriesNotifier extends StateNotifier<WalletHistoriesState> {
  final UserRepository _userRepository;
  int _page = 0;

  WalletHistoriesNotifier(this._userRepository)
      : super(const WalletHistoriesState());

  Future<void> fetchWalletHistories() async {
    state = state.copyWith(isLoading: true);
    final response = await _userRepository.getWalletHistories(page: ++_page);
    response.when(
      success: (data) {
        state = state.copyWith(wallets: data.data ?? [], isLoading: false);
      },
      failure: (fail, errorData) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get wallet histories failure: $fail');
      },
    );
  }
}
