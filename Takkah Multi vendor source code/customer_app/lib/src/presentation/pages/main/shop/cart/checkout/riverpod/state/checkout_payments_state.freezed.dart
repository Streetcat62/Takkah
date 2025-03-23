// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_payments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckoutPaymentsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  List<PaymentData> get payments => throw _privateConstructorUsedError;
  int get selectedPaymentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutPaymentsStateCopyWith<CheckoutPaymentsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutPaymentsStateCopyWith<$Res> {
  factory $CheckoutPaymentsStateCopyWith(CheckoutPaymentsState value,
          $Res Function(CheckoutPaymentsState) then) =
      _$CheckoutPaymentsStateCopyWithImpl<$Res, CheckoutPaymentsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isValid,
      List<PaymentData> payments,
      int selectedPaymentIndex});
}

/// @nodoc
class _$CheckoutPaymentsStateCopyWithImpl<$Res,
        $Val extends CheckoutPaymentsState>
    implements $CheckoutPaymentsStateCopyWith<$Res> {
  _$CheckoutPaymentsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isValid = null,
    Object? payments = null,
    Object? selectedPaymentIndex = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      payments: null == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>,
      selectedPaymentIndex: null == selectedPaymentIndex
          ? _value.selectedPaymentIndex
          : selectedPaymentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheckoutPaymentsStateCopyWith<$Res>
    implements $CheckoutPaymentsStateCopyWith<$Res> {
  factory _$$_CheckoutPaymentsStateCopyWith(_$_CheckoutPaymentsState value,
          $Res Function(_$_CheckoutPaymentsState) then) =
      __$$_CheckoutPaymentsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isValid,
      List<PaymentData> payments,
      int selectedPaymentIndex});
}

/// @nodoc
class __$$_CheckoutPaymentsStateCopyWithImpl<$Res>
    extends _$CheckoutPaymentsStateCopyWithImpl<$Res, _$_CheckoutPaymentsState>
    implements _$$_CheckoutPaymentsStateCopyWith<$Res> {
  __$$_CheckoutPaymentsStateCopyWithImpl(_$_CheckoutPaymentsState _value,
      $Res Function(_$_CheckoutPaymentsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isValid = null,
    Object? payments = null,
    Object? selectedPaymentIndex = null,
  }) {
    return _then(_$_CheckoutPaymentsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      payments: null == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>,
      selectedPaymentIndex: null == selectedPaymentIndex
          ? _value.selectedPaymentIndex
          : selectedPaymentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CheckoutPaymentsState extends _CheckoutPaymentsState {
  const _$_CheckoutPaymentsState(
      {this.isLoading = false,
      this.isValid = false,
      final List<PaymentData> payments = const [],
      this.selectedPaymentIndex = 0})
      : _payments = payments,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isValid;
  final List<PaymentData> _payments;
  @override
  @JsonKey()
  List<PaymentData> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  @override
  @JsonKey()
  final int selectedPaymentIndex;

  @override
  String toString() {
    return 'CheckoutPaymentsState(isLoading: $isLoading, isValid: $isValid, payments: $payments, selectedPaymentIndex: $selectedPaymentIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckoutPaymentsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            (identical(other.selectedPaymentIndex, selectedPaymentIndex) ||
                other.selectedPaymentIndex == selectedPaymentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isValid,
      const DeepCollectionEquality().hash(_payments), selectedPaymentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckoutPaymentsStateCopyWith<_$_CheckoutPaymentsState> get copyWith =>
      __$$_CheckoutPaymentsStateCopyWithImpl<_$_CheckoutPaymentsState>(
          this, _$identity);
}

abstract class _CheckoutPaymentsState extends CheckoutPaymentsState {
  const factory _CheckoutPaymentsState(
      {final bool isLoading,
      final bool isValid,
      final List<PaymentData> payments,
      final int selectedPaymentIndex}) = _$_CheckoutPaymentsState;
  const _CheckoutPaymentsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isValid;
  @override
  List<PaymentData> get payments;
  @override
  int get selectedPaymentIndex;
  @override
  @JsonKey(ignore: true)
  _$$_CheckoutPaymentsStateCopyWith<_$_CheckoutPaymentsState> get copyWith =>
      throw _privateConstructorUsedError;
}
