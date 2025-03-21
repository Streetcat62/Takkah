// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currencies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrenciesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  List<CurrencyData> get currencies => throw _privateConstructorUsedError;
  CurrencyData? get selectedCurrency => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrenciesStateCopyWith<CurrenciesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrenciesStateCopyWith<$Res> {
  factory $CurrenciesStateCopyWith(
          CurrenciesState value, $Res Function(CurrenciesState) then) =
      _$CurrenciesStateCopyWithImpl<$Res, CurrenciesState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<CurrencyData> currencies,
      CurrencyData? selectedCurrency});
}

/// @nodoc
class _$CurrenciesStateCopyWithImpl<$Res, $Val extends CurrenciesState>
    implements $CurrenciesStateCopyWith<$Res> {
  _$CurrenciesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? currencies = null,
    Object? selectedCurrency = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyData>,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrenciesStateCopyWith<$Res>
    implements $CurrenciesStateCopyWith<$Res> {
  factory _$$_CurrenciesStateCopyWith(
          _$_CurrenciesState value, $Res Function(_$_CurrenciesState) then) =
      __$$_CurrenciesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<CurrencyData> currencies,
      CurrencyData? selectedCurrency});
}

/// @nodoc
class __$$_CurrenciesStateCopyWithImpl<$Res>
    extends _$CurrenciesStateCopyWithImpl<$Res, _$_CurrenciesState>
    implements _$$_CurrenciesStateCopyWith<$Res> {
  __$$_CurrenciesStateCopyWithImpl(
      _$_CurrenciesState _value, $Res Function(_$_CurrenciesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? currencies = null,
    Object? selectedCurrency = freezed,
  }) {
    return _then(_$_CurrenciesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      currencies: null == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyData>,
      selectedCurrency: freezed == selectedCurrency
          ? _value.selectedCurrency
          : selectedCurrency // ignore: cast_nullable_to_non_nullable
              as CurrencyData?,
    ));
  }
}

/// @nodoc

class _$_CurrenciesState extends _CurrenciesState {
  const _$_CurrenciesState(
      {this.isLoading = false,
      this.isSaving = false,
      final List<CurrencyData> currencies = const [],
      this.selectedCurrency})
      : _currencies = currencies,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  final List<CurrencyData> _currencies;
  @override
  @JsonKey()
  List<CurrencyData> get currencies {
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  @override
  final CurrencyData? selectedCurrency;

  @override
  String toString() {
    return 'CurrenciesState(isLoading: $isLoading, isSaving: $isSaving, currencies: $currencies, selectedCurrency: $selectedCurrency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrenciesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            (identical(other.selectedCurrency, selectedCurrency) ||
                other.selectedCurrency == selectedCurrency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSaving,
      const DeepCollectionEquality().hash(_currencies), selectedCurrency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrenciesStateCopyWith<_$_CurrenciesState> get copyWith =>
      __$$_CurrenciesStateCopyWithImpl<_$_CurrenciesState>(this, _$identity);
}

abstract class _CurrenciesState extends CurrenciesState {
  const factory _CurrenciesState(
      {final bool isLoading,
      final bool isSaving,
      final List<CurrencyData> currencies,
      final CurrencyData? selectedCurrency}) = _$_CurrenciesState;
  const _CurrenciesState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  List<CurrencyData> get currencies;
  @override
  CurrencyData? get selectedCurrency;
  @override
  @JsonKey(ignore: true)
  _$$_CurrenciesStateCopyWith<_$_CurrenciesState> get copyWith =>
      throw _privateConstructorUsedError;
}
