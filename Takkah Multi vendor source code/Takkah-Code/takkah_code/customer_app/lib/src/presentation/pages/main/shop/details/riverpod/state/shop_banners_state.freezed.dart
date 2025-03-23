// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_banners_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopBannersState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<BannerData> get banners => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopBannersStateCopyWith<ShopBannersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopBannersStateCopyWith<$Res> {
  factory $ShopBannersStateCopyWith(
          ShopBannersState value, $Res Function(ShopBannersState) then) =
      _$ShopBannersStateCopyWithImpl<$Res, ShopBannersState>;
  @useResult
  $Res call({bool isLoading, List<BannerData> banners});
}

/// @nodoc
class _$ShopBannersStateCopyWithImpl<$Res, $Val extends ShopBannersState>
    implements $ShopBannersStateCopyWith<$Res> {
  _$ShopBannersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? banners = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopBannersStateCopyWith<$Res>
    implements $ShopBannersStateCopyWith<$Res> {
  factory _$$_ShopBannersStateCopyWith(
          _$_ShopBannersState value, $Res Function(_$_ShopBannersState) then) =
      __$$_ShopBannersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<BannerData> banners});
}

/// @nodoc
class __$$_ShopBannersStateCopyWithImpl<$Res>
    extends _$ShopBannersStateCopyWithImpl<$Res, _$_ShopBannersState>
    implements _$$_ShopBannersStateCopyWith<$Res> {
  __$$_ShopBannersStateCopyWithImpl(
      _$_ShopBannersState _value, $Res Function(_$_ShopBannersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? banners = null,
  }) {
    return _then(_$_ShopBannersState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      banners: null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
    ));
  }
}

/// @nodoc

class _$_ShopBannersState extends _ShopBannersState {
  const _$_ShopBannersState(
      {this.isLoading = false, final List<BannerData> banners = const []})
      : _banners = banners,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<BannerData> _banners;
  @override
  @JsonKey()
  List<BannerData> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  @override
  String toString() {
    return 'ShopBannersState(isLoading: $isLoading, banners: $banners)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopBannersState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._banners, _banners));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_banners));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopBannersStateCopyWith<_$_ShopBannersState> get copyWith =>
      __$$_ShopBannersStateCopyWithImpl<_$_ShopBannersState>(this, _$identity);
}

abstract class _ShopBannersState extends ShopBannersState {
  const factory _ShopBannersState(
      {final bool isLoading,
      final List<BannerData> banners}) = _$_ShopBannersState;
  const _ShopBannersState._() : super._();

  @override
  bool get isLoading;
  @override
  List<BannerData> get banners;
  @override
  @JsonKey(ignore: true)
  _$$_ShopBannersStateCopyWith<_$_ShopBannersState> get copyWith =>
      throw _privateConstructorUsedError;
}
