// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderPaymentState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCalculateLoading => throw _privateConstructorUsedError;
  List<Payment> get payments => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  OrderCalculateDetail? get orderCalculate =>
      throw _privateConstructorUsedError;
  DeliveryFee? get deliveryfee => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderPaymentStateCopyWith<OrderPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderPaymentStateCopyWith<$Res> {
  factory $OrderPaymentStateCopyWith(
          OrderPaymentState value, $Res Function(OrderPaymentState) then) =
      _$OrderPaymentStateCopyWithImpl<$Res, OrderPaymentState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isCalculateLoading,
      List<Payment> payments,
      int selectedIndex,
      OrderCalculateDetail? orderCalculate,
      DeliveryFee? deliveryfee});
}

/// @nodoc
class _$OrderPaymentStateCopyWithImpl<$Res, $Val extends OrderPaymentState>
    implements $OrderPaymentStateCopyWith<$Res> {
  _$OrderPaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isCalculateLoading = null,
    Object? payments = null,
    Object? selectedIndex = null,
    Object? orderCalculate = freezed,
    Object? deliveryfee = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCalculateLoading: null == isCalculateLoading
          ? _value.isCalculateLoading
          : isCalculateLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      payments: null == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<Payment>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      orderCalculate: freezed == orderCalculate
          ? _value.orderCalculate
          : orderCalculate // ignore: cast_nullable_to_non_nullable
              as OrderCalculateDetail?,
      deliveryfee: freezed == deliveryfee
          ? _value.deliveryfee
          : deliveryfee // ignore: cast_nullable_to_non_nullable
              as DeliveryFee?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderPaymentStateCopyWith<$Res>
    implements $OrderPaymentStateCopyWith<$Res> {
  factory _$$_OrderPaymentStateCopyWith(_$_OrderPaymentState value,
          $Res Function(_$_OrderPaymentState) then) =
      __$$_OrderPaymentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isCalculateLoading,
      List<Payment> payments,
      int selectedIndex,
      OrderCalculateDetail? orderCalculate,
      DeliveryFee? deliveryfee});
}

/// @nodoc
class __$$_OrderPaymentStateCopyWithImpl<$Res>
    extends _$OrderPaymentStateCopyWithImpl<$Res, _$_OrderPaymentState>
    implements _$$_OrderPaymentStateCopyWith<$Res> {
  __$$_OrderPaymentStateCopyWithImpl(
      _$_OrderPaymentState _value, $Res Function(_$_OrderPaymentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isCalculateLoading = null,
    Object? payments = null,
    Object? selectedIndex = null,
    Object? orderCalculate = freezed,
    Object? deliveryfee = freezed,
  }) {
    return _then(_$_OrderPaymentState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCalculateLoading: null == isCalculateLoading
          ? _value.isCalculateLoading
          : isCalculateLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      payments: null == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<Payment>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      orderCalculate: freezed == orderCalculate
          ? _value.orderCalculate
          : orderCalculate // ignore: cast_nullable_to_non_nullable
              as OrderCalculateDetail?,
      deliveryfee: freezed == deliveryfee
          ? _value.deliveryfee
          : deliveryfee // ignore: cast_nullable_to_non_nullable
              as DeliveryFee?,
    ));
  }
}

/// @nodoc

class _$_OrderPaymentState extends _OrderPaymentState {
  const _$_OrderPaymentState(
      {this.isLoading = false,
      this.isCalculateLoading = false,
      final List<Payment> payments = const [],
      this.selectedIndex = 0,
      this.orderCalculate,
      this.deliveryfee})
      : _payments = payments,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCalculateLoading;
  final List<Payment> _payments;
  @override
  @JsonKey()
  List<Payment> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  final OrderCalculateDetail? orderCalculate;
  @override
  final DeliveryFee? deliveryfee;

  @override
  String toString() {
    return 'OrderPaymentState(isLoading: $isLoading, isCalculateLoading: $isCalculateLoading, payments: $payments, selectedIndex: $selectedIndex, orderCalculate: $orderCalculate, deliveryfee: $deliveryfee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderPaymentState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCalculateLoading, isCalculateLoading) ||
                other.isCalculateLoading == isCalculateLoading) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.orderCalculate, orderCalculate) ||
                other.orderCalculate == orderCalculate) &&
            (identical(other.deliveryfee, deliveryfee) ||
                other.deliveryfee == deliveryfee));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isCalculateLoading,
      const DeepCollectionEquality().hash(_payments),
      selectedIndex,
      orderCalculate,
      deliveryfee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderPaymentStateCopyWith<_$_OrderPaymentState> get copyWith =>
      __$$_OrderPaymentStateCopyWithImpl<_$_OrderPaymentState>(
          this, _$identity);
}

abstract class _OrderPaymentState extends OrderPaymentState {
  const factory _OrderPaymentState(
      {final bool isLoading,
      final bool isCalculateLoading,
      final List<Payment> payments,
      final int selectedIndex,
      final OrderCalculateDetail? orderCalculate,
      final DeliveryFee? deliveryfee}) = _$_OrderPaymentState;
  const _OrderPaymentState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isCalculateLoading;
  @override
  List<Payment> get payments;
  @override
  int get selectedIndex;
  @override
  OrderCalculateDetail? get orderCalculate;
  @override
  DeliveryFee? get deliveryfee;
  @override
  @JsonKey(ignore: true)
  _$$_OrderPaymentStateCopyWith<_$_OrderPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}
