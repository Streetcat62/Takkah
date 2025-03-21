import 'group.dart';
import 'extras.dart';
import 'product_data.dart';

class Stock {
  Stock({
    int? id,
    int? countableId,
    num? price,
    num? discount,
    int? quantity,
    int? cartCount,
    num? tax,
    num? totalPrice,
    String? countableType,
    ProductData? product,
    List<Extras>? extras,
    List<Group>? localGroups,
    Stock? stock,
    ProductData? countable,
    List<AddonData>? addons,
    List<AddonData>? localAddons,
  }) {
    _id = id;
    _countableId = countableId;
    _price = price;
    _discount = discount;
    _quantity = quantity;
    _cartCount = cartCount;
    _tax = tax;
    _totalPrice = totalPrice;
    _product = product;
    _extras = extras;
    _localGroups = localGroups;
    _countableType = countableType;
    _stock = stock;
    _countable = countable;
    _addons = addons;
    _localAddons = localAddons;
  }

  Stock.fromJson(dynamic json) {
    _id = json['id'];
    _countableId = json['countable_id'];
    _price = json['price'];
    _discount = json['discount'];
    _quantity = json['quantity'];
    _cartCount = 0;
    _tax = json['tax'];
    _totalPrice = json['total_price'];
    _product =
        json['product'] != null ? ProductData.fromJson(json['product']) : null;
    if (json['extras'] != null) {
      _extras = [];
      json['extras'].forEach((v) {
        _extras?.add(Extras.fromJson(v));
      });
    }
    _localGroups = [];
    _countableType = json['countable_type'];
    _stock = json['stock'] != null ? Stock.fromJson(json['stock']) : null;
    _countable = json['countable'] != null
        ? ProductData.fromJson(json['countable'])
        : null;
    if (json['addons'] != null) {
      _addons = [];
      json['addons'].forEach((v) {
        _addons?.add(AddonData.fromJson(v));
      });
    }
    if (json['addons'] != null) {
      _localAddons = [];
      json['addons'].forEach((v) {
        _localAddons?.add(AddonData.fromJson(v));
      });
    }
  }

  int? _id;
  int? _countableId;
  num? _price;
  num? _discount;
  int? _quantity;
  int? _cartCount;
  num? _tax;
  num? _totalPrice;
  ProductData? _product;
  List<Extras>? _extras;
  List<Group>? _localGroups;
  String? _countableType;
  Stock? _stock;
  ProductData? _countable;
  List<AddonData>? _addons;
  List<AddonData>? _localAddons;

  Stock copyWith({
    int? id,
    int? countableId,
    num? price,
    num? discount,
    int? quantity,
    int? cartCount,
    num? tax,
    num? totalPrice,
    ProductData? product,
    List<Extras>? extras,
    List<Group>? localGroups,
    bool isInitial = false,
    String? countableType,
    Stock? stock,
    ProductData? countable,
    List<AddonData>? addons,
    List<AddonData>? localAddons,
  }) =>
      Stock(
        id: id ?? _id,
        countableId: countableId ?? _countableId,
        price: isInitial ? num.tryParse('') : (price ?? _price),
        discount: isInitial ? num.tryParse('') : (discount ?? _discount),
        quantity: isInitial ? int.tryParse('') : (quantity ?? _quantity),
        cartCount: cartCount ?? _cartCount,
        tax: tax ?? _tax,
        totalPrice: totalPrice ?? _totalPrice,
        product: product ?? _product,
        extras: extras ?? _extras,
        localGroups: localGroups ?? _localGroups,
        countableType: countableType ?? _countableType,
        stock: stock ?? _stock,
        countable: countable ?? _countable,
        addons: addons ?? _addons,
        localAddons: localAddons ?? _localAddons,
      );

  int? get id => _id;

  int? get countableId => _countableId;

  num? get price => _price;

  num? get discount => _discount;

  int? get quantity => _quantity;

  int? get cartCount => _cartCount;

  num? get tax => _tax;

  num? get totalPrice => _totalPrice;

  ProductData? get product => _product;

  List<Extras>? get extras => _extras;

  List<Group>? get localGroups => _localGroups;

  String? get countableType => _countableType;

  Stock? get stock => _stock;

  ProductData? get countable => _countable;

  List<AddonData>? get addons => _addons;

  List<AddonData>? get localAddons => _localAddons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['countable_id'] = _countableId;
    map['price'] = _price;
    map['discount'] = _discount;
    map['quantity'] = _quantity;
    map['tax'] = _tax;
    map['total_price'] = _totalPrice;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    map['countable_type'] = _countableType;
    if (_stock != null) {
      map['stock'] = _stock?.toJson();
    }
    if (_countable != null) {
      map['countable'] = _countable?.toJson();
    }
    if (_addons != null) {
      map['addons'] = _addons?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AddonData {
  AddonData(
      {int? id,
      int? stockId,
      int? addonId,
      int? quantity,
      num? totalPrice,
      ProductData? product,
      Stock? stock}) {
    _id = id;
    _stockId = stockId;
    _addonId = addonId;
    _totalPrice = totalPrice;
    _quantity = quantity;
    _product = product;
    _stock = stock;
  }

  AddonData.fromJson(dynamic json) {
    _id = json['id'];
    _stockId = json['stock_id'];
    _addonId = json['addon_id'];
    _totalPrice = json["total_price"];
    _quantity = json["quantity"];
    _stock = json['stock'] != null ? Stock.fromJson(json['stock']) : null;
    _product =
        json['product'] != null ? ProductData.fromJson(json['product']) : null;
  }

  int? _id;
  int? _stockId;
  int? _addonId;
  int? _quantity;
  num? _totalPrice;
  ProductData? _product;
  Stock? _stock;

  AddonData copyWith({
    int? id,
    int? stockId,
    int? addonId,
    int? quantity,
    num? totalPrice,
    Stock? stock,
    ProductData? product,
  }) =>
      AddonData(
        id: id ?? _id,
        stockId: stockId ?? _stockId,
        addonId: addonId ?? _addonId,
        quantity: quantity ?? _quantity,
        totalPrice: totalPrice ?? _totalPrice,
        stock: stock ?? _stock,
        product: product ?? _product,
      );

  int? get id => _id;

  int? get stockId => _stockId;

  int? get addonId => _addonId;

  int? get quantity => _quantity;

  num? get totalPrice => _totalPrice;

  ProductData? get product => _product;

  Stock? get stock => _stock;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['stock_id'] = _stockId;
    map['addon_id'] = _addonId;
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }
}
