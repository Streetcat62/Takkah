import '../data/recipe_data.dart';

class SingleRecipeResponse {
  SingleRecipeResponse({RecipeData? data}) {
    _data = data;
  }

  SingleRecipeResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? RecipeData.fromJson(json['data']) : null;
  }

  RecipeData? _data;

  SingleRecipeResponse copyWith({RecipeData? data}) =>
      SingleRecipeResponse(data: data ?? _data);

  RecipeData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
