import '../data/address_data.dart';

class AddressesResponse {
  AddressesResponse({List<AddressData>? data}) {
    _data = data;
  }

  AddressesResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AddressData.fromJson(v));
      });
    }
  }

  List<AddressData>? _data;

  AddressesResponse copyWith({List<AddressData>? data}) =>
      AddressesResponse(data: data ?? _data);

  List<AddressData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
