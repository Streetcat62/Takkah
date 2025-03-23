import '../data/bonus_shop.dart';
import '../data/product_data.dart';

class CartCalculateResponse {
  CartCalculateResponse({CartCalculateData? data}) {
    _data = data;
  }

  CartCalculateResponse.fromJson(dynamic json) {
    _data =
        json['data'] != null ? CartCalculateData.fromJson(json['data']) : null;
  }

  CartCalculateData? _data;

  CartCalculateResponse copyWith({CartCalculateData? data}) =>
      CartCalculateResponse(data: data ?? _data);

  CartCalculateData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class CartCalculateData {
  CartCalculateData({
    List<ProductData>? products,
    num? productTax,
    num? productTotal,
    num? orderTax,
    num? orderTotal,
    num? totalDiscount,
    List<BonusShop>? bonusShop,
  }) {
    _products = products;
    _productTax = productTax;
    _productTotal = productTotal;
    _orderTax = orderTax;
    _orderTotal = orderTotal;
    _totalDiscount = totalDiscount;
    _bonusShop = bonusShop;
  }

  CartCalculateData.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ProductData.fromJson(v));
      });
    }
    _productTax = json['product_tax'];
    _productTotal = json['product_total'];
    _orderTax = json['order_tax'];
    _orderTotal = json['order_total'];
    _totalDiscount = json['total_discount'];
    if (json['bonus_shop'] != null) {
      _bonusShop = [];
      json['bonus_shop'].forEach((v) {
        _bonusShop?.add(BonusShop.fromJson(v));
      });
    }
  }

  List<ProductData>? _products;
  num? _productTax;
  num? _productTotal;
  num? _orderTax;
  num? _orderTotal;
  num? _totalDiscount;
  List<BonusShop>? _bonusShop;

  CartCalculateData copyWith({
    List<ProductData>? products,
    num? productTax,
    num? productTotal,
    num? orderTax,
    num? orderTotal,
    num? totalDiscount,
    List<BonusShop>? bonusShop,
  }) =>
      CartCalculateData(
        products: products ?? _products,
        productTax: productTax ?? _productTax,
        productTotal: productTotal ?? _productTotal,
        orderTax: orderTax ?? _orderTax,
        orderTotal: orderTotal ?? _orderTotal,
        totalDiscount: totalDiscount ?? _totalDiscount,
        bonusShop: bonusShop ?? _bonusShop,
      );

  List<ProductData>? get products => _products;

  num? get productTax => _productTax;

  num? get productTotal => _productTotal;

  num? get orderTax => _orderTax;

  num? get orderTotal => _orderTotal;

  num? get totalDiscount => _totalDiscount;

  List<BonusShop>? get bonusShop => _bonusShop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['product_tax'] = _productTax;
    map['product_total'] = _productTotal;
    map['order_tax'] = _orderTax;
    map['order_total'] = _orderTotal;
    map['total_discount'] = _totalDiscount;
    if (_bonusShop != null) {
      map['bonus_shop'] = _bonusShop?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
