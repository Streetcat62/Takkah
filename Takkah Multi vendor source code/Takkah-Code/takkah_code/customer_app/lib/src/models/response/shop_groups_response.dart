import '../data/translation.dart';

class ShopGroupsResponse {
  ShopGroupsResponse({List<ShopGroupData>? data}) {
    _data = data;
  }

  ShopGroupsResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ShopGroupData.fromJson(v));
      });
    }
  }

  List<ShopGroupData>? _data;

  ShopGroupsResponse copyWith({List<ShopGroupData>? data}) =>
      ShopGroupsResponse(data: data ?? _data);

  List<ShopGroupData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ShopGroupData {
  ShopGroupData({
    int? id,
    int? status,
    Translation? translation,
  }) {
    _id = id;
    _status = status;
    _translation = translation;
  }

  ShopGroupData.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  int? _status;
  Translation? _translation;

  ShopGroupData copyWith({
    int? id,
    int? status,
    Translation? translation,
  }) =>
      ShopGroupData(
        id: id ?? _id,
        status: status ?? _status,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  int? get status => _status;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}
