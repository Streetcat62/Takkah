// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodayOrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<OrderData> get todayOrders => throw _privateConstructorUsedError;
  OrdersStatistic? get ordersStatistic => throw _privateConstructorUsedError;
  OrderData? get lastOrder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodayOrdersStateCopyWith<TodayOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayOrdersStateCopyWith<$Res> {
  factory $TodayOrdersStateCopyWith(
          TodayOrdersState value, $Res Function(TodayOrdersState) then) =
      _$TodayOrdersStateCopyWithImpl<$Res, TodayOrdersState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<OrderData> todayOrders,
      OrdersStatistic? ordersStatistic,
      OrderData? lastOrder});
}

/// @nodoc
class _$TodayOrdersStateCopyWithImpl<$Res, $Val extends TodayOrdersState>
    implements $TodayOrdersStateCopyWith<$Res> {
  _$TodayOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? todayOrders = null,
    Object? ordersStatistic = freezed,
    Object? lastOrder = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todayOrders: null == todayOrders
          ? _value.todayOrders
          : todayOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      ordersStatistic: freezed == ordersStatistic
          ? _value.ordersStatistic
          : ordersStatistic // ignore: cast_nullable_to_non_nullable
              as OrdersStatistic?,
      lastOrder: freezed == lastOrder
          ? _value.lastOrder
          : lastOrder // ignore: cast_nullable_to_non_nullable
              as OrderData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodayOrdersStateCopyWith<$Res>
    implements $TodayOrdersStateCopyWith<$Res> {
  factory _$$_TodayOrdersStateCopyWith(
          _$_TodayOrdersState value, $Res Function(_$_TodayOrdersState) then) =
      __$$_TodayOrdersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<OrderData> todayOrders,
      OrdersStatistic? ordersStatistic,
      OrderData? lastOrder});
}

/// @nodoc
class __$$_TodayOrdersStateCopyWithImpl<$Res>
    extends _$TodayOrdersStateCopyWithImpl<$Res, _$_TodayOrdersState>
    implements _$$_TodayOrdersStateCopyWith<$Res> {
  __$$_TodayOrdersStateCopyWithImpl(
      _$_TodayOrdersState _value, $Res Function(_$_TodayOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? todayOrders = null,
    Object? ordersStatistic = freezed,
    Object? lastOrder = freezed,
  }) {
    return _then(_$_TodayOrdersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todayOrders: null == todayOrders
          ? _value._todayOrders
          : todayOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      ordersStatistic: freezed == ordersStatistic
          ? _value.ordersStatistic
          : ordersStatistic // ignore: cast_nullable_to_non_nullable
              as OrdersStatistic?,
      lastOrder: freezed == lastOrder
          ? _value.lastOrder
          : lastOrder // ignore: cast_nullable_to_non_nullable
              as OrderData?,
    ));
  }
}

/// @nodoc

class _$_TodayOrdersState extends _TodayOrdersState {
  const _$_TodayOrdersState(
      {this.isLoading = false,
      final List<OrderData> todayOrders = const [],
      this.ordersStatistic,
      this.lastOrder})
      : _todayOrders = todayOrders,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<OrderData> _todayOrders;
  @override
  @JsonKey()
  List<OrderData> get todayOrders {
    if (_todayOrders is EqualUnmodifiableListView) return _todayOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayOrders);
  }

  @override
  final OrdersStatistic? ordersStatistic;
  @override
  final OrderData? lastOrder;

  @override
  String toString() {
    return 'TodayOrdersState(isLoading: $isLoading, todayOrders: $todayOrders, ordersStatistic: $ordersStatistic, lastOrder: $lastOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodayOrdersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._todayOrders, _todayOrders) &&
            (identical(other.ordersStatistic, ordersStatistic) ||
                other.ordersStatistic == ordersStatistic) &&
            (identical(other.lastOrder, lastOrder) ||
                other.lastOrder == lastOrder));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_todayOrders),
      ordersStatistic,
      lastOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodayOrdersStateCopyWith<_$_TodayOrdersState> get copyWith =>
      __$$_TodayOrdersStateCopyWithImpl<_$_TodayOrdersState>(this, _$identity);
}

abstract class _TodayOrdersState extends TodayOrdersState {
  const factory _TodayOrdersState(
      {final bool isLoading,
      final List<OrderData> todayOrders,
      final OrdersStatistic? ordersStatistic,
      final OrderData? lastOrder}) = _$_TodayOrdersState;
  const _TodayOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  List<OrderData> get todayOrders;
  @override
  OrdersStatistic? get ordersStatistic;
  @override
  OrderData? get lastOrder;
  @override
  @JsonKey(ignore: true)
  _$$_TodayOrdersStateCopyWith<_$_TodayOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
