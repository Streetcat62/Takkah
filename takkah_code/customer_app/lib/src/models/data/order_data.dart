import 'user_data.dart';
import 'shop_data.dart';
import 'bonus_shop.dart';
import 'translation.dart';
import 'product_data.dart';
import 'currency_data.dart';

class OrderData {
  OrderData({
    int? id,
    int? userId,
    num? price,
    num? currencyPrice,
    num? rate,
    num? tax,
    num? commissionFee,
    num? deliveryFee,
    num? totalDiscount,
    int? orderDetailsCount,
    String? status,
    String? deliveryDate,
    String? deliveryTime,
    String? createdAt,
    String? updatedAt,
    int? refundID,
    ShopData? shop,
    CurrencyData? currency,
    UserData? user,
    UserData? deliveryman,
    BonusShop? bonusShop,
    DeliveryType? deliveryType,
    List<OrderDetail>? details,
  }) {
    _id = id;
    _userId = userId;
    _price = price;
    _currencyPrice = currencyPrice;
    _rate = rate;
    _tax = tax;
    _commissionFee = commissionFee;
    _deliveryFee = deliveryFee;
    _totalDiscount = totalDiscount;
    _orderDetailsCount = orderDetailsCount;
    _status = status;
    _deliveryDate = deliveryDate;
    _deliveryTime = deliveryTime;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _refundID = refundID;
    _shop = shop;
    _currency = currency;
    _user = user;
    _deliveryman = deliveryman;
    _bonusShop = bonusShop;
    _deliveryType = deliveryType;
    _details = details;
  }

  OrderData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _price = json['price'];
    _currencyPrice = json['currency_price'];
    _rate = json['rate'];
    _tax = json['tax'];
    _commissionFee = json['commission_fee'];
    _deliveryFee = json['delivery_fee'];
    _totalDiscount = json['total_discount'];
    _orderDetailsCount = json['order_details_count'];
    _status = json['status'];
    _deliveryDate = json['delivery_date'];
    _deliveryTime = json['delivery_time'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _refundID = json['refund']?['id'];
    _shop = json['shop'] != null ? ShopData.fromJson(json['shop']) : null;
    _currency = json['currency'] != null
        ? CurrencyData.fromJson(json['currency'])
        : null;
    _user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    _deliveryman = json['deliveryman'] != null
        ? UserData.fromJson(json['deliveryman'])
        : null;
    _bonusShop = json['bonus_shop'] != null
        ? BonusShop.fromJson(json['bonus_shop'])
        : null;
    _deliveryType = json['delivery_type'] != null
        ? DeliveryType.fromJson(json['delivery_type'])
        : null;
    if (json['details'] != null) {
      _details = [];
      json['details'].forEach((v) {
        _details?.add(OrderDetail.fromJson(v));
      });
    }
  }

  int? _id;
  int? _userId;
  num? _price;
  num? _currencyPrice;
  num? _rate;
  num? _tax;
  num? _commissionFee;
  num? _deliveryFee;
  num? _totalDiscount;
  int? _orderDetailsCount;
  String? _status;
  String? _deliveryDate;
  String? _deliveryTime;
  String? _createdAt;
  String? _updatedAt;
  int? _refundID;
  ShopData? _shop;
  CurrencyData? _currency;
  UserData? _user;
  UserData? _deliveryman;
  BonusShop? _bonusShop;
  DeliveryType? _deliveryType;
  List<OrderDetail>? _details;

  OrderData copyWith({
    int? id,
    int? userId,
    num? price,
    num? currencyPrice,
    num? rate,
    num? tax,
    num? commissionFee,
    num? deliveryFee,
    num? totalDiscount,
    int? orderDetailsCount,
    String? status,
    String? deliveryDate,
    String? deliveryTime,
    String? createdAt,
    String? updatedAt,
    int? refundID,
    ShopData? shop,
    CurrencyData? currency,
    UserData? user,
    UserData? deliveryman,
    BonusShop? bonusShop,
    DeliveryType? deliveryType,
    List<OrderDetail>? details,
  }) =>
      OrderData(
        id: id ?? _id,
        userId: userId ?? _userId,
        price: price ?? _price,
        currencyPrice: currencyPrice ?? _currencyPrice,
        rate: rate ?? _rate,
        tax: tax ?? _tax,
        commissionFee: commissionFee ?? _commissionFee,
        deliveryFee: deliveryFee ?? _deliveryFee,
        orderDetailsCount: orderDetailsCount ?? _orderDetailsCount,
        totalDiscount: totalDiscount ?? _totalDiscount,
        status: status ?? _status,
        deliveryDate: deliveryDate ?? _deliveryDate,
        deliveryTime: deliveryTime ?? _deliveryTime,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        refundID: refundID ?? _refundID,
        shop: shop ?? _shop,
        currency: currency ?? _currency,
        user: user ?? _user,
        deliveryman: deliveryman ?? _deliveryman,
        bonusShop: bonusShop ?? _bonusShop,
        deliveryType: deliveryType ?? _deliveryType,
        details: details ?? _details,
      );

