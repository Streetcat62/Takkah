import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venderfoodyman/infrastructure/models/data/brand_data.dart';
import '../../../../infrastructure/models/data/product_model.dart';

part 'edit_food_details_state.freezed.dart';

@freezed
class EditFoodDetailsState with _$EditFoodDetailsState {
  const factory EditFoodDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool active,
    @Default(0) int activeBrandIndex,
    @Default('') String title,
    String? price,
    @Default('') String description,
    @Default('') String minQty,
    @Default('') String maxQty,
    @Default('') String tax,
    @Default(0) int quantity,
    @Default('') String qrCode,
    ProductModel? product,
    @Default([]) List<MainBrand> brands,
    String? imageFilePath,
    TextEditingController? brandController,
  }) = _EditFoodDetailsState;

  const EditFoodDetailsState._();
}
