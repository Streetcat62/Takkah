import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/delete_user_state.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';

class DeleteUserNotifier extends StateNotifier<DeleteUserState> {
  final UserRepository _userRepository;

  DeleteUserNotifier(this._userRepository) : super(const DeleteUserState());

  Future<void> deleteUser({
    VoidCallback? checkYourNetwork,
    VoidCallback? deleted,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await _userRepository.deleteUser();
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false);
          final GoogleSignIn signIn = GoogleSignIn();
          signIn.disconnect();
          signIn.signOut();
          LocalStorage.instance.logout();
          deleted?.call();
        },
        failure: (fail, errorData) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> delete profile failure: $fail');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
