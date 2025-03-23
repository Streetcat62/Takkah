import '../data/recipe_category_data.dart';

class SingleRecipeCategory {
  SingleRecipeCategory({RecipeCategoryData? data}) {
    _data = data;
  }

  SingleRecipeCategory.fromJson(dynamic json) {
    _data =
        json['data'] != null ? RecipeCategoryData.fromJson(json['data']) : null;
  }

  RecipeCategoryData? _data;

  SingleRecipeCategory copyWith({RecipeCategoryData? data}) =>
      SingleRecipeCategory(data: data ?? _data);

  RecipeCategoryData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
