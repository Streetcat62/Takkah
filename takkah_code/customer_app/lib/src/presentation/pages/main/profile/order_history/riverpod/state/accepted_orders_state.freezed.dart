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
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<OrderData> get acceptedOrders => throw _privateConstructorUsedError;
  int get totalAcceptedOrders => throw _privateConstructorUsedError;

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
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<OrderData> acceptedOrders,
      int totalAcceptedOrders});
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
    Object? isMoreLoading = null,
    Object? acceptedOrders = null,
    Object? totalAcceptedOrders = null,
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
      acceptedOrders: null == acceptedOrders
          ? _value.acceptedOrders
          : acceptedOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalAcceptedOrders: null == totalAcceptedOrders
          ? _value.totalAcceptedOrders
          : totalAcceptedOrders // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<OrderData> acceptedOrders,
      int totalAcceptedOrders});
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
    Object? isMoreLoading = null,
    Object? acceptedOrders = null,
    Object? totalAcceptedOrders = null,
  }) {
    return _then(_$_AcceptedOrdersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptedOrders: null == acceptedOrders
          ? _value._acceptedOrders
          : acceptedOrders // ignore: cast_nullable_to_non_nullable
              as List<OrderData>,
      totalAcceptedOrders: null == totalAcceptedOrders
          ? _value.totalAcceptedOrders
          : totalAcceptedOrders // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AcceptedOrdersState extends _AcceptedOrdersState {
  const _$_AcceptedOrdersState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<OrderData> acceptedOrders = const [],
      this.totalAcceptedOrders = 0})
      : _acceptedOrders = acceptedOrders,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<OrderData> _acceptedOrders;
  @override
  @JsonKey()
  List<OrderData> get acceptedOrders {
    if (_acceptedOrders is EqualUnmodifiableListView) return _acceptedOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_acceptedOrders);
  }

  @override
  @JsonKey()
  final int totalAcceptedOrders;

  @override
  String toString() {
    return 'AcceptedOrdersState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, acceptedOrders: $acceptedOrders, totalAcceptedOrders: $totalAcceptedOrders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AcceptedOrdersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            const DeepCollectionEquality()
                .equals(other._acceptedOrders, _acceptedOrders) &&
            (identical(other.totalAcceptedOrders, totalAcceptedOrders) ||
                other.totalAcceptedOrders == totalAcceptedOrders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isMoreLoading,
      const DeepCollectionEquality().hash(_acceptedOrders),
      totalAcceptedOrders);

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
      final bool isMoreLoading,
      final List<OrderData> acceptedOrders,
      final int totalAcceptedOrders}) = _$_AcceptedOrdersState;
  const _AcceptedOrdersState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<OrderData> get acceptedOrders;
  @override
  int get totalAcceptedOrders;
  @override
  @JsonKey(ignore: true)
  _$$_AcceptedOrdersStateCopyWith<_$_AcceptedOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
