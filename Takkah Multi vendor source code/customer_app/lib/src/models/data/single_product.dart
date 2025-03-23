import 'brand_data.dart';
import 'translation.dart';
import 'gallery_data.dart';
import 'category_data.dart';

class SingleProduct {
  SingleProduct({
    int? id,
    String? uuid,
    int? categoryId,
    String? keywords,
    int? brandId,
    int? unitId,
    String? img,
    String? qrCode,
    Translation? translation,
    CategoryData? category,
    BrandData? brand,
    Unit? unit,
    List<GalleryData>? galleries,
  }) {
    _id = id;
    _uuid = uuid;
    _categoryId = categoryId;
    _keywords = keywords;
    _brandId = brandId;
    _unitId = unitId;
    _img = img;
    _qrCode = qrCode;
    _translation = translation;
    _category = category;
    _brand = brand;
    _unit = unit;
    _galleries = galleries;
  }

  SingleProduct.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _categoryId = json['category_id'];
    _keywords = json['keywords'];
    _brandId = json['brand_id'];
    _unitId = json['unit_id'];
    _img = json['img'];
    _qrCode = json['qr_code'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    _category = json['category'] != null
        ? CategoryData.fromJson(json['category'])
        : null;
    _brand = json['brand'] != null ? BrandData.fromJson(json['brand']) : null;
    _unit = json['unit'] != null ? Unit.fromJson(json['unit']) : null;
    if (json['galleries'] != null) {
      _galleries = [];
      json['galleries'].forEach((v) {
        _galleries?.add(GalleryData.fromJson(v));
      });
    }
  }

  int? _id;
  String? _uuid;
  int? _categoryId;
  String? _keywords;
  int? _brandId;
  int? _unitId;
  String? _img;
  String? _qrCode;
  Translation? _translation;
  CategoryData? _category;
  BrandData? _brand;
  Unit? _unit;
  List<GalleryData>? _galleries;

  SingleProduct copyWith({
    int? id,
    String? uuid,
    int? categoryId,
    String? keywords,
    int? brandId,
    int? unitId,
    String? img,
    String? qrCode,
    Translation? translation,
    CategoryData? category,
    BrandData? brand,
    Unit? unit,
    List<GalleryData>? galleries,
  }) =>
      SingleProduct(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        categoryId: categoryId ?? _categoryId,
        keywords: keywords ?? _keywords,
        brandId: brandId ?? _brandId,
        unitId: unitId ?? _unitId,
        img: img ?? _img,
        qrCode: qrCode ?? _qrCode,
        translation: translation ?? _translation,
        category: category ?? _category,
        brand: brand ?? _brand,
        unit: unit ?? _unit,
        galleries: galleries ?? _galleries,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  int? get categoryId => _categoryId;

  String? get keywords => _keywords;

  int? get brandId => _brandId;

  int? get unitId => _unitId;

  String? get img => _img;

  String? get qrCode => _qrCode;

  Translation? get translation => _translation;

  CategoryData? get category => _category;

  BrandData? get brand => _brand;

  Unit? get unit => _unit;

  List<GalleryData>? get galleries => _galleries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['category_id'] = _categoryId;
    map['keywords'] = _keywords;
    map['brand_id'] = _brandId;
    map['img'] = _img;
    map['qr_code'] = _qrCode;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_unit != null) {
      map['unit'] = _unit?.toJson();
    }
    if (_galleries != null) {
      map['galleries'] = _galleries?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Unit {
  Unit({
    int? id,
    String? position,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) {
    _id = id;
    _position = position;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _translation = translation;
  }

  Unit.fromJson(dynamic json) {
    _id = json['id'];
    _position = json['position'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  String? _position;
  String? _createdAt;
  String? _updatedAt;
  Translation? _translation;

  Unit copyWith({
    int? id,
    String? position,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) =>
      Unit(
        id: id ?? _id,
        position: position ?? _position,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  String? get position => _position;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['position'] = _position;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}
