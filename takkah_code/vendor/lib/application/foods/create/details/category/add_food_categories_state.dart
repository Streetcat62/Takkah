import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderfoodyman/infrastructure/models/data/category.dart';

part 'add_food_categories_state.freezed.dart';

@freezed
class AddFoodCategoriesState with _$AddFoodCategoriesState {
  const factory AddFoodCategoriesState({
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<CategoryModel> category,
    @Default(0) int activeIndex,
    @Default(-1) int activeChildrenIndex,
    TextEditingController? categoryController,
  }) = _AddFoodCategoriesState;

  const AddFoodCategoriesState._();
}
