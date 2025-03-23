import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../infrastructure/models/models.dart';

part 'order_user_state.freezed.dart';

@freezed
class OrderUserState with _$OrderUserState {
  const factory OrderUserState({
    @Default([]) List<UserData> users,
    @Default(0) int selectedIndex,
    @Default(false) bool isLoading,
    UserData? selectedUser,
    TextEditingController? userTextController,
  }) = _OrderUserState;

  const OrderUserState._();
}
