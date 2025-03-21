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
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<OrderData> get newOrders => throw _privateConstructorUsedError;
  int get totalNewOrders => throw _privateConstructorUsedError;

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
      bool isMoreLoading,
      List<OrderData> newOrders,
      int totalNewOrders});
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
    Object? isMoreLoading = null,
    Object? newOrders = null,
    Object? totalNewOrders = null,
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
      newOrders: null == newOrders
          ? _value.newOrders
          : newOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalNewOrders: null == totalNewOrders
          ? _value.totalNewOrders
          : totalNewOrders // ignore: cast_nullable_to_non_nullable
              as int,
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
      bool isMoreLoading,
      List<OrderData> newOrders,
      int totalNewOrders});
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
    Object? isMoreLoading = null,
    Object? newOrders = null,
    Object? totalNewOrders = null,
  }) {
    return _then(_$_NewOrdersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      newOrders: null == newOrders
          ? _value._newOrders
          : newOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalNewOrders: null == totalNewOrders
          ? _value.totalNewOrders
          : totalNewOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NewOrdersState extends _NewOrdersState {
  const _$_NewOrdersState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<OrderData> newOrders = const [],
      this.totalNewOrders = 0})
      : _newOrders = newOrders,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<OrderData> _newOrders;
  @override
  @JsonKey()
  List<OrderData> get newOrders {
    if (_newOrders is EqualUnmodifiableListView) return _newOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newOrders);
  }

  @override
  @JsonKey()
  final int totalNewOrders;

  @override
  String toString() {
    return 'NewOrdersState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, newOrders: $newOrders, totalNewOrders: $totalNewOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewOrdersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            const DeepCollectionEquality()
                .equals(other._newOrders, _newOrders) &&
            (identical(other.totalNewOrders, totalNewOrders) ||
                other.totalNewOrders == totalNewOrders));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      const DeepCollectionEquality().hash(_newOrders), totalNewOrders);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewOrdersStateCopyWith<_$_NewOrdersState> get copyWith =>
      __$$_NewOrdersStateCopyWithImpl<_$_NewOrdersState>(this, _$identity);
}

abstract class _NewOrdersState extends NewOrdersState {
  const factory _NewOrdersState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<OrderData> newOrders,
      final int totalNewOrders}) = _$_NewOrdersState;
  const _NewOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<OrderData> get newOrders;
  @override
  int get totalNewOrders;
  @override
  @JsonKey(ignore: true)
  _$$_NewOrdersStateCopyWith<_$_NewOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
