import 'shop_data.dart';
import 'review_data.dart';
import 'single_product.dart';

class ProductData {
  ProductData({
    int? id,
    String? uuid,
    int? minQty,
    int? maxQty,
    int? active,
    int? quantity,
    int? qty,
    String? createdAt,
    String? updatedAt,
    num? price,
    num? discount,
    num? tax,
    num? shopTax,
    num? priceWithoutTax,
    num? totalPrice,
    int? shopId,
    dynamic ordersCount,
    num? ratingAvg,
    int? reviewsCount,
    Map<String, dynamic>? ratingPercent,
    List<ReviewData>? reviews,
    SingleProduct? product,
    ShopData? shop,
    // bool? isChoosing,
    int? cartCount,
    int? localCartCount,
    bool? isLoading,
    Bonus? bonus,
  }) {
    _id = id;
    _uuid = uuid;
    _minQty = minQty;
    _maxQty = maxQty;
    _active = active;
    _quantity = quantity;
    _qty = qty;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _price = price;
    _discount = discount;
    _tax = tax;
    _shopTax = shopTax;
    _priceWithoutTax = priceWithoutTax;
    _totalPrice = totalPrice;
    _shopId = shopId;
    _ordersCount = ordersCount;
    _ratingAvg = ratingAvg;
    _reviewsCount = reviewsCount;
    _ratingPercent = ratingPercent;
    _reviews = reviews;
    _product = product;
    _shop = shop;
    // _isChoosing = isChoosing;
    _cartCount = cartCount;
    _localCartCount = localCartCount;
    _isLoading = isLoading;
    _bonus = bonus;
  }

  ProductData.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _minQty = json['min_qty'];
    _maxQty = json['max_qty'];
    _active = json['active'];
    _quantity = json['quantity'];
    _qty = json['qty'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _price = json['price'];
    _discount = json['discount'];
    _tax = json['tax'];
    _shopTax = json['shop_tax'];
    _priceWithoutTax = json['price_without_tax'];
    _totalPrice = json['total_price'];
    _shopId = json['shop_id'];
    _ordersCount = json['orders_count'];
    _ratingAvg = json['rating_avg'];
    _reviewsCount = json['reviews_count'];
    _ratingPercent = json['rating_percent'];
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(ReviewData.fromJson(v));
      });
    }
    _product = json['product'] != null
        ? SingleProduct.fromJson(json['product'])
        : null;
    _shop = json['shop'] != null ? ShopData.fromJson(json['shop']) : null;
    // _isChoosing = false;
    _cartCount = 0;
    _localCartCount = 0;
    _isLoading = false;
    _bonus = (json['bonus'] != null && json['bonus'].runtimeType is bool)
        ? Bonus.fromJson(json['bonus'])
        : null;
  }

  int? _id;
  String? _uuid;
  int? _minQty;
  int? _maxQty;
  int? _active;
  int? _quantity;
  int? _qty;
  num? _price;
  num? _discount;
  String? _createdAt;
  String? _updatedAt;
  num? _tax;
  num? _shopTax;
  num? _priceWithoutTax;
  num? _totalPrice;
  int? _shopId;
  dynamic _ordersCount;
  num? _ratingAvg;
  int? _reviewsCount;
  Map<String, dynamic>? _ratingPercent;
  List<ReviewData>? _reviews;
  SingleProduct? _product;
  ShopData? _shop;

  // bool? _isChoosing;
  int? _cartCount;
  int? _localCartCount;
  bool? _isLoading;
  Bonus? _bonus;

  ProductData copyWith({
    int? id,
    String? uuid,
    int? minQty,
    int? maxQty,
    int? active,
    int? quantity,
    int? qty,
    String? createdAt,
    String? updatedAt,
    num? price,
    num? discount,
    num? tax,
    num? shopTax,
    num? priceWithoutTax,
    num? totalPrice,
    int? shopId,
    dynamic ordersCount,
    num? ratingAvg,
    int? reviewsCount,
    Map<String, dynamic>? ratingPercent,
    List<ReviewData>? reviews,
    SingleProduct? product,
    ShopData? shop,
    // bool? isChoosing,
    int? cartCount,
    int? localCartCount,
    bool? isLoading,
    Bonus? bonus,
  }) =>
      ProductData(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        minQty: minQty ?? _minQty,
        maxQty: maxQty ?? _maxQty,
        active: active ?? _active,
        quantity: quantity ?? _quantity,
        qty: qty ?? _qty,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        price: price ?? _price,
        discount: discount ?? _discount,
        tax: tax ?? _tax,
        shopTax: shopTax ?? _shopTax,
        priceWithoutTax: priceWithoutTax ?? _priceWithoutTax,
        totalPrice: totalPrice ?? _totalPrice,
        shopId: shopId ?? _shopId,
        ordersCount: ordersCount ?? _ordersCount,
        ratingAvg: ratingAvg ?? _ratingAvg,
        reviewsCount: reviewsCount ?? _reviewsCount,
        ratingPercent: ratingPercent ?? _ratingPercent,
        reviews: reviews ?? _reviews,
        product: product ?? _product,
        shop: shop ?? _shop,
        // isChoosing: isChoosing ?? _isChoosing,
        cartCount: cartCount ?? _cartCount,
        localCartCount: localCartCount ?? _localCartCount,
        isLoading: isLoading ?? _isLoading,
        bonus: bonus ?? _bonus,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  int? get minQty => _minQty;

  int? get maxQty => _maxQty;

  int? get active => _active;

  int? get quantity => _quantity;

  int? get qty => _qty;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get price => _price;

  num? get discount => _discount;

  num? get tax => _tax;

  num? get shopTax => _shopTax;

  num? get priceWithoutTax => _priceWithoutTax;

  num? get totalPrice => _totalPrice;

  int? get shopId => _shopId;

  dynamic get ordersCount => _ordersCount;

  num? get ratingAvg => _ratingAvg;

  int? get reviewsCount => _reviewsCount;

  Map<String, dynamic>? get ratingPercent => _ratingPercent;

  List<ReviewData>? get reviews => _reviews;

  SingleProduct? get product => _product;

  ShopData? get shop => _shop;

  // bool? get isChoosing => _isChoosing;

  int? get cartCount => _cartCount;

  int? get localCartCount => _localCartCount;

  bool? get isLoading => _isLoading;

  Bonus? get bonus => _bonus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['min_qty'] = _minQty;
    map['max_qty'] = _maxQty;
    map['active'] = _active;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['discount'] = _discount;
    map['tax'] = _tax;
    map['shop_id'] = _shopId;
    map['orders_count'] = _ordersCount;
    map['rating_avg'] = _ratingAvg;
    map['reviews_count'] = _reviewsCount;
    map['rating_percent'] = _ratingPercent;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    if (_shop != null) {
      map['shop'] = _shop?.toJson();
    }
    if (_bonus != null) {
      map['bonus'] = _bonus?.toJson();
    }
    return map;
  }
}

