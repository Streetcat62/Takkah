// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_markers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopMarkersState {
  Map<MarkerId, Marker> get markers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopMarkersStateCopyWith<ShopMarkersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopMarkersStateCopyWith<$Res> {
  factory $ShopMarkersStateCopyWith(
          ShopMarkersState value, $Res Function(ShopMarkersState) then) =
      _$ShopMarkersStateCopyWithImpl<$Res, ShopMarkersState>;
  @useResult
  $Res call({Map<MarkerId, Marker> markers});
}

/// @nodoc
class _$ShopMarkersStateCopyWithImpl<$Res, $Val extends ShopMarkersState>
    implements $ShopMarkersStateCopyWith<$Res> {
  _$ShopMarkersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
  }) {
    return _then(_value.copyWith(
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopMarkersStateCopyWith<$Res>
    implements $ShopMarkersStateCopyWith<$Res> {
  factory _$$_ShopMarkersStateCopyWith(
          _$_ShopMarkersState value, $Res Function(_$_ShopMarkersState) then) =
      __$$_ShopMarkersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<MarkerId, Marker> markers});
}

/// @nodoc
class __$$_ShopMarkersStateCopyWithImpl<$Res>
    extends _$ShopMarkersStateCopyWithImpl<$Res, _$_ShopMarkersState>
    implements _$$_ShopMarkersStateCopyWith<$Res> {
  __$$_ShopMarkersStateCopyWithImpl(
      _$_ShopMarkersState _value, $Res Function(_$_ShopMarkersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
  }) {
    return _then(_$_ShopMarkersState(
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
    ));
  }
}

/// @nodoc

class _$_ShopMarkersState extends _ShopMarkersState {
  const _$_ShopMarkersState({final Map<MarkerId, Marker> markers = const {}})
      : _markers = markers,
        super._();

  final Map<MarkerId, Marker> _markers;
  @override
  @JsonKey()
  Map<MarkerId, Marker> get markers {
    if (_markers is EqualUnmodifiableMapView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_markers);
  }

  @override
  String toString() {
    return 'ShopMarkersState(markers: $markers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopMarkersState &&
            const DeepCollectionEquality().equals(other._markers, _markers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_markers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopMarkersStateCopyWith<_$_ShopMarkersState> get copyWith =>
      __$$_ShopMarkersStateCopyWithImpl<_$_ShopMarkersState>(this, _$identity);
}

abstract class _ShopMarkersState extends ShopMarkersState {
  const factory _ShopMarkersState({final Map<MarkerId, Marker> markers}) =
      _$_ShopMarkersState;
  const _ShopMarkersState._() : super._();

  @override
  Map<MarkerId, Marker> get markers;
  @override
  @JsonKey(ignore: true)
  _$$_ShopMarkersStateCopyWith<_$_ShopMarkersState> get copyWith =>
      throw _privateConstructorUsedError;
}
