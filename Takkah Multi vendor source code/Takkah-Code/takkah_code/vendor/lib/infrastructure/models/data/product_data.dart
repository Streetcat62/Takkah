import 'category.dart';
import 'unit_data.dart';

class ProductData {
  ProductData({
    int? id,
    num? price,
    int? cartCount,
    String? uuid,
    int? shopId,
    int? categoryId,
    num? tax,
    String? barCode,
    String? status,
    int? active,
    bool? addon,
    String? img,
    int? minQty,
    int? maxQty,
    List<String>? locales,
    CategoryModel? category,
    UnitData? unit,
    int? quantity,
    int? unitId,
    List<ProductDiscounts>? discounts,
    bool? isSelectedAddon,
  }) {
    _id = id;
    _price = price;
    _cartCount = cartCount;
    _uuid = uuid;
    _shopId = shopId;
    _categoryId = categoryId;
    _tax = tax;
    _barCode = barCode;
    _status = status;
    _active = active;
    _addon = addon;
    _img = img;
    _minQty = minQty;
    _maxQty = maxQty;
    _locales = locales;
    _translation = translation;

    _unit = unit;
    _stocks = quantity;
    _unitId = unitId;
    _discounts = discounts;
    _isSelectedAddon = isSelectedAddon;
  }

  ProductData.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _cartCount = 0;
    _uuid = json['uuid'];
    _shopId = json['shop_id'];
    _categoryId = int.tryParse(json['category_id'].toString());
    _tax = num.tryParse(json['tax'].toString());
    _barCode = json['bar_code'];
    _status = json['status'];
    _active = json['active'];
    _addon = json['addon'];
    _img = json['img'];
    _minQty = int.tryParse(json['min_qty'].toString());
    _maxQty = int.tryParse(json['max_qty'].toString());
    _locales = json['locales'] != null ? json['locales'].cast<String>() : [];

