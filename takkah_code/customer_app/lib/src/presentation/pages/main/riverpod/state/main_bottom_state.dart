import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_bottom_state.freezed.dart';

@freezed
class MainBottomState with _$MainBottomState {
  const factory MainBottomState({@Default(true) bool isVisible}) =
      _MainBottomState;

  const MainBottomState._();
}
