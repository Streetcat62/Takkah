import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'category_details_state.freezed.dart';

@freezed
class CategoryDetailsState with _$CategoryDetailsState {
  const factory CategoryDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(true) bool hasMore,
    @Default([]) List<ProductData> products,
  }) = _CategoryDetailsState;

  const CategoryDetailsState._();
}
