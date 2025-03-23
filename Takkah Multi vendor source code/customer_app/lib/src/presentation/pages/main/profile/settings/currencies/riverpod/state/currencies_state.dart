import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'currencies_state.freezed.dart';

@freezed
class CurrenciesState with _$CurrenciesState {
  const factory CurrenciesState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default([]) List<CurrencyData> currencies,
    CurrencyData? selectedCurrency,
  }) = _CurrenciesState;

  const CurrenciesState._();
}
