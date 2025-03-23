import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_cancel_state.freezed.dart';

@freezed
class OrderCancelState with _$OrderCancelState {
  const factory OrderCancelState({@Default(false) bool isLoading}) =
      _OrderCancelState;

  const OrderCancelState._();
}
