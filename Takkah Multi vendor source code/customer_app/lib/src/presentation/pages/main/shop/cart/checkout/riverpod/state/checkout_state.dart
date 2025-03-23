import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({@Default(0) int activeTab}) =
      _CheckoutState;

  const CheckoutState._();
}
