import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../infrastructure/models/data/brand_data.dart';
import '../../../../infrastructure/models/data/product_model.dart';
import 'edit_food_details_state.dart';
import '../../../../domain/interface/interfaces.dart';
import '../../../../infrastructure/services/services.dart';

class EditFoodDetailsNotifier extends StateNotifier<EditFoodDetailsState> {
  final ProductsRepository _productsRepository;
  final SettingsRepository _settingsRepository;
  final CatalogRepository _catalogRepository;

  EditFoodDetailsNotifier(this._productsRepository, this._settingsRepository,
      this._catalogRepository)
      : super(EditFoodDetailsState(brandController: TextEditingController()));

  void setTax(String value) {
    state = state.copyWith(tax: value.trim());
  }

  void setMaxQty(String value) {
    state = state.copyWith(maxQty: value.trim());
  }

  void setMinQty(String value) {
    state = state.copyWith(minQty: value.trim());
  }

  void setPrice(String value) {
    state = state.copyWith(price: value.trim());
  }

  void setActive(bool? value) {
    final product = state.product?.copyWith(active: state.active ? 1 : 0);
    state = state.copyWith(product: product);
  }

  void setQuantity(String value) {
    state = state.copyWith(quantity: int.tryParse(value.trim()) ?? 0);
  }

  Future<void> updateProduct(BuildContext context,
      {VoidCallback? failed, VoidCallback? onSuccess}) async {
    state = state.copyWith(isLoading: true);
    String? imageUrl;
    if (state.imageFilePath != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.imageFilePath!,
        UploadType.products,
      );
      imageResponse.when(
        success: (data) {
          imageUrl = data.imageData?.title;
        },
        failure: (fail, status) {
          debugPrint('===> product image upload fail $fail');
          AppHelpers.showCheckTopSnackBar(context,
              text: AppHelpers.trans(
                status.toString(),
              ),
              type: SnackBarType.error);
        },
      );
    }
    final response = await _productsRepository.updateProduct(
      tax: state.tax,
      maxQty: state.maxQty,
      minQty: state.minQty,
      active: state.active,
      image: imageUrl ?? state.product?.product?.img,
      productId: state.product?.product?.id ?? 0,
      id: state.product?.id ?? 0,
      price: state.price ?? state.product?.price.toString() ?? '',
      quantity: state.product?.quantity ?? 0,
    );
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, product: state.product);
        onSuccess?.call();
      },
      failure: (fail, status) {
        AppHelpers.showCheckTopSnackBar(context,
            text: AppHelpers.trans(
              status.toString(),
            ),
            type: SnackBarType.error);
        state = state.copyWith(isLoading: false);
        debugPrint('===> product update fail $fail');
        failed?.call();
      },
    );
  }

  void setBarcode(String value) {
    state = state.copyWith(qrCode: value.trim());
  }

  void setDescription(String value) {
    state = state.copyWith(description: value.trim());
  }

  void setTitle(String value) {
    state = state.copyWith(title: value.trim());
  }

  void setImageFile(String? filePath) {
    state = state.copyWith(imageFilePath: filePath);
  }

  void setFoodDetails(ProductModel? product) {
    state = state.copyWith(
      product: product,
      imageFilePath: null,
      minQty: product?.minQty.toString() ?? '',
      maxQty: product?.maxQty.toString() ?? '',
      tax: '${product?.tax}',
      title: product?.product?.translation?.title ?? '',
      qrCode: product?.product?.qrCode ?? '',
      active: product?.active == 0 ? true : false,
    );
  }

  void setActiveBrandIndex(int index) {
    if (state.activeBrandIndex == index) {
      return;
    }

    state = state.copyWith(activeBrandIndex: index);
    state.brandController?.text = state.brands[index].brand?.title ?? '';
  }

  void setBrands(List<MainBrand> brand) {
    if (state.brands.isEmpty) {
      state = state.copyWith(brands: brand, activeBrandIndex: 0);
      if (brand.isNotEmpty) {
        state.brandController?.text = state.brands[0].brand?.title ?? '';
      }
    }
  }

  Future<void> fetchBrands(BuildContext context) async {
    if (state.brands.isNotEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _catalogRepository.getBrands();
    response.when(
      success: (data) {
        final List<MainBrand> brands = data.data ?? [];
        state = state.copyWith(brands: brands, isLoading: false);
        if (brands.isNotEmpty) {
          state.brandController?.text =
              brands[state.activeBrandIndex].brand?.title ?? '';
        }
      },
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(context,
            text: AppHelpers.trans(
              status.toString(),
            ),
            type: SnackBarType.error);
        debugPrint('====> fetch units fail $failure');
      },
    );
  }
}
