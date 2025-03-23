import 'package:freezed_annotation/freezed_annotation.dart';

import '../../infrastructure/models/models.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({LanguageData? activeLanguage}) = _AppState;

  const AppState._();
}
