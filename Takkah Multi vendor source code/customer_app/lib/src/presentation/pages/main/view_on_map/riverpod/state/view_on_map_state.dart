import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_on_map_state.freezed.dart';

@freezed
class ViewOnMapState with _$ViewOnMapState {
  const factory ViewOnMapState({@Default(false) bool isChoosing}) =
      _ViewOnMapState;

  const ViewOnMapState._();
}
