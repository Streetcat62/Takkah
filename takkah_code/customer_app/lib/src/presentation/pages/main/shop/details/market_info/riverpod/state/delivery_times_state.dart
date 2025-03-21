import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_times_state.freezed.dart';

@freezed
class DeliveryTimesState with _$DeliveryTimesState {
  const factory DeliveryTimesState({
    DateTime? selectedDateTime,
  }) = _DeliveryTimesState;

  const DeliveryTimesState._();
}
