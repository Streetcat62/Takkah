// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accepted_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AcceptedOrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<OrderData> get orders => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AcceptedOrdersStateCopyWith<AcceptedOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcceptedOrdersStateCopyWith<$Res> {
  factory $AcceptedOrdersStateCopyWith(
          AcceptedOrdersState value, $Res Function(AcceptedOrdersState) then) =
      _$AcceptedOrdersStateCopyWithImpl<$Res, AcceptedOrdersState>;
  @useResult
  $Res call({bool isLoading, List<OrderData> orders, int totalCount});
}

/// @nodoc
class _$AcceptedOrdersStateCopyWithImpl<$Res, $Val extends AcceptedOrdersState>
    implements $AcceptedOrdersStateCopyWith<$Res> {
  _$AcceptedOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orders = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AcceptedOrdersStateCopyWith<$Res>
    implements $AcceptedOrdersStateCopyWith<$Res> {
  factory _$$_AcceptedOrdersStateCopyWith(_$_AcceptedOrdersState value,
          $Res Function(_$_AcceptedOrdersState) then) =
      __$$_AcceptedOrdersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<OrderData> orders, int totalCount});
}

/// @nodoc
class __$$_AcceptedOrdersStateCopyWithImpl<$Res>
    extends _$AcceptedOrdersStateCopyWithImpl<$Res, _$_AcceptedOrdersState>
    implements _$$_AcceptedOrdersStateCopyWith<$Res> {
  __$$_AcceptedOrdersStateCopyWithImpl(_$_AcceptedOrdersState _value,
      $Res Function(_$_AcceptedOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orders = null,
    Object? totalCount = null,
  }) {
    return _then(_$_AcceptedOrdersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AcceptedOrdersState extends _AcceptedOrdersState {
  const _$_AcceptedOrdersState(
      {this.isLoading = false,
      final List<OrderData> orders = const [],
      this.totalCount = 0})
      : _orders = orders,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<OrderData> _orders;
  @override
  @JsonKey()
  List<OrderData> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  @JsonKey()
  final int totalCount;

  @override
  String toString() {
    return 'AcceptedOrdersState(isLoading: $isLoading, orders: $orders, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AcceptedOrdersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_orders), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AcceptedOrdersStateCopyWith<_$_AcceptedOrdersState> get copyWith =>
      __$$_AcceptedOrdersStateCopyWithImpl<_$_AcceptedOrdersState>(
          this, _$identity);
}

abstract class _AcceptedOrdersState extends AcceptedOrdersState {
  const factory _AcceptedOrdersState(
      {final bool isLoading,
      final List<OrderData> orders,
      final int totalCount}) = _$_AcceptedOrdersState;
  const _AcceptedOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  List<OrderData> get orders;
  @override
  int get totalCount;
  @override
  @JsonKey(ignore: true)
  _$$_AcceptedOrdersStateCopyWith<_$_AcceptedOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
