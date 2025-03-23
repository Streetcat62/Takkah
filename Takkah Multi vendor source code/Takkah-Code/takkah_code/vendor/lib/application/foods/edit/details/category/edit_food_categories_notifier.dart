import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../infrastructure/models/data/category.dart';
import 'edit_food_categories_state.dart';


class EditFoodCategoriesNotifier
    extends StateNotifier<EditFoodCategoriesState> {
  EditFoodCategoriesNotifier()
      : super(
          EditFoodCategoriesState(
            categoriesController: TextEditingController(),
          ),
        );

  // void setCategories(List<CategoryModel> categories) {
  //   int? index;
  //   if (state.foodCategory != null) {
  //     for (int i = 0; i < categories.length; i++) {
  //       if (state.foodCategory?.id == categories[i].id) {
  //         index = i;
  //       }
  //     }
  //     if (index == null) {
  //       categories.insert(0, state.foodCategory!);
  //     }
  //   }
  //   state = state.copyWith(
  //     categories: categories,
  //     activeIndex: index ?? 0,
  //     foodCategory: categories.isEmpty ? null : categories[index ?? 0],
  //   );
  //   state.categoriesController?.text =
  //       state.foodCategory?.category?.translation?.title ?? '';
  // }

  void setFoodCategory(CategoryModel? category) {
    state = state.copyWith(foodCategory: category);
    state.categoriesController?.text = category?.category?.translation?.title ?? '';
  }

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    final newCategory = state.categories[index];
    state = state.copyWith(activeIndex: index, foodCategory: newCategory);
    state.categoriesController?.text = newCategory.category?.translation?.title ?? '';
  }

   

  void setCategories(List<CategoryModel> categories) {
    if (state.categories.isEmpty) {
     
      state = state.copyWith(categories: categories, activeIndex: 0);
      if (categories.isNotEmpty) {
        state.categoriesController?.text =
            state.categories[0].category?.translation?.title ?? '';
      }
    }
  }void setActiveChildrenIndex(int index, int i) {
    if (state.activeChildrenIndex == i) {
      return;
    }
    state = state.copyWith(activeChildrenIndex: i);
    state.categoriesController?.text =
        state.categories[index].category?.children?[i].translation?.title ?? '';
  }
}