  int? get id => _id;

  num? get userId => _userId;

  num? get price => _price;

  num? get currencyPrice => _currencyPrice;

  num? get rate => _rate;

  num? get tax => _tax;

  num? get commissionFee => _commissionFee;

  num? get deliveryFee => _deliveryFee;

  num? get totalDiscount => _totalDiscount;

  int? get orderDetailsCount => _orderDetailsCount;

  String? get status => _status;

  String? get deliveryDate => _deliveryDate;

  String? get deliveryTime => _deliveryTime;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get refundID => _refundID;

  ShopData? get shop => _shop;

  CurrencyData? get currency => _currency;

  UserData? get user => _user;

  UserData? get deliveryman => _deliveryman;

  BonusShop? get bonusShop => _bonusShop;

  DeliveryType? get deliveryType => _deliveryType;

  List<OrderDetail>? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['price'] = _price;
    map['currency_price'] = _currencyPrice;
    map['rate'] = _rate;
    map['order_details_count'] = _orderDetailsCount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_currency != null) {
      map['currency'] = _currency?.toJson();
    }
    if (_user != null) {
      map['user'] = _user?.toJson();
    }

    return map;
  }
}

class OrderDetail {
  OrderDetail({
    int? id,
    num? originPrice,
    num? totalPrice,
    num? tax,
    String? quantity,
    num? discount,
    String? createdAt,
    String? updatedAt,
    ProductData? shopProduct,
  }) {
    _id = id;
    _originPrice = originPrice;
    _totalPrice = totalPrice;
    _tax = tax;
    _quantity = quantity;
    _discount = discount;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _shopProduct = shopProduct;
  }

  OrderDetail.fromJson(dynamic json) {
    _id = json['id'];
    _originPrice = json['origin_price'];
    _totalPrice = json['total_price'];
    _tax = json['tax'];
    _quantity = json['quantity'];
    _discount = json['discount'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _shopProduct = json['shopProduct'] != null
        ? ProductData.fromJson(json['shopProduct'])
        : null;
  }

  int? _id;
  num? _originPrice;
  num? _totalPrice;
  num? _tax;
  String? _quantity;
  num? _discount;
  String? _createdAt;
  String? _updatedAt;
  ProductData? _shopProduct;

  OrderDetail copyWith({
    int? id,
    num? originPrice,
    num? totalPrice,
    num? tax,
    String? quantity,
    num? discount,
    String? createdAt,
    String? updatedAt,
    ProductData? shopProduct,
  }) =>
      OrderDetail(
        id: id ?? _id,
        originPrice: originPrice ?? _originPrice,
        totalPrice: totalPrice ?? _totalPrice,
        tax: tax ?? _tax,
        quantity: quantity ?? _quantity,
        discount: discount ?? _discount,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        shopProduct: shopProduct ?? _shopProduct,
      );

  int? get id => _id;

  num? get originPrice => _originPrice;

  num? get totalPrice => _totalPrice;

  num? get tax => _tax;

  String? get quantity => _quantity;

  num? get discount => _discount;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  ProductData? get shopProduct => _shopProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['origin_price'] = _originPrice;
    map['total_price'] = _totalPrice;
    map['tax'] = _tax;
    map['quantity'] = _quantity;
    map['discount'] = _discount;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_shopProduct != null) {
      map['shopProduct'] = _shopProduct?.toJson();
    }
    return map;
  }
}

class DeliveryType {
  DeliveryType({
    int? id,
    int? shopId,
    String? type,
    num? price,
    List<String>? times,
    String? note,
    bool? active,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) {
    _id = id;
    _shopId = shopId;
    _type = type;
    _price = price;
    _times = times;
    _note = note;
    _active = active;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _translation = translation;
  }

  DeliveryType.fromJson(dynamic json) {
    _id = json['id'];
    _shopId = json['shop_id'];
    _type = json['type'];
    _price = json['price'];
    _times = json['times'] != null ? json['times'].cast<String>() : [];
    _note = json['note'];
    _active = json['active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  int? _shopId;
  String? _type;
  num? _price;
  List<String>? _times;
  String? _note;
  bool? _active;
  String? _createdAt;
  String? _updatedAt;
  Translation? _translation;

  DeliveryType copyWith({
    int? id,
    int? shopId,
    String? type,
    num? price,
    List<String>? times,
    String? note,
    bool? active,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) =>
      DeliveryType(
        id: id ?? _id,
        shopId: shopId ?? _shopId,
        type: type ?? _type,
        price: price ?? _price,
        times: times ?? _times,
        note: note ?? _note,
        active: active ?? _active,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  int? get shopId => _shopId;

  String? get type => _type;

  num? get price => _price;

  List<String>? get times => _times;

  String? get note => _note;

  bool? get active => _active;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shop_id'] = _shopId;
    map['type'] = _type;
    map['price'] = _price;
    map['times'] = _times;
    map['note'] = _note;
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}
