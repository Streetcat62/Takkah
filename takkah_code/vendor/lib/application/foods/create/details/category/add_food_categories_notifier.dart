import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../infrastructure/models/data/category.dart';
import '../../../../../infrastructure/services/services.dart';
import 'add_food_categories_state.dart';
import '../../../../../domain/interface/interfaces.dart';

class AddFoodCategoriesNotifier extends StateNotifier<AddFoodCategoriesState> {
  final CatalogRepository _catalogRepository;
  int _page = 0;

  AddFoodCategoriesNotifier(this._catalogRepository)
      : super(
          AddFoodCategoriesState(categoryController: TextEditingController()),
        );

  Future<void> updateCategories(BuildContext context) async {
    _page = 0;
    final response = await _catalogRepository.getCategories(page: ++_page);
    response.when(
      success: (data) {
        List<CategoryModel> categories = List.from(state.categories);
        final List<CategoryModel> newCategories = data.data ?? [];
        for (final category in newCategories) {
          bool contains = false;
          for (final oldCategory in categories) {
            if (category.id == oldCategory.id) {
              contains = true;
            }
          }
          if (!contains) {
            categories.insert(0, category);
          }
        }
        state = state.copyWith(category: categories, activeIndex: 0);
        if (categories.isNotEmpty) {
          state.categoryController?.text = state
                  .categories[state.activeIndex].category?.translation?.title ??
              '';
        }
      },
      failure: (failure, status) {
        debugPrint('====> fetch categories fail $failure');
        _page--;
        AppHelpers.showCheckTopSnackBar(context,
            text: AppHelpers.trans(
              status.toString(),
            ),
            type: SnackBarType.error);
      },
    );
  }

  void setActiveIndex(int index) {
    state = state.copyWith(activeIndex: index, activeChildrenIndex: -1);
  }

  void setActiveChildrenIndex(int index, int i) {
    if (state.activeChildrenIndex == i) {
      return;
    }
    state = state.copyWith(activeChildrenIndex: i);
    state.categoryController?.text =
        state.categories[index].category?.children?[i].translation?.title ?? '';
  }

  void setCategories(List<CategoryModel> categories) {
    if (state.categories.isEmpty) {
      _page = 0;
      state = state.copyWith(categories: categories, activeIndex: 0);
      if (categories[0].category?.children?.isNotEmpty ?? false) {
        state.categoryController?.text =
            state.categories[state.activeIndex].category?.translation?.title ??
                '';
      }
    }
  }
}
