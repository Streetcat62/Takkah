// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_histories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletHistoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<WalletData> get wallets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletHistoriesStateCopyWith<WalletHistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletHistoriesStateCopyWith<$Res> {
  factory $WalletHistoriesStateCopyWith(WalletHistoriesState value,
          $Res Function(WalletHistoriesState) then) =
      _$WalletHistoriesStateCopyWithImpl<$Res, WalletHistoriesState>;
  @useResult
  $Res call({bool isLoading, List<WalletData> wallets});
}

/// @nodoc
class _$WalletHistoriesStateCopyWithImpl<$Res,
        $Val extends WalletHistoriesState>
    implements $WalletHistoriesStateCopyWith<$Res> {
  _$WalletHistoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? wallets = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      wallets: null == wallets
          ? _value.wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<WalletData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletHistoriesStateCopyWith<$Res>
    implements $WalletHistoriesStateCopyWith<$Res> {
  factory _$$_WalletHistoriesStateCopyWith(_$_WalletHistoriesState value,
          $Res Function(_$_WalletHistoriesState) then) =
      __$$_WalletHistoriesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<WalletData> wallets});
}

/// @nodoc
class __$$_WalletHistoriesStateCopyWithImpl<$Res>
    extends _$WalletHistoriesStateCopyWithImpl<$Res, _$_WalletHistoriesState>
    implements _$$_WalletHistoriesStateCopyWith<$Res> {
  __$$_WalletHistoriesStateCopyWithImpl(_$_WalletHistoriesState _value,
      $Res Function(_$_WalletHistoriesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? wallets = null,
  }) {
    return _then(_$_WalletHistoriesState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      wallets: null == wallets
          ? _value._wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<WalletData>,
    ));
  }
}

/// @nodoc

class _$_WalletHistoriesState extends _WalletHistoriesState {
  const _$_WalletHistoriesState(
      {this.isLoading = false, final List<WalletData> wallets = const []})
      : _wallets = wallets,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<WalletData> _wallets;
  @override
  @JsonKey()
  List<WalletData> get wallets {
    if (_wallets is EqualUnmodifiableListView) return _wallets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallets);
  }

  @override
  String toString() {
    return 'WalletHistoriesState(isLoading: $isLoading, wallets: $wallets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletHistoriesState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._wallets, _wallets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_wallets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletHistoriesStateCopyWith<_$_WalletHistoriesState> get copyWith =>
      __$$_WalletHistoriesStateCopyWithImpl<_$_WalletHistoriesState>(
          this, _$identity);
}

abstract class _WalletHistoriesState extends WalletHistoriesState {
  const factory _WalletHistoriesState(
      {final bool isLoading,
      final List<WalletData> wallets}) = _$_WalletHistoriesState;
  const _WalletHistoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  List<WalletData> get wallets;
  @override
  @JsonKey(ignore: true)
  _$$_WalletHistoriesStateCopyWith<_$_WalletHistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
