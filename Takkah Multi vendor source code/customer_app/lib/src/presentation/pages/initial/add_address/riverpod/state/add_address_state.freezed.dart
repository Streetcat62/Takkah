// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddAddressState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  bool get isChoosing => throw _privateConstructorUsedError;
  List<Place> get searchedPlaces => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  TextEditingController? get textController =>
      throw _privateConstructorUsedError;
  GoogleMapController? get mapController => throw _privateConstructorUsedError;
  LocalLocationData? get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddAddressStateCopyWith<AddAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAddressStateCopyWith<$Res> {
  factory $AddAddressStateCopyWith(
          AddAddressState value, $Res Function(AddAddressState) then) =
      _$AddAddressStateCopyWithImpl<$Res, AddAddressState>;
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      bool isChoosing,
      List<Place> searchedPlaces,
      String title,
      TextEditingController? textController,
      GoogleMapController? mapController,
      LocalLocationData? location});
}

/// @nodoc
class _$AddAddressStateCopyWithImpl<$Res, $Val extends AddAddressState>
    implements $AddAddressStateCopyWith<$Res> {
  _$AddAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? isChoosing = null,
    Object? searchedPlaces = null,
    Object? title = null,
    Object? textController = freezed,
    Object? mapController = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isChoosing: null == isChoosing
          ? _value.isChoosing
          : isChoosing // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedPlaces: null == searchedPlaces
          ? _value.searchedPlaces
          : searchedPlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      textController: freezed == textController
          ? _value.textController
          : textController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocalLocationData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddAddressStateCopyWith<$Res>
    implements $AddAddressStateCopyWith<$Res> {
  factory _$$_AddAddressStateCopyWith(
          _$_AddAddressState value, $Res Function(_$_AddAddressState) then) =
      __$$_AddAddressStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      bool isChoosing,
      List<Place> searchedPlaces,
      String title,
      TextEditingController? textController,
      GoogleMapController? mapController,
      LocalLocationData? location});
}

/// @nodoc
class __$$_AddAddressStateCopyWithImpl<$Res>
    extends _$AddAddressStateCopyWithImpl<$Res, _$_AddAddressState>
    implements _$$_AddAddressStateCopyWith<$Res> {
  __$$_AddAddressStateCopyWithImpl(
      _$_AddAddressState _value, $Res Function(_$_AddAddressState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? isChoosing = null,
    Object? searchedPlaces = null,
    Object? title = null,
    Object? textController = freezed,
    Object? mapController = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_AddAddressState(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isChoosing: null == isChoosing
          ? _value.isChoosing
          : isChoosing // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedPlaces: null == searchedPlaces
          ? _value._searchedPlaces
          : searchedPlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      textController: freezed == textController
          ? _value.textController
          : textController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      mapController: freezed == mapController
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocalLocationData?,
    ));
  }
}

/// @nodoc

class _$_AddAddressState extends _AddAddressState {
  const _$_AddAddressState(
      {this.isSearching = false,
      this.isSearchLoading = false,
      this.isChoosing = false,
      final List<Place> searchedPlaces = const [],
      this.title = '',
      this.textController,
      this.mapController,
      this.location})
      : _searchedPlaces = searchedPlaces,
        super._();

  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isSearchLoading;
  @override
  @JsonKey()
  final bool isChoosing;
  final List<Place> _searchedPlaces;
  @override
  @JsonKey()
  List<Place> get searchedPlaces {
    if (_searchedPlaces is EqualUnmodifiableListView) return _searchedPlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedPlaces);
  }

  @override
  @JsonKey()
  final String title;
  @override
  final TextEditingController? textController;
  @override
  final GoogleMapController? mapController;
  @override
  final LocalLocationData? location;

  @override
  String toString() {
    return 'AddAddressState(isSearching: $isSearching, isSearchLoading: $isSearchLoading, isChoosing: $isChoosing, searchedPlaces: $searchedPlaces, title: $title, textController: $textController, mapController: $mapController, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddAddressState &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            (identical(other.isChoosing, isChoosing) ||
                other.isChoosing == isChoosing) &&
            const DeepCollectionEquality()
                .equals(other._searchedPlaces, _searchedPlaces) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.textController, textController) ||
                other.textController == textController) &&
            (identical(other.mapController, mapController) ||
                other.mapController == mapController) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSearching,
      isSearchLoading,
      isChoosing,
      const DeepCollectionEquality().hash(_searchedPlaces),
      title,
      textController,
      mapController,
      location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddAddressStateCopyWith<_$_AddAddressState> get copyWith =>
      __$$_AddAddressStateCopyWithImpl<_$_AddAddressState>(this, _$identity);
}

abstract class _AddAddressState extends AddAddressState {
  const factory _AddAddressState(
      {final bool isSearching,
      final bool isSearchLoading,
      final bool isChoosing,
      final List<Place> searchedPlaces,
      final String title,
      final TextEditingController? textController,
      final GoogleMapController? mapController,
      final LocalLocationData? location}) = _$_AddAddressState;
  const _AddAddressState._() : super._();

  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  bool get isChoosing;
  @override
  List<Place> get searchedPlaces;
  @override
  String get title;
  @override
  TextEditingController? get textController;
  @override
  GoogleMapController? get mapController;
  @override
  LocalLocationData? get location;
  @override
  @JsonKey(ignore: true)
  _$$_AddAddressStateCopyWith<_$_AddAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}
