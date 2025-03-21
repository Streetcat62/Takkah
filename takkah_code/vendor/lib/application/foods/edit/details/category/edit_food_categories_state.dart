import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../infrastructure/models/data/category.dart';


part 'edit_food_categories_state.freezed.dart';

@freezed
class EditFoodCategoriesState with _$EditFoodCategoriesState {
  const factory EditFoodCategoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryModel> categories,
    @Default(0) int activeIndex,
    @Default(0) int activeChildrenIndex,
    TextEditingController? categoriesController,
    CategoryModel? foodCategory,
  }) = _EditFoodCategoriesState;

  const EditFoodCategoriesState._();
}
