import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'liked_products_state.freezed.dart';

@freezed
class LikedProductsState with _$LikedProductsState {
  const factory LikedProductsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _LikedProductsState;

  const LikedProductsState._();
}
