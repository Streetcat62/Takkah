import 'package:charts_flutter_new/flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../infrastructure/models/models.dart';

part 'statistics_state.freezed.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    @Default(false) bool isLoading,
    @Default(true) bool isRefresh,
    @Default([]) List<Series<OrdinalSales, String>> list,
    @Default([]) List<StatisticsOrder> listOfOrder,
    StatisticsIncomeResponse? countData,
  }) = _StatisticsState;

  const StatisticsState._();
}
