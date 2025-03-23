import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'restaurant_state.dart';
import '../../domain/interface/interfaces.dart';
import '../../infrastructure/models/models.dart';
import '../../infrastructure/services/services.dart';

class RestaurantNotifier extends StateNotifier<RestaurantState> {
  final UsersRepository _usersRepository;
  final SettingsRepository _settingsRepository;
  String _title = '';
  String _description = '';
  String _phone = '';

  RestaurantNotifier(this._usersRepository, this._settingsRepository)
      : super(const RestaurantState());

  Future<void> updateWorkingDays(List<ShopWorkingDays> days) async {
    final shop = state.shop?.copyWith(shopWorkingDays: days);
    LocalStorage.instance.setShop(shop);
    state = state.copyWith(shop: shop);
  }

  Future<void> fetchMyShop({VoidCallback? afterFetched}) async {
    final response = await _usersRepository.getMyShop();
    response.when(
      success: (data) {
        LocalStorage.instance.setShop(data.data);
        state = state.copyWith(shop: data.data);
        afterFetched?.call();
      },
      failure: (failure,status) {
        state = state.copyWith(shop: LocalStorage.instance.getShop());
        afterFetched?.call();
        debugPrint('==> error with fetching my shop $failure');
      },
    );
  }

  void setPhone(String value) {
    _phone = value.trim();
  }

  void setDescription(String value) {
    _description = value.trim();
  }

  void setTitle(String value) {
    _title = value.trim();
  }

  void setLogoImageFile(String? file) {
    state = state.copyWith(logoImageFile: file);
  }

  Future<void> updateShop(BuildContext context,{VoidCallback? updateSuccess}) async {
    if (state.backgroundImageFile == null && state.logoImageFile == null) {
      updateSuccess?.call();
    }
    state = state.copyWith(isLoading: true);
    String? backUrl;
    if (state.backgroundImageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.backgroundImageFile!,
        UploadType.shopsBack,
      );
      imageResponse.when(
        success: (data) {
          backUrl = data.imageData?.title;
        },
        failure: (failure,status) {
          debugPrint('==> upload shop back image fail: $failure');
          AppHelpers.showCheckTopSnackBar(
              context,
              text: AppHelpers.trans(
                status.toString(),
              ),
              type: SnackBarType.error
          );
        },
      );
    }
    String? logoUrl;
    if (state.logoImageFile != null) {
      final imageResponse = await _settingsRepository.uploadImage(
        state.logoImageFile!,
        UploadType.shopsLogo,
      );
      imageResponse.when(
        success: (data) {
          logoUrl = data.imageData?.title;
        },
        failure: (failure,status) {
          debugPrint('==> upload shop logo image fail: $failure');
          AppHelpers.showCheckTopSnackBar(
              context,
              text: AppHelpers.trans(
                status.toString(),
              ),
              type: SnackBarType.error
          );
        },
      );
    }
    Translation? newTranslation = state.shop?.translation;
    newTranslation = newTranslation?.copyWith(
      title: _title.isNotEmpty ? _title : newTranslation.title,
      description:
          _description.isNotEmpty ? _description : newTranslation.description,
    );

    final response = await _usersRepository.updateShop(
      backImg: backUrl ?? state.shop?.backgroundImg,
      logoImg: logoUrl ?? state.shop?.logoImg,
      tax: state.shop?.tax.toString(),
      percentage: state.shop?.percentage.toString(),
      phone: _phone.isNotEmpty ? _phone : state.shop?.phone,
      type: state.shop?.type,
      pricePerKm: state.shop?.pricePerKm,
      minAmount: state.shop?.minAmount.toString(),
      price: state.shop?.price,
      translation: newTranslation,
      categories: state.shop?.categories,
      deliveryTime: state.shop?.deliveryTime,
      tags: state.shop?.tags,
    );
    response.when(
      success: (data) {
        _title = '';
        _description = '';
        _phone = '';
        state = state.copyWith(
          isLoading: false,
          shop: data.data,
          backgroundImageFile: null,
          logoImageFile: null,
        );
        updateSuccess?.call();
      },
      failure: (failure,status) {
        debugPrint('===> update shop fail $failure');
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(
            context,
            text: AppHelpers.trans(
              status.toString(),
            ),
            type: SnackBarType.error
        );
      },
    );
  }

  void setBackgroundImageFile(String? file) {
    state = state.copyWith(backgroundImageFile: file);
  }

  void setOnlineOffline() {
    _usersRepository.setOnlineOffline();
  }
}
