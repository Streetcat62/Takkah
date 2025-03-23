// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatisticsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRefresh => throw _privateConstructorUsedError;
  List<Series<OrdinalSales, String>> get list =>
      throw _privateConstructorUsedError;
  List<StatisticsOrder> get listOfOrder => throw _privateConstructorUsedError;
  StatisticsIncomeResponse? get countData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StatisticsStateCopyWith<StatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsStateCopyWith<$Res> {
  factory $StatisticsStateCopyWith(
          StatisticsState value, $Res Function(StatisticsState) then) =
      _$StatisticsStateCopyWithImpl<$Res, StatisticsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isRefresh,
      List<Series<OrdinalSales, String>> list,
      List<StatisticsOrder> listOfOrder,
      StatisticsIncomeResponse? countData});
}

/// @nodoc
class _$StatisticsStateCopyWithImpl<$Res, $Val extends StatisticsState>
    implements $StatisticsStateCopyWith<$Res> {
  _$StatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefresh = null,
    Object? list = null,
    Object? listOfOrder = null,
    Object? countData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Series<OrdinalSales, String>>,
      listOfOrder: null == listOfOrder
          ? _value.listOfOrder
          : listOfOrder // ignore: cast_nullable_to_non_nullable
              as List<StatisticsOrder>,
      countData: freezed == countData
          ? _value.countData
          : countData // ignore: cast_nullable_to_non_nullable
              as StatisticsIncomeResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatisticsStateCopyWith<$Res>
    implements $StatisticsStateCopyWith<$Res> {
  factory _$$_StatisticsStateCopyWith(
          _$_StatisticsState value, $Res Function(_$_StatisticsState) then) =
      __$$_StatisticsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isRefresh,
      List<Series<OrdinalSales, String>> list,
      List<StatisticsOrder> listOfOrder,
      StatisticsIncomeResponse? countData});
}

/// @nodoc
class __$$_StatisticsStateCopyWithImpl<$Res>
    extends _$StatisticsStateCopyWithImpl<$Res, _$_StatisticsState>
    implements _$$_StatisticsStateCopyWith<$Res> {
  __$$_StatisticsStateCopyWithImpl(
      _$_StatisticsState _value, $Res Function(_$_StatisticsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefresh = null,
    Object? list = null,
    Object? listOfOrder = null,
    Object? countData = freezed,
  }) {
    return _then(_$_StatisticsState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefresh: null == isRefresh
          ? _value.isRefresh
          : isRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Series<OrdinalSales, String>>,
      listOfOrder: null == listOfOrder
          ? _value._listOfOrder
          : listOfOrder // ignore: cast_nullable_to_non_nullable
              as List<StatisticsOrder>,
      countData: freezed == countData
          ? _value.countData
          : countData // ignore: cast_nullable_to_non_nullable
              as StatisticsIncomeResponse?,
    ));
  }
}

/// @nodoc

class _$_StatisticsState extends _StatisticsState {
  const _$_StatisticsState(
      {this.isLoading = false,
      this.isRefresh = true,
      final List<Series<OrdinalSales, String>> list = const [],
      final List<StatisticsOrder> listOfOrder = const [],
      this.countData})
      : _list = list,
        _listOfOrder = listOfOrder,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isRefresh;
  final List<Series<OrdinalSales, String>> _list;
  @override
  @JsonKey()
  List<Series<OrdinalSales, String>> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  final List<StatisticsOrder> _listOfOrder;
  @override
  @JsonKey()
  List<StatisticsOrder> get listOfOrder {
    if (_listOfOrder is EqualUnmodifiableListView) return _listOfOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfOrder);
  }

  @override
  final StatisticsIncomeResponse? countData;

  @override
  String toString() {
    return 'StatisticsState(isLoading: $isLoading, isRefresh: $isRefresh, list: $list, listOfOrder: $listOfOrder, countData: $countData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatisticsState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRefresh, isRefresh) ||
                other.isRefresh == isRefresh) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality()
                .equals(other._listOfOrder, _listOfOrder) &&
            (identical(other.countData, countData) ||
                other.countData == countData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isRefresh,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(_listOfOrder),
      countData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatisticsStateCopyWith<_$_StatisticsState> get copyWith =>
      __$$_StatisticsStateCopyWithImpl<_$_StatisticsState>(this, _$identity);
}

abstract class _StatisticsState extends StatisticsState {
  const factory _StatisticsState(
      {final bool isLoading,
      final bool isRefresh,
      final List<Series<OrdinalSales, String>> list,
      final List<StatisticsOrder> listOfOrder,
      final StatisticsIncomeResponse? countData}) = _$_StatisticsState;
  const _StatisticsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isRefresh;
  @override
  List<Series<OrdinalSales, String>> get list;
  @override
  List<StatisticsOrder> get listOfOrder;
  @override
  StatisticsIncomeResponse? get countData;
  @override
  @JsonKey(ignore: true)
  _$$_StatisticsStateCopyWith<_$_StatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}
