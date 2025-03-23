import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../infrastructure/models/models.dart';

part 'new_alert_order_state.freezed.dart';

@freezed
class NewAlertOrderState with _$NewAlertOrderState {
  const factory NewAlertOrderState({
    @Default(false) bool isLoading,
    @Default(false) bool isTimeOut,
    @Default(false) bool isSaving,
    @Default('0 s') String timerText,
    OrderDetailData? order,
  }) = _NewAlertOrderState;

  const NewAlertOrderState._();
}
