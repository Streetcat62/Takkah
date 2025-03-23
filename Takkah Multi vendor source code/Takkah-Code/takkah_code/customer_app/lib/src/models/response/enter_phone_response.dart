class EnterPhoneResponse {
  EnterPhoneResponse({EnterPhoneData? data}) {
    _data = data;
  }

  EnterPhoneResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? EnterPhoneData.fromJson(json['data']) : null;
  }

  EnterPhoneData? _data;

  EnterPhoneResponse copyWith({EnterPhoneData? data}) =>
      EnterPhoneResponse(data: data ?? _data);

  EnterPhoneData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class EnterPhoneData {
  EnterPhoneData({String? verifyId, String? phone}) {
    _verifyId = verifyId;
    _phone = phone;
  }

  EnterPhoneData.fromJson(dynamic json) {
    _verifyId = json['verifyId'];
    _phone = json['phone'];
  }

  String? _verifyId;
  String? _phone;

  EnterPhoneData copyWith({String? verifyId, String? phone}) =>
      EnterPhoneData(verifyId: verifyId ?? _verifyId, phone: phone ?? _phone);

  String? get verifyId => _verifyId;

  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['verifyId'] = _verifyId;
    map['phone'] = _phone;
    return map;
  }
}
