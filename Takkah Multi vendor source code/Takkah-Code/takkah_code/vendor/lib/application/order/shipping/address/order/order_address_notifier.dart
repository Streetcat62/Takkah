import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/domain/interface/interfaces.dart';
import '../../../../../infrastructure/models/data/user_address_model.dart';
import 'order_address_state.dart';

class OrderAddressNotifier extends StateNotifier<OrderAddressState> {
  final UsersRepository _usersRepository;
  bool hasMore = true;

  OrderAddressNotifier(this._usersRepository)
      : super(OrderAddressState(textController: TextEditingController()));

  void setHouse(String value) {
    state = state.copyWith(house: value.trim());
  }

  void setFloor(String value) {
    state = state.copyWith(floor: value.trim());
  }

  void setEntrance(String value) {
    state = state.copyWith(entrance: value.trim());
  }

  void setLocation({Location? location, required String title}) {
    state.textController?.text = title;
    state = state.copyWith(location: location);
  }

  void setSelectedAddress(
    int index,
  ) {
    final selectedAddress = state.user?.addresses?[index];

    state = state.copyWith(
        location: selectedAddress?.location,
        selectedAddressIndex: index,
        selectedAddress: selectedAddress);
    state.textController?.text = state.selectedAddress?.address ?? '';
  }

  setNewAddress() {
    state = state.copyWith(isNewAddress: true);
  }

  Future<void> initialFetchSingleUser(
      {required String uuId, required int id,}) async {
    if (state.id != id || state.isNewAddress == true) {
      state = state.copyWith(isAddressLoading: true, id: id);
      final response = await _usersRepository.getSingleUser(uuId: uuId);
      response.when(
        success: (data) {
          state = state.copyWith(isAddressLoading: false);
          UserAddressData user = data.data ?? UserAddressData();
          Address? selectedAddress;

          state = state.copyWith(
            selectedAddress: selectedAddress,
            user: user,
            selectedAddressIndex: 0,
            isAddressLoading: false,
          );
        },
        failure: (error, status) {
          debugPrint('====> fetch single user fail $error');
          state = state.copyWith(isAddressLoading: false);
        },
      );
    }
  }
}
