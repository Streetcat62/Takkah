// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_lang_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectLangState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  List<LanguageData> get languages => throw _privateConstructorUsedError;
  List<LanguageData> get languagesStore => throw _privateConstructorUsedError;
  LanguageData? get selectedLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectLangStateCopyWith<SelectLangState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectLangStateCopyWith<$Res> {
  factory $SelectLangStateCopyWith(
          SelectLangState value, $Res Function(SelectLangState) then) =
      _$SelectLangStateCopyWithImpl<$Res, SelectLangState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<LanguageData> languages,
      List<LanguageData> languagesStore,
      LanguageData? selectedLanguage});
}

/// @nodoc
class _$SelectLangStateCopyWithImpl<$Res, $Val extends SelectLangState>
    implements $SelectLangStateCopyWith<$Res> {
  _$SelectLangStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? languages = null,
    Object? languagesStore = null,
    Object? selectedLanguage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageData>,
      languagesStore: null == languagesStore
          ? _value.languagesStore
          : languagesStore // ignore: cast_nullable_to_non_nullable
              as List<LanguageData>,
      selectedLanguage: freezed == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as LanguageData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectLangStateCopyWith<$Res>
    implements $SelectLangStateCopyWith<$Res> {
  factory _$$_SelectLangStateCopyWith(
          _$_SelectLangState value, $Res Function(_$_SelectLangState) then) =
      __$$_SelectLangStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<LanguageData> languages,
      List<LanguageData> languagesStore,
      LanguageData? selectedLanguage});
}

/// @nodoc
class __$$_SelectLangStateCopyWithImpl<$Res>
    extends _$SelectLangStateCopyWithImpl<$Res, _$_SelectLangState>
    implements _$$_SelectLangStateCopyWith<$Res> {
  __$$_SelectLangStateCopyWithImpl(
      _$_SelectLangState _value, $Res Function(_$_SelectLangState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? languages = null,
    Object? languagesStore = null,
    Object? selectedLanguage = freezed,
  }) {
    return _then(_$_SelectLangState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageData>,
      languagesStore: null == languagesStore
          ? _value._languagesStore
          : languagesStore // ignore: cast_nullable_to_non_nullable
              as List<LanguageData>,
      selectedLanguage: freezed == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as LanguageData?,
    ));
  }
}

/// @nodoc

class _$_SelectLangState extends _SelectLangState {
  const _$_SelectLangState(
      {this.isLoading = false,
      this.isSaving = false,
      final List<LanguageData> languages = const [],
      final List<LanguageData> languagesStore = const [],
      this.selectedLanguage})
      : _languages = languages,
        _languagesStore = languagesStore,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  final List<LanguageData> _languages;
  @override
  @JsonKey()
  List<LanguageData> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  final List<LanguageData> _languagesStore;
  @override
  @JsonKey()
  List<LanguageData> get languagesStore {
    if (_languagesStore is EqualUnmodifiableListView) return _languagesStore;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languagesStore);
  }

  @override
  final LanguageData? selectedLanguage;

  @override
  String toString() {
    return 'SelectLangState(isLoading: $isLoading, isSaving: $isSaving, languages: $languages, languagesStore: $languagesStore, selectedLanguage: $selectedLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectLangState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._languagesStore, _languagesStore) &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSaving,
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(_languagesStore),
      selectedLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectLangStateCopyWith<_$_SelectLangState> get copyWith =>
      __$$_SelectLangStateCopyWithImpl<_$_SelectLangState>(this, _$identity);
}

abstract class _SelectLangState extends SelectLangState {
  const factory _SelectLangState(
      {final bool isLoading,
      final bool isSaving,
      final List<LanguageData> languages,
      final List<LanguageData> languagesStore,
      final LanguageData? selectedLanguage}) = _$_SelectLangState;
  const _SelectLangState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  List<LanguageData> get languages;
  @override
  List<LanguageData> get languagesStore;
  @override
  LanguageData? get selectedLanguage;
  @override
  @JsonKey(ignore: true)
  _$$_SelectLangStateCopyWith<_$_SelectLangState> get copyWith =>
      throw _privateConstructorUsedError;
}