class Bonus {
  Bonus({
    int? id,
    int? shopProductId,
    int? bonusProductId,
    int? bonusQuantity,
    int? shopProductQuantity,
    bool? status,
    String? expiredAt,
    String? createdAt,
    ProductData? bonusProduct,
  }) {
    _id = id;
    _shopProductId = shopProductId;
    _bonusProductId = bonusProductId;
    _bonusQuantity = bonusQuantity;
    _shopProductQuantity = shopProductQuantity;
    _status = status;
    _expiredAt = expiredAt;
    _createdAt = createdAt;
    _bonusProduct = bonusProduct;
  }

  Bonus.fromJson(dynamic json) {
    _id = json['id'];
    _shopProductId = json['shop_product_id'];
    _bonusProductId = json['bonus_product_id'];
    _bonusQuantity = json['bonus_quantity'];
    _shopProductQuantity = json['shop_product_quantity'];
    _status = json['status'];
    _expiredAt = json['expired_at'];
    _createdAt = json['created_at'];
    _bonusProduct = json['bonus_product'] != null
        ? ProductData.fromJson(json['bonus_product'])
        : null;
  }

  int? _id;
  int? _shopProductId;
  int? _bonusProductId;
  int? _bonusQuantity;
  int? _shopProductQuantity;
  bool? _status;
  String? _expiredAt;
  String? _createdAt;
  ProductData? _bonusProduct;

  Bonus copyWith({
    int? id,
    int? shopProductId,
    int? bonusProductId,
    int? bonusQuantity,
    int? shopProductQuantity,
    bool? status,
    String? expiredAt,
    String? createdAt,
    ProductData? bonusProduct,
  }) =>
      Bonus(
        id: id ?? _id,
        shopProductId: shopProductId ?? _shopProductId,
        bonusProductId: bonusProductId ?? _bonusProductId,
        bonusQuantity: bonusQuantity ?? _bonusQuantity,
        shopProductQuantity: shopProductQuantity ?? _shopProductQuantity,
        status: status ?? _status,
        expiredAt: expiredAt ?? _expiredAt,
        createdAt: createdAt ?? _createdAt,
        bonusProduct: bonusProduct ?? _bonusProduct,
      );

  int? get id => _id;

  int? get shopProductId => _shopProductId;

  int? get bonusProductId => _bonusProductId;

  int? get bonusQuantity => _bonusQuantity;

  int? get shopProductQuantity => _shopProductQuantity;

  bool? get status => _status;

  String? get expiredAt => _expiredAt;

  String? get createdAt => _createdAt;

  ProductData? get bonusProduct => _bonusProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shop_product_id'] = _shopProductId;
    map['bonus_product_id'] = _bonusProductId;
    map['bonus_quantity'] = _bonusQuantity;
    map['shop_product_quantity'] = _shopProductQuantity;
    map['status'] = _status;
    map['expired_at'] = _expiredAt;
    map['created_at'] = _createdAt;
    if (_bonusProduct != null) {
      map['bonus_product'] = _bonusProduct?.toJson();
    }
    return map;
  }
}
