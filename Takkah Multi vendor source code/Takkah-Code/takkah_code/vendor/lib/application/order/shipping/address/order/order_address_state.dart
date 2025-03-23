import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../infrastructure/models/data/user_address_model.dart';
import '../../../../../infrastructure/models/models.dart';

part 'order_address_state.freezed.dart';

@freezed
class OrderAddressState with _$OrderAddressState {
  const factory OrderAddressState({
    TextEditingController? textController,
    Location? location,
    @Default('') String entrance,
    @Default('') String floor,
    @Default('') String house,
    @Default([]) List<UserData> users,
    @Default(0) int selectedIndex,
    @Default(0) int selectedAddressIndex,
    @Default(0) int id,
    @Default(false) bool isAddressLoading,
    @Default(false) bool isNewAddress,
    UserData? selectedUser,
    UserAddressData? user,
    Address? selectedAddress,
  }) = _OrderAddressState;

  const OrderAddressState._();
}
