// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'on_a_way_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnAWayOrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<OrderData> get onAWayOrders => throw _privateConstructorUsedError;
  int get totalOnAWayOrders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnAWayOrdersStateCopyWith<OnAWayOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnAWayOrdersStateCopyWith<$Res> {
  factory $OnAWayOrdersStateCopyWith(
          OnAWayOrdersState value, $Res Function(OnAWayOrdersState) then) =
      _$OnAWayOrdersStateCopyWithImpl<$Res, OnAWayOrdersState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<OrderData> onAWayOrders,
      int totalOnAWayOrders});
}

/// @nodoc
class _$OnAWayOrdersStateCopyWithImpl<$Res, $Val extends OnAWayOrdersState>
    implements $OnAWayOrdersStateCopyWith<$Res> {
  _$OnAWayOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? onAWayOrders = null,
    Object? totalOnAWayOrders = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      onAWayOrders: null == onAWayOrders
          ? _value.onAWayOrders
          : onAWayOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalOnAWayOrders: null == totalOnAWayOrders
          ? _value.totalOnAWayOrders
          : totalOnAWayOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OnAWayOrdersStateCopyWith<$Res>
    implements $OnAWayOrdersStateCopyWith<$Res> {
  factory _$$_OnAWayOrdersStateCopyWith(_$_OnAWayOrdersState value,
          $Res Function(_$_OnAWayOrdersState) then) =
      __$$_OnAWayOrdersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<OrderData> onAWayOrders,
      int totalOnAWayOrders});
}

/// @nodoc
class __$$_OnAWayOrdersStateCopyWithImpl<$Res>
    extends _$OnAWayOrdersStateCopyWithImpl<$Res, _$_OnAWayOrdersState>
    implements _$$_OnAWayOrdersStateCopyWith<$Res> {
  __$$_OnAWayOrdersStateCopyWithImpl(
      _$_OnAWayOrdersState _value, $Res Function(_$_OnAWayOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? onAWayOrders = null,
    Object? totalOnAWayOrders = null,
  }) {
    return _then(_$_OnAWayOrdersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      onAWayOrders: null == onAWayOrders
          ? _value._onAWayOrders
          : onAWayOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalOnAWayOrders: null == totalOnAWayOrders
          ? _value.totalOnAWayOrders
          : totalOnAWayOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OnAWayOrdersState extends _OnAWayOrdersState {
  const _$_OnAWayOrdersState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<OrderData> onAWayOrders = const [],
      this.totalOnAWayOrders = 0})
      : _onAWayOrders = onAWayOrders,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<OrderData> _onAWayOrders;
  @override
  @JsonKey()
  List<OrderData> get onAWayOrders {
    if (_onAWayOrders is EqualUnmodifiableListView) return _onAWayOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onAWayOrders);
  }

  @override
  @JsonKey()
  final int totalOnAWayOrders;

  @override
  String toString() {
    return 'OnAWayOrdersState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, onAWayOrders: $onAWayOrders, totalOnAWayOrders: $totalOnAWayOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnAWayOrdersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            const DeepCollectionEquality()
                .equals(other._onAWayOrders, _onAWayOrders) &&
            (identical(other.totalOnAWayOrders, totalOnAWayOrders) ||
                other.totalOnAWayOrders == totalOnAWayOrders));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      const DeepCollectionEquality().hash(_onAWayOrders), totalOnAWayOrders);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnAWayOrdersStateCopyWith<_$_OnAWayOrdersState> get copyWith =>
      __$$_OnAWayOrdersStateCopyWithImpl<_$_OnAWayOrdersState>(
          this, _$identity);
}

abstract class _OnAWayOrdersState extends OnAWayOrdersState {
  const factory _OnAWayOrdersState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<OrderData> onAWayOrders,
      final int totalOnAWayOrders}) = _$_OnAWayOrdersState;
  const _OnAWayOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<OrderData> get onAWayOrders;
  @override
  int get totalOnAWayOrders;
  @override
  @JsonKey(ignore: true)
  _$$_OnAWayOrdersStateCopyWith<_$_OnAWayOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
