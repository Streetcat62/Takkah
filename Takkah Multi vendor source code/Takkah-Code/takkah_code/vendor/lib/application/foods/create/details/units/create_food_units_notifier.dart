import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/infrastructure/models/data/unit_model.dart';
import '../../../../../infrastructure/services/services.dart';
import 'create_food_units_state.dart';
import '../../../../../domain/interface/interfaces.dart';

class CreateFoodUnitsNotifier extends StateNotifier<CreateFoodUnitsState> {
  final CatalogRepository _catalogRepository;

  CreateFoodUnitsNotifier(this._catalogRepository)
      : super(CreateFoodUnitsState(unitController: TextEditingController()));

  Future<void> fetchUnits(BuildContext context) async {
    if (state.units.isNotEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _catalogRepository.getUnits();
    response.when(
      success: (data) {
        final List<Unit> units = data.data ?? [];
        state = state.copyWith(units: units, isLoading: false);
        if (units.isNotEmpty) {
          state.unitController?.text =
              units[state.activeIndex].translation?.title ?? '';
        }
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(context,
            text: AppHelpers.trans(
              status.toString(),
            ),
            type: SnackBarType.error);
        debugPrint('====> fetch units fail $failure');
      },
    );
  }

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    state = state.copyWith(activeIndex: index);
    state.unitController?.text = state.units[index].translation?.title ?? '';
  }
}
