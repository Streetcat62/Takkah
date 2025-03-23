import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderfoodyman/infrastructure/models/data/brand_data.dart';
import 'package:venderfoodyman/infrastructure/models/data/category.dart';
import 'package:venderfoodyman/infrastructure/models/data/main_category.dart';

part 'food_categories_state.freezed.dart';

@freezed
class FoodCategoriesState with _$FoodCategoriesState {
  const factory FoodCategoriesState({
    @Default(false) bool isLoading,
    @Default(false) bool isMainLoading,
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<CategoryModel> category,
    @Default([]) List<MainBrand> brand,
    @Default(1) int activeIndex,
    @Default(1) int activeChildrenIndex,
    @Default(1) int activeMainIndex,
     @Default([]) List<MainCategoryModel> mainCategory,
    @Default(1) int activeBrandIndex,
    TextEditingController? brandController,
  }) = _FoodCategoriesState;

  const FoodCategoriesState._();
}
