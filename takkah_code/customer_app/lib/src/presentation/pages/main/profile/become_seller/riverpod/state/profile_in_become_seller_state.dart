import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';
import '../../../../../../../core/constants/constants.dart';

part 'profile_in_become_seller_state.freezed.dart';

@freezed
class ProfileInBecomeSellerState with _$ProfileInBecomeSellerState {
  const factory ProfileInBecomeSellerState({
    @Default(false) bool isLoading,
    @Default(ShopStatus.notRequested) ShopStatus shopStatus,
    UserData? userData,
  }) = _ProfileInBecomeSellerState;

  const ProfileInBecomeSellerState._();
}
