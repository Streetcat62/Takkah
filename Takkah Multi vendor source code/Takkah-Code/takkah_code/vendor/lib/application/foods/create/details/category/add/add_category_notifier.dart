import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../infrastructure/services/services.dart';
import 'add_category_state.dart';
import '../../../../../../domain/interface/interfaces.dart';

class AddCategoryNotifier extends StateNotifier<AddCategoryState> {
  final CatalogRepository _catalogRepository;
  String _title = '';

  AddCategoryNotifier(this._catalogRepository)
      : super(const AddCategoryState());

  Future<void> createCategory(BuildContext context,{VoidCallback? success}) async {
    state = state.copyWith(isLoading: true);
    final response = await _catalogRepository.createCategory(title: _title);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false);
        success?.call();
      },
      failure: (fail,status) {
        debugPrint('===> create category fail $fail');
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(
            context,
            text: AppHelpers.trans(
              status.toString(),
            ),
            type: SnackBarType.error
        );
      },
    );
  }

  void setTitle(String value) {
    _title = value.trim();
  }
}
