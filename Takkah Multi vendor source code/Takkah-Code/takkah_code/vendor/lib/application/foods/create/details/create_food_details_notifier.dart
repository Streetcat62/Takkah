import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_food_details_state.dart';
import '../../../../domain/interface/interfaces.dart';
import '../../../../infrastructure/services/services.dart';

class CreateFoodDetailsNotifier extends StateNotifier<CreateFoodDetailsState> {
  final ProductsRepository _productsRepository;
  final SettingsRepository _settingsRepository;

  CreateFoodDetailsNotifier(
    this._productsRepository,
    this._settingsRepository,
  ) : super(const CreateFoodDetailsState());

  void updateAddFoodInfo() {
    state = state.copyWith(
      imageFile: null,
      title: '',
      description: '',
      minQty: '',
      maxQty: '',
      tax: '',
      qrcode: '',
      active: false,
      createdProduct: null,
    );
  }

  void setQrcode(String value) {
    state = state.copyWith(qrcode: value.trim());
  }

  Future<void> createProduct(BuildContext context,
      {int? categoryId,
      int? unitId,
      int? brandId,
      VoidCallback? created,
      VoidCallback? onError}) async {
    state = state.copyWith(isCreating: true);
    String? imageUrl;
    if (state.imageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.imageFile!,
        UploadType.products,
      );
      imageResponse.when(
        success: (data) {
          imageUrl = data.imageData?.title;
        },
        failure: (failure, status) {
          debugPrint('==> upload product image fail: $failure');
          AppHelpers.showCheckTopSnackBar(context,
              text: AppHelpers.trans(
                status.toString(),
              ),
              type: SnackBarType.error);
        },
      );
    }
    final response = await _productsRepository.createProduct(
      title: state.title,
      description: state.description,
      tax: state.tax,
      minQty: state.minQty,
      maxQty: state.maxQty,
      active: state.active,
      qrcode: state.qrcode,
      categoryId: categoryId,
      unitId: unitId,
      image: imageUrl,
      brandId: brandId ?? 0,
      price: state.price,
      quantity: state.quantity,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isCreating: false, createdProduct: data.data);
        created?.call();
      },
      failure: (fail, status) {
        debugPrint('===> create product fail $fail');
        state = state.copyWith(isCreating: false);
        AppHelpers.showCheckTopSnackBar(context,
            text: AppHelpers.trans(
              "The bar code has already been taken.",
            ),
            type: SnackBarType.error);
        onError?.call();
      },
    );
  }

  void setActive(bool? value) {
    state = state.copyWith(active: !state.active);
    debugPrint('===> set active ${state.active}');
  }

  void setMaxQty(String value) {
    state = state.copyWith(maxQty: value.trim());
  }

  void setMinQty(String value) {
    state = state.copyWith(minQty: value.trim());
  }

  void setTax(String value) {
    state = state.copyWith(tax: value.trim());
  }

  void setDescription(String value) {
    state = state.copyWith(description: value.trim());
  }

  void setTitle(String value) {
    state = state.copyWith(title: value.trim());
  }

  void setPrice(String value) {
    state = state.copyWith(price: value.trim());
  }

  void setQuantity(String value) {
    state = state.copyWith(quantity: int.tryParse(value.trim()) ?? 0);
  }

  void setImageFile(String? file) {
    state = state.copyWith(imageFile: file);
  }
}
