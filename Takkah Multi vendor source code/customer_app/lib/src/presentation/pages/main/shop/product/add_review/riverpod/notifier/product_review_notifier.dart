import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/product_review_state.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../../../../../../core/constants/constants.dart';

class ProductReviewNotifier extends StateNotifier<ProductReviewState> {
  final ProductsRepository _productsRepository;
  final SettingsRepository _settingsRepository;

  ProductReviewNotifier(this._productsRepository, this._settingsRepository)
      : super(const ProductReviewState());

  Future<void> addReview({
    VoidCallback? checkYourNetwork,
    VoidCallback? afterReviewed,
    required List<String> imagePaths,
    String? uuid,
    required String comment,
    double? rating,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isReviewing: true);
      List<String> imageUrls = [];
      if (imagePaths.isNotEmpty) {
        for (final String path in imagePaths) {
          final response = await _settingsRepository.uploadImage(
            path,
            UploadType.reviews,
          );
          response.when(
            success: (data) {
              imageUrls.add(data.imageData?.title ?? '');
            },
            failure: (fail, errorData) {
              debugPrint('===> image upload$path failure: $fail');
            },
          );
        }
      }
      final response = await _productsRepository.addReview(
        productUuid: uuid,
        comment: comment,
        rating: rating,
        images: imageUrls,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isReviewing: false);
          afterReviewed?.call();
        },
        failure: (fail, errorData) {
          state = state.copyWith(isReviewing: false);
          debugPrint('==> add review failure: $fail');
          afterReviewed?.call();
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
