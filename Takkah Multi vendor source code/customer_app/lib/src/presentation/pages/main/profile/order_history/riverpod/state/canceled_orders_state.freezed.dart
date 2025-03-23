// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'canceled_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CanceledOrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<OrderData> get canceledOrders => throw _privateConstructorUsedError;
  int get totalCanceledOrders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CanceledOrdersStateCopyWith<CanceledOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CanceledOrdersStateCopyWith<$Res> {
  factory $CanceledOrdersStateCopyWith(
          CanceledOrdersState value, $Res Function(CanceledOrdersState) then) =
      _$CanceledOrdersStateCopyWithImpl<$Res, CanceledOrdersState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<OrderData> canceledOrders,
      int totalCanceledOrders});
}

/// @nodoc
class _$CanceledOrdersStateCopyWithImpl<$Res, $Val extends CanceledOrdersState>
    implements $CanceledOrdersStateCopyWith<$Res> {
  _$CanceledOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? canceledOrders = null,
    Object? totalCanceledOrders = null,
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
      canceledOrders: null == canceledOrders
          ? _value.canceledOrders
          : canceledOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalCanceledOrders: null == totalCanceledOrders
          ? _value.totalCanceledOrders
          : totalCanceledOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CanceledOrdersStateCopyWith<$Res>
    implements $CanceledOrdersStateCopyWith<$Res> {
  factory _$$_CanceledOrdersStateCopyWith(_$_CanceledOrdersState value,
          $Res Function(_$_CanceledOrdersState) then) =
      __$$_CanceledOrdersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<OrderData> canceledOrders,
      int totalCanceledOrders});
}

/// @nodoc
class __$$_CanceledOrdersStateCopyWithImpl<$Res>
    extends _$CanceledOrdersStateCopyWithImpl<$Res, _$_CanceledOrdersState>
    implements _$$_CanceledOrdersStateCopyWith<$Res> {
  __$$_CanceledOrdersStateCopyWithImpl(_$_CanceledOrdersState _value,
      $Res Function(_$_CanceledOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? canceledOrders = null,
    Object? totalCanceledOrders = null,
  }) {
    return _then(_$_CanceledOrdersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canceledOrders: null == canceledOrders
          ? _value._canceledOrders
          : canceledOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalCanceledOrders: null == totalCanceledOrders
          ? _value.totalCanceledOrders
          : totalCanceledOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CanceledOrdersState extends _CanceledOrdersState {
  const _$_CanceledOrdersState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<OrderData> canceledOrders = const [],
      this.totalCanceledOrders = 0})
      : _canceledOrders = canceledOrders,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<OrderData> _canceledOrders;
  @override
  @JsonKey()
  List<OrderData> get canceledOrders {
    if (_canceledOrders is EqualUnmodifiableListView) return _canceledOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_canceledOrders);
  }

  @override
  @JsonKey()
  final int totalCanceledOrders;

  @override
  String toString() {
    return 'CanceledOrdersState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, canceledOrders: $canceledOrders, totalCanceledOrders: $totalCanceledOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CanceledOrdersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            const DeepCollectionEquality()
                .equals(other._canceledOrders, _canceledOrders) &&
            (identical(other.totalCanceledOrders, totalCanceledOrders) ||
                other.totalCanceledOrders == totalCanceledOrders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isMoreLoading,
      const DeepCollectionEquality().hash(_canceledOrders),
      totalCanceledOrders);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CanceledOrdersStateCopyWith<_$_CanceledOrdersState> get copyWith =>
      __$$_CanceledOrdersStateCopyWithImpl<_$_CanceledOrdersState>(
          this, _$identity);
}

abstract class _CanceledOrdersState extends CanceledOrdersState {
  const factory _CanceledOrdersState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<OrderData> canceledOrders,
      final int totalCanceledOrders}) = _$_CanceledOrdersState;
  const _CanceledOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<OrderData> get canceledOrders;
  @override
  int get totalCanceledOrders;
  @override
  @JsonKey(ignore: true)
  _$$_CanceledOrdersStateCopyWith<_$_CanceledOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
