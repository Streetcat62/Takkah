import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'banner_products_state.freezed.dart';

@freezed
class BannerProductsState with _$BannerProductsState {
  const factory BannerProductsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> bannerProducts,
  }) = _BannerProductsState;

  const BannerProductsState._();
}
