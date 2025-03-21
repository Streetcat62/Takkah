import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../infrastructure/models/data/unit_model.dart';


part 'edit_food_units_state.freezed.dart';

@freezed
class EditFoodUnitsState with _$EditFoodUnitsState {
  const factory EditFoodUnitsState({
    @Default(false) bool isLoading,
    @Default([]) List<Unit> units,
    @Default(0) int activeIndex,
    TextEditingController? unitController,
    Unit? foodUnit,
  }) = _EditFoodUnitsState;

  const EditFoodUnitsState._();
}
