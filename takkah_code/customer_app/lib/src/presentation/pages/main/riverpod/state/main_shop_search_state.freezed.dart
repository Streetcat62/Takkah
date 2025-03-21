// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_shop_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainShopSearchState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ShopData> get shops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainShopSearchStateCopyWith<MainShopSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainShopSearchStateCopyWith<$Res> {
  factory $MainShopSearchStateCopyWith(
          MainShopSearchState value, $Res Function(MainShopSearchState) then) =
      _$MainShopSearchStateCopyWithImpl<$Res, MainShopSearchState>;
  @useResult
  $Res call({bool isLoading, List<ShopData> shops});
}

/// @nodoc
class _$MainShopSearchStateCopyWithImpl<$Res, $Val extends MainShopSearchState>
    implements $MainShopSearchStateCopyWith<$Res> {
  _$MainShopSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? shops = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shops: null == shops
          ? _value.shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainShopSearchStateCopyWith<$Res>
    implements $MainShopSearchStateCopyWith<$Res> {
  factory _$$_MainShopSearchStateCopyWith(_$_MainShopSearchState value,
          $Res Function(_$_MainShopSearchState) then) =
      __$$_MainShopSearchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ShopData> shops});
}

/// @nodoc
class __$$_MainShopSearchStateCopyWithImpl<$Res>
    extends _$MainShopSearchStateCopyWithImpl<$Res, _$_MainShopSearchState>
    implements _$$_MainShopSearchStateCopyWith<$Res> {
  __$$_MainShopSearchStateCopyWithImpl(_$_MainShopSearchState _value,
      $Res Function(_$_MainShopSearchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? shops = null,
  }) {
    return _then(_$_MainShopSearchState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shops: null == shops
          ? _value._shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
    ));
  }
}

/// @nodoc

class _$_MainShopSearchState extends _MainShopSearchState {
  const _$_MainShopSearchState(
      {this.isLoading = false, final List<ShopData> shops = const []})
      : _shops = shops,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ShopData> _shops;
  @override
  @JsonKey()
  List<ShopData> get shops {
    if (_shops is EqualUnmodifiableListView) return _shops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  @override
  String toString() {
    return 'MainShopSearchState(isLoading: $isLoading, shops: $shops)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainShopSearchState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._shops, _shops));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_shops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainShopSearchStateCopyWith<_$_MainShopSearchState> get copyWith =>
      __$$_MainShopSearchStateCopyWithImpl<_$_MainShopSearchState>(
          this, _$identity);
}

abstract class _MainShopSearchState extends MainShopSearchState {
  const factory _MainShopSearchState(
      {final bool isLoading,
      final List<ShopData> shops}) = _$_MainShopSearchState;
  const _MainShopSearchState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ShopData> get shops;
  @override
  @JsonKey(ignore: true)
  _$$_MainShopSearchStateCopyWith<_$_MainShopSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
