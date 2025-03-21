import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../infrastructure/models/data/unit_model.dart';


part 'create_food_units_state.freezed.dart';

@freezed
class CreateFoodUnitsState with _$CreateFoodUnitsState {
  const factory CreateFoodUnitsState({
    @Default(false) bool isLoading,
    @Default([]) List<Unit> units,
    @Default(0) int activeIndex,
    TextEditingController? unitController,
  }) = _CreateFoodUnitsState;

  const CreateFoodUnitsState._();
}
