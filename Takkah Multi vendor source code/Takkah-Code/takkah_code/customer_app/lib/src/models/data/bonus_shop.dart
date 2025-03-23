import 'product_data.dart';

class BonusShop {
  BonusShop({
    int? id,
    int? shopId,
    int? bonusProductId,
    int? bonusQuantity,
    int? orderAmount,
    String? createdAt,
    String? updatedAt,
    String? expiredAt,
    ProductData? shopProduct,
  }) {
    _id = id;
    _shopId = shopId;
    _bonusProductId = bonusProductId;
    _bonusQuantity = bonusQuantity;
    _orderAmount = orderAmount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _expiredAt = expiredAt;
    _shopProduct = shopProduct;
  }

  BonusShop.fromJson(dynamic json) {
    _id = json['id'];
    _shopId = json['shop_id'];
    _bonusProductId = json['bonus_product_id'];
    _bonusQuantity = json['bonus_quantity'];
    _orderAmount = json['order_amount'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _expiredAt = json['expired_at'];
    _shopProduct = json['shop_product'] != null
        ? ProductData.fromJson(json['shop_product'])
        : null;
  }

  int? _id;
  int? _shopId;
  int? _bonusProductId;
  int? _bonusQuantity;
  int? _orderAmount;
  String? _createdAt;
  String? _updatedAt;
  String? _expiredAt;
  ProductData? _shopProduct;

  BonusShop copyWith({
    int? id,
    int? shopId,
    int? bonusProductId,
    int? bonusQuantity,
    int? orderAmount,
    String? createdAt,
    String? updatedAt,
    String? expiredAt,
    ProductData? shopProduct,
  }) =>
      BonusShop(
        id: id ?? _id,
        shopId: shopId ?? _shopId,
        bonusProductId: bonusProductId ?? _bonusProductId,
        bonusQuantity: bonusQuantity ?? _bonusQuantity,
        orderAmount: orderAmount ?? _orderAmount,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        expiredAt: expiredAt ?? _expiredAt,
        shopProduct: shopProduct ?? _shopProduct,
      );

  int? get id => _id;

  int? get shopId => _shopId;

  int? get bonusProductId => _bonusProductId;

  int? get bonusQuantity => _bonusQuantity;

  int? get orderAmount => _orderAmount;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get expiredAt => _expiredAt;

  ProductData? get shopProduct => _shopProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shop_id'] = _shopId;
    map['bonus_product_id'] = _bonusProductId;
    map['bonus_quantity'] = _bonusQuantity;
    map['order_amount'] = _orderAmount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['expired_at'] = _expiredAt;
    if (_shopProduct != null) {
      map['shop_product'] = _shopProduct?.toJson();
    }
    return map;
  }
}
