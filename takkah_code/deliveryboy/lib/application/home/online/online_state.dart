import 'package:freezed_annotation/freezed_annotation.dart';

part 'online_state.freezed.dart';

@freezed
class OnlineState with _$OnlineState {
  const factory OnlineState({@Default(false) bool isLoading}) = _OnlineState;

  const OnlineState._();
}
