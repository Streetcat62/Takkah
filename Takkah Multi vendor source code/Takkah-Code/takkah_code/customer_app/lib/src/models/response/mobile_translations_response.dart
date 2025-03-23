class MobileTranslationsResponse {
  MobileTranslationsResponse({Map<String, dynamic>? data}) {
    _data = data;
  }

  MobileTranslationsResponse.fromJson(dynamic json) {
    _data = json['data'];
  }

  Map<String, dynamic>? _data;

  MobileTranslationsResponse copyWith({Map<String, dynamic>? data}) =>
      MobileTranslationsResponse(data: data ?? _data);

  Map<String, dynamic>? get data => _data;
}
