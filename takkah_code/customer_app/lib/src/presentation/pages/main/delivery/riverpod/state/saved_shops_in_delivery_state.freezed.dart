// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_shops_in_delivery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedShopsInDeliveryState {
  bool get isSavedShopsLoading => throw _privateConstructorUsedError;
  List<ShopData> get savedShops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedShopsInDeliveryStateCopyWith<SavedShopsInDeliveryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedShopsInDeliveryStateCopyWith<$Res> {
  factory $SavedShopsInDeliveryStateCopyWith(SavedShopsInDeliveryState value,
          $Res Function(SavedShopsInDeliveryState) then) =
      _$SavedShopsInDeliveryStateCopyWithImpl<$Res, SavedShopsInDeliveryState>;
  @useResult
  $Res call({bool isSavedShopsLoading, List<ShopData> savedShops});
}

/// @nodoc
class _$SavedShopsInDeliveryStateCopyWithImpl<$Res,
        $Val extends SavedShopsInDeliveryState>
    implements $SavedShopsInDeliveryStateCopyWith<$Res> {
  _$SavedShopsInDeliveryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSavedShopsLoading = null,
    Object? savedShops = null,
  }) {
    return _then(_value.copyWith(
      isSavedShopsLoading: null == isSavedShopsLoading
          ? _value.isSavedShopsLoading
          : isSavedShopsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      savedShops: null == savedShops
          ? _value.savedShops
          : savedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedShopsInDeliveryStateCopyWith<$Res>
    implements $SavedShopsInDeliveryStateCopyWith<$Res> {
  factory _$$_SavedShopsInDeliveryStateCopyWith(
          _$_SavedShopsInDeliveryState value,
          $Res Function(_$_SavedShopsInDeliveryState) then) =
      __$$_SavedShopsInDeliveryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSavedShopsLoading, List<ShopData> savedShops});
}

/// @nodoc
class __$$_SavedShopsInDeliveryStateCopyWithImpl<$Res>
    extends _$SavedShopsInDeliveryStateCopyWithImpl<$Res,
        _$_SavedShopsInDeliveryState>
    implements _$$_SavedShopsInDeliveryStateCopyWith<$Res> {
  __$$_SavedShopsInDeliveryStateCopyWithImpl(
      _$_SavedShopsInDeliveryState _value,
      $Res Function(_$_SavedShopsInDeliveryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSavedShopsLoading = null,
    Object? savedShops = null,
  }) {
    return _then(_$_SavedShopsInDeliveryState(
      isSavedShopsLoading: null == isSavedShopsLoading
          ? _value.isSavedShopsLoading
          : isSavedShopsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      savedShops: null == savedShops
          ? _value._savedShops
          : savedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
    ));
  }
}

/// @nodoc

class _$_SavedShopsInDeliveryState extends _SavedShopsInDeliveryState {
  const _$_SavedShopsInDeliveryState(
      {this.isSavedShopsLoading = false,
      final List<ShopData> savedShops = const []})
      : _savedShops = savedShops,
        super._();

  @override
  @JsonKey()
  final bool isSavedShopsLoading;
  final List<ShopData> _savedShops;
  @override
  @JsonKey()
  List<ShopData> get savedShops {
    if (_savedShops is EqualUnmodifiableListView) return _savedShops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedShops);
  }

  @override
  String toString() {
    return 'SavedShopsInDeliveryState(isSavedShopsLoading: $isSavedShopsLoading, savedShops: $savedShops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedShopsInDeliveryState &&
            (identical(other.isSavedShopsLoading, isSavedShopsLoading) ||
                other.isSavedShopsLoading == isSavedShopsLoading) &&
            const DeepCollectionEquality()
                .equals(other._savedShops, _savedShops));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSavedShopsLoading,
      const DeepCollectionEquality().hash(_savedShops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedShopsInDeliveryStateCopyWith<_$_SavedShopsInDeliveryState>
      get copyWith => __$$_SavedShopsInDeliveryStateCopyWithImpl<
          _$_SavedShopsInDeliveryState>(this, _$identity);
}

abstract class _SavedShopsInDeliveryState extends SavedShopsInDeliveryState {
  const factory _SavedShopsInDeliveryState(
      {final bool isSavedShopsLoading,
      final List<ShopData> savedShops}) = _$_SavedShopsInDeliveryState;
  const _SavedShopsInDeliveryState._() : super._();

  @override
  bool get isSavedShopsLoading;
  @override
  List<ShopData> get savedShops;
  @override
  @JsonKey(ignore: true)
  _$$_SavedShopsInDeliveryStateCopyWith<_$_SavedShopsInDeliveryState>
      get copyWith => throw _privateConstructorUsedError;
}
