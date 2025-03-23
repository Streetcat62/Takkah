import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'online_state.dart';
import '../../../domain/interface/interfaces.dart';
import '../../../infrastructure/services/services.dart';

class OnlineNotifier extends StateNotifier<OnlineState> {
  final UserRepository _userRepository;
  final ImageCropperMarker image = ImageCropperMarker();

  OnlineNotifier(this._userRepository) : super(const OnlineState());

  Future<void> setOnline(
    BuildContext context,
    ValueNotifier<bool> toggleController, {
    VoidCallback? success,
  }) async {
    if (toggleController.value == LocalStorage.instance.getOnline()) {
      return;
    }
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.setOnline();
      response.when(
        success: (data) {
          LocalStorage.instance.setOnline(!LocalStorage.instance.getOnline());
          state = state.copyWith(isLoading: false);
          success?.call();
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          toggleController.value = !toggleController.value;
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
        },
      );
    } else {
      toggleController.value = !toggleController.value;
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
