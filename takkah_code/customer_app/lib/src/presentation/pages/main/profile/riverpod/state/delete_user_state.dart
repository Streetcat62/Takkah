import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_state.freezed.dart';

@freezed
class DeleteUserState with _$DeleteUserState {
  const factory DeleteUserState({@Default(false) bool isLoading}) =
      _DeleteUserState;

  const DeleteUserState._();
}
