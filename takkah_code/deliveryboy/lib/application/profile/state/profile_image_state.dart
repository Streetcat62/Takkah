import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_image_state.freezed.dart';

@freezed
class ProfileImageState with _$ProfileImageState {
  const factory ProfileImageState({
    @Default('') String carImagePath,
    String? imageUrl,
    String? path,
    String? carImageUrl,
  }) = _ProfileImageState;

  const ProfileImageState._();
}
