import '../data/address_data.dart';

class SingleAddressResponse {
  SingleAddressResponse({AddressData? data}) {
    _data = data;
  }

  SingleAddressResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? AddressData.fromJson(json['data']) : null;
  }

  AddressData? _data;

  SingleAddressResponse copyWith({AddressData? data}) =>
      SingleAddressResponse(data: data ?? _data);

  AddressData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
