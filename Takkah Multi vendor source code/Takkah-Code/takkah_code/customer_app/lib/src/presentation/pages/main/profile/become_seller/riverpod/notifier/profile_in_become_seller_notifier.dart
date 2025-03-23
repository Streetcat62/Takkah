import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/utils/utils.dart';
import '../state/profile_in_become_seller_state.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class ProfileInBecomeSellerNotifier
    extends StateNotifier<ProfileInBecomeSellerState> {
  final UserRepository _userRepository;

  ProfileInBecomeSellerNotifier(this._userRepository)
      : super(const ProfileInBecomeSellerState());

  Future<void> fetchProfileDetails({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.getProfileDetails();
      response.when(
        success: (data) {
          final status = data.data?.shop?.status;
          ShopStatus shopStatus = ShopStatus.notRequested;
          if (status != null) {
            switch (status) {
              case 'new':
                shopStatus = ShopStatus.newShop;
                break;
              case 'rejected':
                shopStatus = ShopStatus.rejected;
                break;
              case 'approved':
                shopStatus = ShopStatus.approved;
                break;
              default:
                shopStatus = ShopStatus.notRequested;
                break;
            }
          }
          state = state.copyWith(
            userData: data.data,
            shopStatus: shopStatus,
            isLoading: false,
          );
          LocalStorage.instance.setUser(data.data);
          if (data.data?.wallet != null) {
            LocalStorage.instance.setWallet(data.data?.wallet);
          }
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> get profile details failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
