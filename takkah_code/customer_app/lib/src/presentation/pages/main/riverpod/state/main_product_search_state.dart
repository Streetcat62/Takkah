import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/models.dart';

part 'main_product_search_state.freezed.dart';

@freezed
class MainProductSearchState with _$MainProductSearchState {
  const factory MainProductSearchState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _MainProductSearchState;

  const MainProductSearchState._();
}
