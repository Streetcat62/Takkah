// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'languages_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LanguagesState {
  List<LanguageData> get languages => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isSelectLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LanguagesStateCopyWith<LanguagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguagesStateCopyWith<$Res> {
  factory $LanguagesStateCopyWith(
          LanguagesState value, $Res Function(LanguagesState) then) =
      _$LanguagesStateCopyWithImpl<$Res, LanguagesState>;
  @useResult
  $Res call(
      {List<LanguageData> languages,
      int index,
      bool isLoading,
      bool isSuccess,
      bool isSelectLanguage});
}

/// @nodoc
class _$LanguagesStateCopyWithImpl<$Res, $Val extends LanguagesState>
    implements $LanguagesStateCopyWith<$Res> {
  _$LanguagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = null,
    Object? index = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isSelectLanguage = null,
  }) {
    return _then(_value.copyWith(
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageData>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelectLanguage: null == isSelectLanguage
          ? _value.isSelectLanguage
          : isSelectLanguage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LanguagesStateCopyWith<$Res>
    implements $LanguagesStateCopyWith<$Res> {
  factory _$$_LanguagesStateCopyWith(
          _$_LanguagesState value, $Res Function(_$_LanguagesState) then) =
      __$$_LanguagesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LanguageData> languages,
      int index,
      bool isLoading,
      bool isSuccess,
      bool isSelectLanguage});
}

/// @nodoc
class __$$_LanguagesStateCopyWithImpl<$Res>
    extends _$LanguagesStateCopyWithImpl<$Res, _$_LanguagesState>
    implements _$$_LanguagesStateCopyWith<$Res> {
  __$$_LanguagesStateCopyWithImpl(
      _$_LanguagesState _value, $Res Function(_$_LanguagesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languages = null,
    Object? index = null,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isSelectLanguage = null,
  }) {
    return _then(_$_LanguagesState(
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageData>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelectLanguage: null == isSelectLanguage
          ? _value.isSelectLanguage
          : isSelectLanguage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LanguagesState extends _LanguagesState {
  const _$_LanguagesState(
      {final List<LanguageData> languages = const [],
      this.index = 0,
      this.isLoading = true,
      this.isSuccess = false,
      this.isSelectLanguage = false})
      : _languages = languages,
        super._();

  final List<LanguageData> _languages;
  @override
  @JsonKey()
  List<LanguageData> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool isSelectLanguage;

  @override
  String toString() {
    return 'LanguagesState(languages: $languages, index: $index, isLoading: $isLoading, isSuccess: $isSuccess, isSelectLanguage: $isSelectLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LanguagesState &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isSelectLanguage, isSelectLanguage) ||
                other.isSelectLanguage == isSelectLanguage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_languages),
      index,
      isLoading,
      isSuccess,
      isSelectLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanguagesStateCopyWith<_$_LanguagesState> get copyWith =>
      __$$_LanguagesStateCopyWithImpl<_$_LanguagesState>(this, _$identity);
}

abstract class _LanguagesState extends LanguagesState {
  const factory _LanguagesState(
      {final List<LanguageData> languages,
      final int index,
      final bool isLoading,
      final bool isSuccess,
      final bool isSelectLanguage}) = _$_LanguagesState;
  const _LanguagesState._() : super._();

  @override
  List<LanguageData> get languages;
  @override
  int get index;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isSelectLanguage;
  @override
  @JsonKey(ignore: true)
  _$$_LanguagesStateCopyWith<_$_LanguagesState> get copyWith =>
      throw _privateConstructorUsedError;
}
