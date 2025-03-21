import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../../../models/data/order_refund_info.dart';

part 'refund_order_state.freezed.dart';


@freezed
class RefundOrdersState with _$RefundOrdersState {
  const factory RefundOrdersState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingInfo,
    OrderRefundData? orderData,
    @Default('') String message,
  }) = _RefundOrdersState;

  const RefundOrdersState._();
}