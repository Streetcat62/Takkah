import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_image_state.freezed.dart';

@freezed
class ProfileImageState with _$ProfileImageState {
  const factory ProfileImageState({
    String? imageUrl,
    String? path,
  }) = _ProfileImageState;

  const ProfileImageState._();
}
