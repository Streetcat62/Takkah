// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ready_orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReadyOrdersState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<OrderData> get readyOrders => throw _privateConstructorUsedError;
  int get totalReadyOrders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadyOrdersStateCopyWith<ReadyOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadyOrdersStateCopyWith<$Res> {
  factory $ReadyOrdersStateCopyWith(
          ReadyOrdersState value, $Res Function(ReadyOrdersState) then) =
      _$ReadyOrdersStateCopyWithImpl<$Res, ReadyOrdersState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<OrderData> readyOrders,
      int totalReadyOrders});
}

/// @nodoc
class _$ReadyOrdersStateCopyWithImpl<$Res, $Val extends ReadyOrdersState>
    implements $ReadyOrdersStateCopyWith<$Res> {
  _$ReadyOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? readyOrders = null,
    Object? totalReadyOrders = null,
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
      readyOrders: null == readyOrders
          ? _value.readyOrders
          : readyOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalReadyOrders: null == totalReadyOrders
          ? _value.totalReadyOrders
          : totalReadyOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReadyOrdersStateCopyWith<$Res>
    implements $ReadyOrdersStateCopyWith<$Res> {
  factory _$$_ReadyOrdersStateCopyWith(
          _$_ReadyOrdersState value, $Res Function(_$_ReadyOrdersState) then) =
      __$$_ReadyOrdersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<OrderData> readyOrders,
      int totalReadyOrders});
}

/// @nodoc
class __$$_ReadyOrdersStateCopyWithImpl<$Res>
    extends _$ReadyOrdersStateCopyWithImpl<$Res, _$_ReadyOrdersState>
    implements _$$_ReadyOrdersStateCopyWith<$Res> {
  __$$_ReadyOrdersStateCopyWithImpl(
      _$_ReadyOrdersState _value, $Res Function(_$_ReadyOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? readyOrders = null,
    Object? totalReadyOrders = null,
  }) {
    return _then(_$_ReadyOrdersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      readyOrders: null == readyOrders
          ? _value._readyOrders
          : readyOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalReadyOrders: null == totalReadyOrders
          ? _value.totalReadyOrders
          : totalReadyOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ReadyOrdersState extends _ReadyOrdersState {
  const _$_ReadyOrdersState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<OrderData> readyOrders = const [],
      this.totalReadyOrders = 0})
      : _readyOrders = readyOrders,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<OrderData> _readyOrders;
  @override
  @JsonKey()
  List<OrderData> get readyOrders {
    if (_readyOrders is EqualUnmodifiableListView) return _readyOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readyOrders);
  }

  @override
  @JsonKey()
  final int totalReadyOrders;

  @override
  String toString() {
    return 'ReadyOrdersState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, readyOrders: $readyOrders, totalReadyOrders: $totalReadyOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadyOrdersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            const DeepCollectionEquality()
                .equals(other._readyOrders, _readyOrders) &&
            (identical(other.totalReadyOrders, totalReadyOrders) ||
                other.totalReadyOrders == totalReadyOrders));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      const DeepCollectionEquality().hash(_readyOrders), totalReadyOrders);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadyOrdersStateCopyWith<_$_ReadyOrdersState> get copyWith =>
      __$$_ReadyOrdersStateCopyWithImpl<_$_ReadyOrdersState>(this, _$identity);
}

abstract class _ReadyOrdersState extends ReadyOrdersState {
  const factory _ReadyOrdersState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<OrderData> readyOrders,
      final int totalReadyOrders}) = _$_ReadyOrdersState;
  const _ReadyOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<OrderData> get readyOrders;
  @override
  int get totalReadyOrders;
  @override
  @JsonKey(ignore: true)
  _$$_ReadyOrdersStateCopyWith<_$_ReadyOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
