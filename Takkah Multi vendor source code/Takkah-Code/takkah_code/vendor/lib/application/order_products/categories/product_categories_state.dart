import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderfoodyman/infrastructure/models/data/category.dart';
import 'package:venderfoodyman/infrastructure/models/data/main_category.dart';
import '../../../infrastructure/models/data/product_model.dart';

part 'product_categories_state.freezed.dart';

@freezed
class ProductCategoriesState with _$ProductCategoriesState {
  const factory ProductCategoriesState({
    @Default(false) bool isLoading,
    @Default(false) bool isMainLoading,
    @Default(false) bool isCategoryLoading,
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<CategoryModel> category,
    @Default([]) List<MainCategoryModel> mainCategory,
    @Default([]) List<ProductModel> categoryFoods,
    @Default(1) int activeIndex,
    @Default(1) int activeMainIndex,
  }) = _ProductCategoriesState;

  const ProductCategoriesState._();
}
