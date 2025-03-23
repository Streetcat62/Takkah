import 'package:freezed_annotation/freezed_annotation.dart';
import '../../infrastructure/models/data/product_model.dart';


part 'foods_state.freezed.dart';

@freezed
class FoodsState with _$FoodsState {
  const factory FoodsState({
    @Default(false) bool isLoading,
    @Default(false) bool isCategoryLoading,
    @Default([]) List<ProductModel> foods,
    @Default([]) List<ProductModel> categoryFoods,
  }) = _FoodsState;

  const FoodsState._();
}
