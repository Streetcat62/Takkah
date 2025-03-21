// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewOrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<OrderData> get orders => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  RefreshController? get refreshController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewOrdersStateCopyWith<NewOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewOrdersStateCopyWith<$Res> {
  factory $NewOrdersStateCopyWith(
          NewOrdersState value, $Res Function(NewOrdersState) then) =
      _$NewOrdersStateCopyWithImpl<$Res, NewOrdersState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<OrderData> orders,
      int totalCount,
      RefreshController? refreshController});
}

/// @nodoc
class _$NewOrdersStateCopyWithImpl<$Res, $Val extends NewOrdersState>
    implements $NewOrdersStateCopyWith<$Res> {
  _$NewOrdersStateCopyWithImpl(this._value, this._then);

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
    Object? refreshController = freezed,
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
      refreshController: freezed == refreshController
          ? _value.refreshController
          : refreshController // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewOrdersStateCopyWith<$Res>
    implements $NewOrdersStateCopyWith<$Res> {
  factory _$$_NewOrdersStateCopyWith(
          _$_NewOrdersState value, $Res Function(_$_NewOrdersState) then) =
      __$$_NewOrdersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<OrderData> orders,
      int totalCount,
      RefreshController? refreshController});
}

/// @nodoc
class __$$_NewOrdersStateCopyWithImpl<$Res>
    extends _$NewOrdersStateCopyWithImpl<$Res, _$_NewOrdersState>
    implements _$$_NewOrdersStateCopyWith<$Res> {
  __$$_NewOrdersStateCopyWithImpl(
      _$_NewOrdersState _value, $Res Function(_$_NewOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? orders = null,
    Object? totalCount = null,
    Object? refreshController = freezed,
  }) {
    return _then(_$_NewOrdersState(
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
      refreshController: freezed == refreshController
          ? _value.refreshController
          : refreshController // ignore: cast_nullable_to_non_nullable
              as RefreshController?,
    ));
  }
}

/// @nodoc

class _$_NewOrdersState extends _NewOrdersState {
  const _$_NewOrdersState(
      {this.isLoading = false,
      final List<OrderData> orders = const [],
      this.totalCount = 0,
      this.refreshController})
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
  final RefreshController? refreshController;

  @override
  String toString() {
    return 'NewOrdersState(isLoading: $isLoading, orders: $orders, totalCount: $totalCount, refreshController: $refreshController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewOrdersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.refreshController, refreshController) ||
                other.refreshController == refreshController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_orders),
      totalCount,
      refreshController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewOrdersStateCopyWith<_$_NewOrdersState> get copyWith =>
      __$$_NewOrdersStateCopyWithImpl<_$_NewOrdersState>(this, _$identity);
}

abstract class _NewOrdersState extends NewOrdersState {
  const factory _NewOrdersState(
      {final bool isLoading,
      final List<OrderData> orders,
      final int totalCount,
      final RefreshController? refreshController}) = _$_NewOrdersState;
  const _NewOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  List<OrderData> get orders;
  @override
  int get totalCount;
  @override
  RefreshController? get refreshController;
  @override
  @JsonKey(ignore: true)
  _$$_NewOrdersStateCopyWith<_$_NewOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
