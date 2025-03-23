// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_shops_in_pickup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedShopsInPickupState {
  bool get isSavedShopsLoading => throw _privateConstructorUsedError;
  List<ShopData> get savedShops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedShopsInPickupStateCopyWith<SavedShopsInPickupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedShopsInPickupStateCopyWith<$Res> {
  factory $SavedShopsInPickupStateCopyWith(SavedShopsInPickupState value,
          $Res Function(SavedShopsInPickupState) then) =
      _$SavedShopsInPickupStateCopyWithImpl<$Res, SavedShopsInPickupState>;
  @useResult
  $Res call({bool isSavedShopsLoading, List<ShopData> savedShops});
}

/// @nodoc
class _$SavedShopsInPickupStateCopyWithImpl<$Res,
        $Val extends SavedShopsInPickupState>
    implements $SavedShopsInPickupStateCopyWith<$Res> {
  _$SavedShopsInPickupStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_SavedShopsInPickupStateCopyWith<$Res>
    implements $SavedShopsInPickupStateCopyWith<$Res> {
  factory _$$_SavedShopsInPickupStateCopyWith(_$_SavedShopsInPickupState value,
          $Res Function(_$_SavedShopsInPickupState) then) =
      __$$_SavedShopsInPickupStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSavedShopsLoading, List<ShopData> savedShops});
}

/// @nodoc
class __$$_SavedShopsInPickupStateCopyWithImpl<$Res>
    extends _$SavedShopsInPickupStateCopyWithImpl<$Res,
        _$_SavedShopsInPickupState>
    implements _$$_SavedShopsInPickupStateCopyWith<$Res> {
  __$$_SavedShopsInPickupStateCopyWithImpl(_$_SavedShopsInPickupState _value,
      $Res Function(_$_SavedShopsInPickupState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSavedShopsLoading = null,
    Object? savedShops = null,
  }) {
    return _then(_$_SavedShopsInPickupState(
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

class _$_SavedShopsInPickupState extends _SavedShopsInPickupState {
  const _$_SavedShopsInPickupState(
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
    return 'SavedShopsInPickupState(isSavedShopsLoading: $isSavedShopsLoading, savedShops: $savedShops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedShopsInPickupState &&
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
  _$$_SavedShopsInPickupStateCopyWith<_$_SavedShopsInPickupState>
      get copyWith =>
          __$$_SavedShopsInPickupStateCopyWithImpl<_$_SavedShopsInPickupState>(
              this, _$identity);
}

abstract class _SavedShopsInPickupState extends SavedShopsInPickupState {
  const factory _SavedShopsInPickupState(
      {final bool isSavedShopsLoading,
      final List<ShopData> savedShops}) = _$_SavedShopsInPickupState;
  const _SavedShopsInPickupState._() : super._();

  @override
  bool get isSavedShopsLoading;
  @override
  List<ShopData> get savedShops;
  @override
  @JsonKey(ignore: true)
  _$$_SavedShopsInPickupStateCopyWith<_$_SavedShopsInPickupState>
      get copyWith => throw _privateConstructorUsedError;
}
