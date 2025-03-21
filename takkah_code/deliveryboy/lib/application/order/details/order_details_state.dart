import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../infrastructure/models/models.dart';

part 'order_details_state.freezed.dart';

@freezed
class OrderDetailsState with _$OrderDetailsState {
  const factory OrderDetailsState({
    @Default(false) bool isLoading,
    OrderDetailData? order,
  }) = _OrderDetailsState;

  const OrderDetailsState._();
}