    _category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
    _unit = json['unit'] != null ? UnitData.fromJson(json['unit']) : null;
    _stocks = json['quantity'];
    _unitId = json['unit_id'];
    if (json['discounts'] != null) {
      _discounts = [];
      json['discounts'].forEach((v) {
        _discounts?.add(ProductDiscounts.fromJson(v));
      });
    }
    _isSelectedAddon = false;
  }

  int? _id;
  num? _price;
  int? _cartCount;
  String? _uuid;
  int? _shopId;
  int? _categoryId;
  num? _tax;
  String? _barCode;
  String? _status;
  int? _active;
  bool? _addon;
  String? _img;
  int? _minQty;
  int? _maxQty;
  List<String>? _locales;
  Translation? _translation;
  CategoryModel? _category;
  UnitData? _unit;
  int? _stocks;
  int? _unitId;
  List<ProductDiscounts>? _discounts;
  bool? _isSelectedAddon;

  ProductData copyWith({
    int? id,
    num? price,
    int? cartCount,
    String? uuid,
    int? shopId,
    int? categoryId,
    num? tax,
    String? barCode,
    String? status,
    int? active,
    bool? addon,
    String? img,
    int? minQty,
    int? maxQty,
    List<String>? locales,
    Translation? translation,
    CategoryModel? category,
    UnitData? unit,
    int? stocks,
    int? unitId,
    List<ProductDiscounts>? discounts,
    bool? isSelectedAddon,
  }) =>
      ProductData(
        id: id ?? _id,
        price: price ?? _price,
        cartCount: cartCount ?? _cartCount,
        uuid: uuid ?? _uuid,
        shopId: shopId ?? _shopId,
        categoryId: categoryId ?? _categoryId,
        tax: tax ?? _tax,
        barCode: barCode ?? _barCode,
        status: status ?? _status,
        active: active ?? _active,
        addon: addon ?? _addon,
        img: img ?? _img,
        minQty: minQty ?? _minQty,
        maxQty: maxQty ?? _maxQty,
        locales: locales ?? _locales,
        category: category ?? _category,
        unit: unit ?? _unit,
        quantity: stocks ?? _stocks,
        unitId: unitId ?? _unitId,
        discounts: discounts ?? _discounts,
        isSelectedAddon: isSelectedAddon ?? _isSelectedAddon,
      );

  int? get id => _id;

  num? get price => _price;

  int? get cartCount => _cartCount;

  String? get uuid => _uuid;

  int? get shopId => _shopId;

  int? get categoryId => _categoryId;

  num? get tax => _tax;

  String? get barCode => _barCode;

  String? get status => _status;

  int? get active => _active;

  bool? get addon => _addon;

  String? get img => _img;

  int? get minQty => _minQty;

  int? get maxQty => _maxQty;

  List<String>? get locales => _locales;

  Translation? get translation => _translation;

  CategoryModel? get category => _category;

  UnitData? get unit => _unit;

  int? get stocks => _stocks;

  int? get unitId => _unitId;

  List<ProductDiscounts>? get discounts => _discounts;

  bool? get isSelectedAddon => _isSelectedAddon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['uuid'] = _uuid;
    map['shop_id'] = _shopId;
    map['category_id'] = _categoryId;
    map['tax'] = _tax;
    map['bar_code'] = _barCode;
    map['status'] = _status;
    map['active'] = _active;
    map['img'] = _img;
    map['min_qty'] = _minQty;
    map['max_qty'] = _maxQty;
    map['locales'] = _locales;
    map['unit_id'] = _unitId;
    if (_discounts != null) {
      map['discounts'] = _discounts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductDiscounts {
  ProductDiscounts({
    int? id,
    int? shopId,
    String? type,
    num? price,
    String? start,
    String? end,
    String? img,
    int? active,
    ProductPivot? pivot,
  }) {
    _id = id;
    _shopId = shopId;
    _type = type;
    _price = price;
    _start = start;
    _end = end;
    _img = img;
    _active = active;
    _pivot = pivot;
  }

  ProductDiscounts.fromJson(dynamic json) {
    _id = json['id'];
    _shopId = json['shop_id'];
    _type = json['type'];
    _price = json['price'];
    _start = json['start'];
    _end = json['end'];
    _img = json['img'];
    _active = json['active'];
    _pivot =
        json['pivot'] != null ? ProductPivot.fromJson(json['pivot']) : null;
  }

  int? _id;
  int? _shopId;
  String? _type;
  num? _price;
  String? _start;
  String? _end;
  String? _img;
  int? _active;
  ProductPivot? _pivot;

  ProductDiscounts copyWith({
    int? id,
    int? shopId,
    String? type,
    num? price,
    String? start,
    String? end,
    String? img,
    int? active,
    ProductPivot? pivot,
  }) =>
      ProductDiscounts(
        id: id ?? _id,
        shopId: shopId ?? _shopId,
        type: type ?? _type,
        price: price ?? _price,
        start: start ?? _start,
        end: end ?? _end,
        img: img ?? _img,
        active: active ?? _active,
        pivot: pivot ?? _pivot,
      );

  int? get id => _id;

  int? get shopId => _shopId;

  String? get type => _type;

  num? get price => _price;

  String? get start => _start;

  String? get end => _end;

  String? get img => _img;

  int? get active => _active;

  ProductPivot? get pivot => _pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shop_id'] = _shopId;
    map['type'] = _type;
    map['price'] = _price;
    map['start'] = _start;
    map['end'] = _end;
    map['img'] = _img;
    map['active'] = _active;
    if (_pivot != null) {
      map['pivot'] = _pivot?.toJson();
    }
    return map;
  }
}

class ProductPivot {
  ProductPivot({int? productId, int? discountId}) {
    _productId = productId;
    _discountId = discountId;
  }

  ProductPivot.fromJson(dynamic json) {
    _productId = json['product_id'];
    _discountId = json['discount_id'];
  }

  int? _productId;
  int? _discountId;

  ProductPivot copyWith({int? productId, int? discountId}) => ProductPivot(
        productId: productId ?? _productId,
        discountId: discountId ?? _discountId,
      );

  int? get productId => _productId;

  int? get discountId => _discountId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['discount_id'] = _discountId;
    return map;
  }
}
