import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isSearching,
    @Default('') String query,
  }) = _MainState;

  const MainState._();
}
