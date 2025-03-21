import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'checkout_payments_state.freezed.dart';

@freezed
class CheckoutPaymentsState with _$CheckoutPaymentsState {
  const factory CheckoutPaymentsState({
    @Default(false) bool isLoading,
    @Default(false) bool isValid,
    @Default([]) List<PaymentData> payments,
    @Default(0) int selectedPaymentIndex,
  }) = _CheckoutPaymentsState;

  const CheckoutPaymentsState._();
}
