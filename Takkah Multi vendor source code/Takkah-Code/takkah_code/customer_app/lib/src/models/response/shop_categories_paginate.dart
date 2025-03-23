import '../data/translation.dart';
import '../data/product_data.dart';

class ShopCategoriesPaginateResponse {
  ShopCategoriesPaginateResponse({List<ShopCategoryData>? data}) {
    _data = data;
  }

  ShopCategoriesPaginateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ShopCategoryData.fromJson(v));
      });
    }
  }

  List<ShopCategoryData>? _data;

  ShopCategoriesPaginateResponse copyWith({List<ShopCategoryData>? data}) =>
      ShopCategoriesPaginateResponse(data: data ?? _data);

  List<ShopCategoryData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ShopCategoryData {
  ShopCategoryData({
    int? id,
    String? uuid,
    String? keywords,
    int? parentId,
    String? type,
    String? img,
    bool? active,
    String? createdAt,
    String? updatedAt,
    List<ProductData>? products,
    Translation? translation,
  }) {
    _id = id;
    _uuid = uuid;
    _keywords = keywords;
    _parentId = parentId;
    _type = type;
    _img = img;
    _active = active;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _products = products;
    _translation = translation;
  }

  ShopCategoryData.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _keywords = json['keywords'];
    _parentId = json['parent_id'];
    _type = json['type'];
    _img = json['img'];
    _active = json['active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['shop_product'] != null) {
      _products = [];
      json['shop_product'].forEach((v) {
        _products?.add(ProductData.fromJson(v));
      });
    }
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  String? _uuid;
  String? _keywords;
  int? _parentId;
  String? _type;
  String? _img;
  bool? _active;
  String? _createdAt;
  String? _updatedAt;
  List<ProductData>? _products;
  Translation? _translation;

  ShopCategoryData copyWith({
    int? id,
    String? uuid,
    String? keywords,
    int? parentId,
    String? type,
    String? img,
    bool? active,
    String? createdAt,
    String? updatedAt,
    List<ProductData>? products,
    Translation? translation,
  }) =>
      ShopCategoryData(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        keywords: keywords ?? _keywords,
        parentId: parentId ?? _parentId,
        type: type ?? _type,
        img: img ?? _img,
        active: active ?? _active,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        products: products ?? _products,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  String? get keywords => _keywords;

  int? get parentId => _parentId;

  String? get type => _type;

  String? get img => _img;

  bool? get active => _active;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List<ProductData>? get products => _products;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['keywords'] = _keywords;
    map['parent_id'] = _parentId;
    map['type'] = _type;
    map['img'] = _img;
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_products != null) {
      map['shop_product'] = _products?.map((v) => v.toJson()).toList();
    }
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}
