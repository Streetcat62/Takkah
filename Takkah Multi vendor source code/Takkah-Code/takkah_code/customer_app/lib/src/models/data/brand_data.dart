class BrandData {
  BrandData({int? id, Brand? brand}) {
    _id = id;
    _brand = brand;
  }

  BrandData.fromJson(dynamic json) {
    _id = json['id'];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
  }

  int? _id;
  Brand? _brand;

  BrandData copyWith({int? id, Brand? brand}) =>
      BrandData(id: id ?? _id, brand: brand ?? _brand);

  int? get id => _id;

  Brand? get brand => _brand;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    return map;
  }
}

class Brand {
  Brand({
    int? id,
    String? uuid,
    String? title,
    bool? active,
    String? img,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _uuid = uuid;
    _title = title;
    _active = active;
    _img = img;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _title = json['title'];
    _active = json['active'];
    _img = json['img'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _uuid;
  String? _title;
  bool? _active;
  String? _img;
  String? _createdAt;
  String? _updatedAt;

  Brand copyWith({
    int? id,
    String? uuid,
    String? title,
    bool? active,
    String? img,
    String? createdAt,
    String? updatedAt,
  }) =>
      Brand(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        title: title ?? _title,
        active: active ?? _active,
        img: img ?? _img,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  String? get title => _title;

  bool? get active => _active;

  String? get img => _img;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['title'] = _title;
    map['active'] = _active;
    map['img'] = _img;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
