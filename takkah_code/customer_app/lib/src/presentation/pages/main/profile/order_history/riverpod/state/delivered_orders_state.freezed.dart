// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivered_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeliveredOrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<OrderData> get deliveredOrders => throw _privateConstructorUsedError;
  int get totalDeliveredOrders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliveredOrdersStateCopyWith<DeliveredOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveredOrdersStateCopyWith<$Res> {
  factory $DeliveredOrdersStateCopyWith(DeliveredOrdersState value,
          $Res Function(DeliveredOrdersState) then) =
      _$DeliveredOrdersStateCopyWithImpl<$Res, DeliveredOrdersState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<OrderData> deliveredOrders,
      int totalDeliveredOrders});
}

/// @nodoc
class _$DeliveredOrdersStateCopyWithImpl<$Res,
        $Val extends DeliveredOrdersState>
    implements $DeliveredOrdersStateCopyWith<$Res> {
  _$DeliveredOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? deliveredOrders = null,
    Object? totalDeliveredOrders = null,
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
      deliveredOrders: null == deliveredOrders
          ? _value.deliveredOrders
          : deliveredOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalDeliveredOrders: null == totalDeliveredOrders
          ? _value.totalDeliveredOrders
          : totalDeliveredOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveredOrdersStateCopyWith<$Res>
    implements $DeliveredOrdersStateCopyWith<$Res> {
  factory _$$_DeliveredOrdersStateCopyWith(_$_DeliveredOrdersState value,
          $Res Function(_$_DeliveredOrdersState) then) =
      __$$_DeliveredOrdersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<OrderData> deliveredOrders,
      int totalDeliveredOrders});
}

/// @nodoc
class __$$_DeliveredOrdersStateCopyWithImpl<$Res>
    extends _$DeliveredOrdersStateCopyWithImpl<$Res, _$_DeliveredOrdersState>
    implements _$$_DeliveredOrdersStateCopyWith<$Res> {
  __$$_DeliveredOrdersStateCopyWithImpl(_$_DeliveredOrdersState _value,
      $Res Function(_$_DeliveredOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? deliveredOrders = null,
    Object? totalDeliveredOrders = null,
  }) {
    return _then(_$_DeliveredOrdersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveredOrders: null == deliveredOrders
          ? _value._deliveredOrders
          : deliveredOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalDeliveredOrders: null == totalDeliveredOrders
          ? _value.totalDeliveredOrders
          : totalDeliveredOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DeliveredOrdersState extends _DeliveredOrdersState {
  const _$_DeliveredOrdersState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<OrderData> deliveredOrders = const [],
      this.totalDeliveredOrders = 0})
      : _deliveredOrders = deliveredOrders,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<OrderData> _deliveredOrders;
  @override
  @JsonKey()
  List<OrderData> get deliveredOrders {
    if (_deliveredOrders is EqualUnmodifiableListView) return _deliveredOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveredOrders);
  }

  @override
  @JsonKey()
  final int totalDeliveredOrders;

  @override
  String toString() {
    return 'DeliveredOrdersState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, deliveredOrders: $deliveredOrders, totalDeliveredOrders: $totalDeliveredOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveredOrdersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            const DeepCollectionEquality()
                .equals(other._deliveredOrders, _deliveredOrders) &&
            (identical(other.totalDeliveredOrders, totalDeliveredOrders) ||
                other.totalDeliveredOrders == totalDeliveredOrders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isMoreLoading,
      const DeepCollectionEquality().hash(_deliveredOrders),
      totalDeliveredOrders);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveredOrdersStateCopyWith<_$_DeliveredOrdersState> get copyWith =>
      __$$_DeliveredOrdersStateCopyWithImpl<_$_DeliveredOrdersState>(
          this, _$identity);
}

abstract class _DeliveredOrdersState extends DeliveredOrdersState {
  const factory _DeliveredOrdersState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<OrderData> deliveredOrders,
      final int totalDeliveredOrders}) = _$_DeliveredOrdersState;
  const _DeliveredOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<OrderData> get deliveredOrders;
  @override
  int get totalDeliveredOrders;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveredOrdersStateCopyWith<_$_DeliveredOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
