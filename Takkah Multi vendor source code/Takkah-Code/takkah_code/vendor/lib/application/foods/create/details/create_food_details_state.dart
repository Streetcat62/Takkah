import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../infrastructure/models/models.dart';

part 'create_food_details_state.freezed.dart';

@freezed
class CreateFoodDetailsState with _$CreateFoodDetailsState {
  const factory CreateFoodDetailsState({
    @Default('') String title,
    @Default('') String description,
    @Default('') String tax,
    @Default('') String minQty,
    @Default('') String maxQty,
    @Default('') String qrcode,
    @Default(0) int brandId,
    @Default(0) int quantity,
    @Default('') String price,
    @Default(false) bool active,
    @Default(false) bool isCreating,
    @Default('') String? imageFile,
    ProductData? createdProduct,
  }) = _CreateFoodDetailsState;

  const CreateFoodDetailsState._();
}
