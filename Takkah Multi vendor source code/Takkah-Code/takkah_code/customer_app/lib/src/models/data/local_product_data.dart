class LocalProductData {
  LocalProductData({int? productId, int? shopId}) {
    _productId = productId;
    _shopId = shopId;
  }

  LocalProductData.fromJson(dynamic json) {
    _productId = json['product_id'];
    _shopId = json['shop_id'];
  }

  int? _productId;
  int? _shopId;

  LocalProductData copyWith({int? productId, int? shopId}) => LocalProductData(
        productId: productId ?? _productId,
        shopId: shopId ?? _shopId,
      );

  int? get productId => _productId;

  int? get shopId => _shopId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['shop_id'] = _shopId;
    return map;
  }
}
