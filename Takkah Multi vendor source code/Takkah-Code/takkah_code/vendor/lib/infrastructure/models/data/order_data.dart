import 'package:venderfoodyman/infrastructure/models/data/user_data.dart';

class OrderData {
  int? id;
  num? userId;
  num? price;
  num? rate;
  num? tax;
  num? commissionFee;
  String? status;
  num? deliveryFee;
  DateTime? deliveryDate;
  num? totalDiscount;
  num? orderDetailsCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? km;
  Shop? shop;
  Currency? currency;
  UserData? user;
  List<Detail>? details;
  Transaction? transaction;
  DeliveryAddress? deliveryAddress;
  dynamic deliveryman;
  DeliveryTypeModel? deliveryType;
  dynamic coupon;
  dynamic bonusShop;
  dynamic branch;

  OrderData({
    this.id,
    this.userId,
    this.price,
    this.rate,
    this.tax,
    this.commissionFee,
    this.status,
    this.deliveryFee,
    this.deliveryDate,
    this.totalDiscount,
    this.orderDetailsCount,
    this.createdAt,
    this.updatedAt,
    this.km,
    this.shop,
    this.currency,
    this.user,
    this.details,
    this.transaction,
    this.deliveryAddress,
    this.deliveryman,
    this.deliveryType,
    this.coupon,
    this.bonusShop,
    this.branch,
  });

  OrderData copyWith({
    int? id,
    num? userId,
    num? price,
    num? rate,
    num? tax,
    num? commissionFee,
    String? status,
    num? deliveryFee,
    DateTime? deliveryDate,
    num? totalDiscount,
    num? orderDetailsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    num? km,
    Shop? shop,
    Currency? currency,
    UserData? user,
    List<Detail>? details,
    Transaction? transaction,
    DeliveryAddress? deliveryAddress,
    dynamic deliveryman,
    DeliveryTypeModel? deliveryType,
    dynamic coupon,
    dynamic bonusShop,
    dynamic branch,
  }) =>
      OrderData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        price: price ?? this.price,
        rate: rate ?? this.rate,
        tax: tax ?? this.tax,
        commissionFee: commissionFee ?? this.commissionFee,
        status: status ?? this.status,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        orderDetailsCount: orderDetailsCount ?? this.orderDetailsCount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        km: km ?? this.km,
        shop: shop ?? this.shop,
        currency: currency ?? this.currency,
        user: user ?? this.user,
        details: details ?? this.details,
        transaction: transaction ?? this.transaction,
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
        deliveryman: deliveryman ?? this.deliveryman,
        deliveryType: deliveryType ?? this.deliveryType,
        coupon: coupon ?? this.coupon,
        bonusShop: bonusShop ?? this.bonusShop,
        branch: branch ?? this.branch,
      );

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        id: json["id"],
        userId: json["user_id"],
        price: json["price"],
        rate: json["rate"],
        tax: json["tax"],
        commissionFee: json["commission_fee"],
        status: json["status"],
        deliveryFee: json["delivery_fee"],
        deliveryDate: json["delivery_date"] == null
            ? null
            : DateTime.parse(json["delivery_date"]),
        totalDiscount: json["total_discount"],
        orderDetailsCount: json["order_details_count"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        km: json["km"],
        shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(json["currency"]),
        user: json["user"] == null ? null : UserData.fromJson(json["user"]),
        details: json["details"] == null
            ? []
            : List<Detail>.from(
                json["details"]!.map((x) => Detail.fromJson(x))),
        transaction: json["transaction"] == null
            ? null
            : Transaction.fromJson(json["transaction"]),
        deliveryAddress: json["delivery_address"] == null
            ? null
            : DeliveryAddress.fromJson(json["delivery_address"]),
        deliveryman: json["deliveryman"],
        deliveryType: json["delivery_type"] == null
            ? null
            : DeliveryTypeModel.fromJson(json["delivery_type"]),
        coupon: json["coupon"],
        bonusShop: json["bonus_shop"],
        branch: json["branch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "price": price,
        "rate": rate,
        "tax": tax,
        "commission_fee": commissionFee,
        "status": status,
        "delivery_fee": deliveryFee,
        "delivery_date":
            "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
        "total_discount": totalDiscount,
        "order_details_count": orderDetailsCount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "km": km,
        "shop": shop?.toJson(),
        "currency": currency?.toJson(),
        "user": user?.toJson(),
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
        "transaction": transaction?.toJson(),
        "delivery_address": deliveryAddress?.toJson(),
        "deliveryman": deliveryman,
        "delivery_type": deliveryType?.toJson(),
        "coupon": coupon,
        "bonus_shop": bonusShop,
        "branch": branch,
      };
}

class Currency {
  int? id;
  String? symbol;
  String? title;
  dynamic position;

  Currency({
    this.id,
    this.symbol,
    this.title,
    this.position,
  });

  Currency copyWith({
    int? id,
    String? symbol,
    String? title,
    dynamic position,
  }) =>
      Currency(
        id: id ?? this.id,
        symbol: symbol ?? this.symbol,
        title: title ?? this.title,
        position: position ?? this.position,
      );

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        symbol: json["symbol"],
        title: json["title"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "title": title,
        "position": position,
      };
}

class DeliveryAddress {
  int? id;
  String? title;
  String? address;
  Location? location;
  bool? deliveryAddressDefault;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  DeliveryAddress({
    this.id,
    this.title,
    this.address,
    this.location,
    this.deliveryAddressDefault,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  DeliveryAddress copyWith({
    int? id,
    String? title,
    String? address,
    Location? location,
    bool? deliveryAddressDefault,
    bool? active,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      DeliveryAddress(
        id: id ?? this.id,
        title: title ?? this.title,
        address: address ?? this.address,
        location: location ?? this.location,
        deliveryAddressDefault:
            deliveryAddressDefault ?? this.deliveryAddressDefault,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      DeliveryAddress(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        deliveryAddressDefault: json["default"],
        active: json["active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "location": location?.toJson(),
        "default": deliveryAddressDefault,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Location {
  String? latitude;
  String? longitude;

  Location({
    this.latitude,
    this.longitude,
  });

  Location copyWith({
    String? latitude,
    String? longitude,
  }) =>
      Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class DeliveryTypeModel {
  int? id;
  num? shopId;
  String? type;
  num? price;
  List<String>? times;
  String? note;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  DeliveryTypeTranslation? translation;

  DeliveryTypeModel({
    this.id,
    this.shopId,
    this.type,
    this.price,
    this.times,
    this.note,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.translation,
  });

  DeliveryTypeModel copyWith({
    int? id,
    num? shopId,
    String? type,
    num? price,
    List<String>? times,
    String? note,
    bool? active,
    DateTime? createdAt,
    DateTime? updatedAt,
    DeliveryTypeTranslation? translation,
  }) =>
      DeliveryTypeModel(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        type: type ?? this.type,
        price: price ?? this.price,
        times: times ?? this.times,
        note: note ?? this.note,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        translation: translation ?? this.translation,
      );

  factory DeliveryTypeModel.fromJson(Map<String, dynamic> json) =>
      DeliveryTypeModel(
        id: json["id"],
        shopId: json["shop_id"],
        type: json["type"],
        price: json["price"],
        times: json["times"] == null
            ? []
            : List<String>.from(json["times"]!.map((x) => x)),
        note: json["note"],
        active: json["active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        translation: json["translation"] == null
            ? null
            : DeliveryTypeTranslation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "type": type,
        "price": price,
        "times": times == null ? [] : List<dynamic>.from(times!.map((x) => x)),
        "note": note,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
      };
}

class DeliveryTypeTranslation {
  num? id;
  String? locale;
  String? title;

  DeliveryTypeTranslation({
    this.id,
    this.locale,
    this.title,
  });

  DeliveryTypeTranslation copyWith({
    num? id,
    String? locale,
    String? title,
  }) =>
      DeliveryTypeTranslation(
        id: id ?? this.id,
        locale: locale ?? this.locale,
        title: title ?? this.title,
      );

  factory DeliveryTypeTranslation.fromJson(Map<String, dynamic> json) =>
      DeliveryTypeTranslation(
        id: json["id"],
        locale: json["locale"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "locale": locale,
        "title": title,
      };
}

class Detail {
  num? id;
  num? originPrice;
  num? totalPrice;
  num? bonus;
  num? tax;
  String? quantity;
  num? discount;
  DateTime? createdAt;
  DateTime? updatedAt;
  ShopProduct? shopProduct;

  Detail({
    this.id,
    this.originPrice,
    this.totalPrice,
    this.bonus,
    this.tax,
    this.quantity,
    this.discount,
    this.createdAt,
    this.updatedAt,
    this.shopProduct,
  });

  Detail copyWith({
    num? id,
    num? originPrice,
    num? totalPrice,
    num? bonus,
    num? tax,
    String? quantity,
    num? discount,
    DateTime? createdAt,
    DateTime? updatedAt,
    ShopProduct? shopProduct,
  }) =>
      Detail(
        id: id ?? this.id,
        originPrice: originPrice ?? this.originPrice,
        totalPrice: totalPrice ?? this.totalPrice,
        bonus: bonus ?? this.bonus,
        tax: tax ?? this.tax,
        quantity: quantity ?? this.quantity,
        discount: discount ?? this.discount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        shopProduct: shopProduct ?? this.shopProduct,
      );

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        originPrice: json["origin_price"],
        totalPrice: json["total_price"],
        bonus: json["bonus"],
        tax: json["tax"],
        quantity: json["quantity"],
        discount: json["discount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        shopProduct: json["shopProduct"] == null
            ? null
            : ShopProduct.fromJson(json["shopProduct"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "origin_price": originPrice,
        "total_price": totalPrice,
        "bonus": bonus,
        "tax": tax,
        "quantity": quantity,
        "discount": discount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shopProduct": shopProduct?.toJson(),
      };
}

class ShopProduct {
  num? id;
  String? uuid;
  num? minQty;
  num? maxQty;
  num? active;
  num? quantity;
  num? price;
  num? tax;
  num? shopId;
  dynamic ordersCount;
  dynamic ratingAvg;
  Product? product;

  ShopProduct({
    this.id,
    this.uuid,
    this.minQty,
    this.maxQty,
    this.active,
    this.quantity,
    this.price,
    this.tax,
    this.shopId,
    this.ordersCount,
    this.ratingAvg,
    this.product,
  });

  ShopProduct copyWith({
    num? id,
    String? uuid,
    num? minQty,
    num? maxQty,
    num? active,
    num? quantity,
    num? price,
    num? tax,
    num? shopId,
    dynamic ordersCount,
    dynamic ratingAvg,
    Product? product,
  }) =>
      ShopProduct(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        minQty: minQty ?? this.minQty,
        maxQty: maxQty ?? this.maxQty,
        active: active ?? this.active,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        tax: tax ?? this.tax,
        shopId: shopId ?? this.shopId,
        ordersCount: ordersCount ?? this.ordersCount,
        ratingAvg: ratingAvg ?? this.ratingAvg,
        product: product ?? this.product,
      );

  factory ShopProduct.fromJson(Map<String, dynamic> json) => ShopProduct(
        id: json["id"],
        uuid: json["uuid"],
        minQty: json["min_qty"],
        maxQty: json["max_qty"],
        active: json["active"],
        quantity: json["quantity"],
        price: json["price"],
        tax: json["tax"],
        shopId: json["shop_id"],
        ordersCount: json["orders_count"],
        ratingAvg: json["rating_avg"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "min_qty": minQty,
        "max_qty": maxQty,
        "active": active,
        "quantity": quantity,
        "price": price,
        "tax": tax,
        "shop_id": shopId,
        "orders_count": ordersCount,
        "rating_avg": ratingAvg,
        "product": product?.toJson(),
      };
}

class Product {
  num? id;
  String? uuid;
  num? categoryId;
  dynamic keywords;
  num? brandId;
  String? img;
  String? qrCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  DeliveryTypeTranslation? translation;
  Unit? unit;

  Product({
    this.id,
    this.uuid,
    this.categoryId,
    this.keywords,
    this.brandId,
    this.img,
    this.qrCode,
    this.createdAt,
    this.updatedAt,
    this.translation,
    this.unit,
  });

  Product copyWith({
    num? id,
    String? uuid,
    num? categoryId,
    dynamic keywords,
    num? brandId,
    String? img,
    String? qrCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    DeliveryTypeTranslation? translation,
    Unit? unit,
  }) =>
      Product(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        categoryId: categoryId ?? this.categoryId,
        keywords: keywords ?? this.keywords,
        brandId: brandId ?? this.brandId,
        img: img ?? this.img,
        qrCode: qrCode ?? this.qrCode,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        translation: translation ?? this.translation,
        unit: unit ?? this.unit,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        uuid: json["uuid"],
        categoryId: json["category_id"],
        keywords: json["keywords"],
        brandId: json["brand_id"],
        img: json["img"],
        qrCode: json["qr_code"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        translation: json["translation"] == null
            ? null
            : DeliveryTypeTranslation.fromJson(json["translation"]),
        unit: json["unit"] == null ? null : Unit.fromJson(json["unit"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "category_id": categoryId,
        "keywords": keywords,
        "brand_id": brandId,
        "img": img,
        "qr_code": qrCode,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
        "unit": unit?.toJson(),
      };
}

class Unit {
  num? id;
  bool? active;
  String? position;
  DateTime? createdAt;
  DateTime? updatedAt;
  DeliveryTypeTranslation? translation;

  Unit({
    this.id,
    this.active,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.translation,
  });

  Unit copyWith({
    num? id,
    bool? active,
    String? position,
    DateTime? createdAt,
    DateTime? updatedAt,
    DeliveryTypeTranslation? translation,
  }) =>
      Unit(
        id: id ?? this.id,
        active: active ?? this.active,
        position: position ?? this.position,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        translation: translation ?? this.translation,
      );

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"],
        active: json["active"],
        position: json["position"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        translation: json["translation"] == null
            ? null
            : DeliveryTypeTranslation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "position": position,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
      };
}

class Shop {
  num? id;
  String? uuid;
  num? userId;
  num? tax;
  num? percentage;
  Location? location;
  num? price;
  num? pricePerKm;
  String? phone;
  bool? open;
  bool? visibility;
  String? backgroundImg;
  String? logoImg;
  num? minAmount;
  String? status;
  DeliveryTime? deliveryTime;
  String? inviteLink;
  DateTime? createdAt;
  DateTime? updatedAt;
  ShopTranslation? translation;

  Shop({
    this.id,
    this.uuid,
    this.userId,
    this.tax,
    this.percentage,
    this.location,
    this.price,
    this.pricePerKm,
    this.phone,
    this.open,
    this.visibility,
    this.backgroundImg,
    this.logoImg,
    this.minAmount,
    this.status,
    this.deliveryTime,
    this.inviteLink,
    this.createdAt,
    this.updatedAt,
    this.translation,
  });

  Shop copyWith({
    num? id,
    String? uuid,
    num? userId,
    num? tax,
    num? percentage,
    Location? location,
    num? price,
    num? pricePerKm,
    String? phone,
    bool? open,
    bool? visibility,
    String? backgroundImg,
    String? logoImg,
    num? minAmount,
    String? status,
    DeliveryTime? deliveryTime,
    String? inviteLink,
    DateTime? createdAt,
    DateTime? updatedAt,
    ShopTranslation? translation,
  }) =>
      Shop(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        userId: userId ?? this.userId,
        tax: tax ?? this.tax,
        percentage: percentage ?? this.percentage,
        location: location ?? this.location,
        price: price ?? this.price,
        pricePerKm: pricePerKm ?? this.pricePerKm,
        phone: phone ?? this.phone,
        open: open ?? this.open,
        visibility: visibility ?? this.visibility,
        backgroundImg: backgroundImg ?? this.backgroundImg,
        logoImg: logoImg ?? this.logoImg,
        minAmount: minAmount ?? this.minAmount,
        status: status ?? this.status,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        inviteLink: inviteLink ?? this.inviteLink,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        translation: translation ?? this.translation,
      );

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        uuid: json["uuid"],
        userId: json["user_id"],
        tax: json["tax"],
        percentage: json["percentage"],
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        price: json["price"],
        pricePerKm: json["price_per_km"],
        phone: json["phone"],
        open: json["open"],
        visibility: json["visibility"],
        backgroundImg: json["background_img"],
        logoImg: json["logo_img"],
        minAmount: json["min_amount"],
        status: json["status"],
        deliveryTime: json["delivery_time"] == null
            ? null
            : DeliveryTime.fromJson(json["delivery_time"]),
        inviteLink: json["invite_link"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        translation: json["translation"] == null
            ? null
            : ShopTranslation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "user_id": userId,
        "tax": tax,
        "percentage": percentage,
        "location": location?.toJson(),
        "price": price,
        "price_per_km": pricePerKm,
        "phone": phone,
        "open": open,
        "visibility": visibility,
        "background_img": backgroundImg,
        "logo_img": logoImg,
        "min_amount": minAmount,
        "status": status,
        "delivery_time": deliveryTime?.toJson(),
        "invite_link": inviteLink,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
      };
}

class DeliveryTime {
  String? to;
  String? from;
  String? type;

  DeliveryTime({
    this.to,
    this.from,
    this.type,
  });

  DeliveryTime copyWith({
    String? to,
    String? from,
    String? type,
  }) =>
      DeliveryTime(
        to: to ?? this.to,
        from: from ?? this.from,
        type: type ?? this.type,
      );

  factory DeliveryTime.fromJson(Map<String, dynamic> json) => DeliveryTime(
        to: json["to"],
        from: json["from"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "to": to,
        "from": from,
        "type": type,
      };
}

class ShopTranslation {
  num? id;
  String? locale;
  String? title;
  String? description;
  String? address;

  ShopTranslation({
    this.id,
    this.locale,
    this.title,
    this.description,
    this.address,
  });

  ShopTranslation copyWith({
    num? id,
    String? locale,
    String? title,
    String? description,
    String? address,
  }) =>
      ShopTranslation(
        id: id ?? this.id,
        locale: locale ?? this.locale,
        title: title ?? this.title,
        description: description ?? this.description,
        address: address ?? this.address,
      );

  factory ShopTranslation.fromJson(Map<String, dynamic> json) =>
      ShopTranslation(
        id: json["id"],
        locale: json["locale"],
        title: json["title"],
        description: json["description"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "locale": locale,
        "title": title,
        "description": description,
        "address": address,
      };
}

class Transaction {
  num? id;
  num? payableId;
  num? price;
  String? paymentTrxId;
  String? note;
  dynamic performTime;
  String? status;
  String? statusDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  PaymentSystem? paymentSystem;

  Transaction({
    this.id,
    this.payableId,
    this.price,
    this.paymentTrxId,
    this.note,
    this.performTime,
    this.status,
    this.statusDescription,
    this.createdAt,
    this.updatedAt,
    this.paymentSystem,
  });

  Transaction copyWith({
    num? id,
    num? payableId,
    num? price,
    String? paymentTrxId,
    String? note,
    dynamic performTime,
    String? status,
    String? statusDescription,
    DateTime? createdAt,
    DateTime? updatedAt,
    PaymentSystem? paymentSystem,
  }) =>
      Transaction(
        id: id ?? this.id,
        payableId: payableId ?? this.payableId,
        price: price ?? this.price,
        paymentTrxId: paymentTrxId ?? this.paymentTrxId,
        note: note ?? this.note,
        performTime: performTime ?? this.performTime,
        status: status ?? this.status,
        statusDescription: statusDescription ?? this.statusDescription,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        paymentSystem: paymentSystem ?? this.paymentSystem,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        payableId: json["payable_id"],
        price: json["price"],
        paymentTrxId: json["payment_trx_id"],
        note: json["note"],
        performTime: json["perform_time"],
        status: json["status"],
        statusDescription: json["status_description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        paymentSystem: json["payment_system"] == null
            ? null
            : PaymentSystem.fromJson(json["payment_system"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payable_id": payableId,
        "price": price,
        "payment_trx_id": paymentTrxId,
        "note": note,
        "perform_time": performTime,
        "status": status,
        "status_description": statusDescription,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "payment_system": paymentSystem?.toJson(),
      };
}

class PaymentSystem {
  num? id;
  num? shopId;
  num? status;
  dynamic clientId;
  dynamic secretId;
  Payment? payment;

  PaymentSystem({
    this.id,
    this.shopId,
    this.status,
    this.clientId,
    this.secretId,
    this.payment,
  });

  PaymentSystem copyWith({
    num? id,
    num? shopId,
    num? status,
    dynamic clientId,
    dynamic secretId,
    Payment? payment,
  }) =>
      PaymentSystem(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        status: status ?? this.status,
        clientId: clientId ?? this.clientId,
        secretId: secretId ?? this.secretId,
        payment: payment ?? this.payment,
      );

  factory PaymentSystem.fromJson(Map<String, dynamic> json) => PaymentSystem(
        id: json["id"],
        shopId: json["shop_id"],
        status: json["status"],
        clientId: json["client_id"],
        secretId: json["secret_id"],
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "status": status,
        "client_id": clientId,
        "secret_id": secretId,
        "payment": payment?.toJson(),
      };
}

class Payment {
  num? id;
  String? tag;
  bool? active;
  DeliveryTypeTranslation? translation;

  Payment({
    this.id,
    this.tag,
    this.active,
    this.translation,
  });

  Payment copyWith({
    num? id,
    String? tag,
    bool? active,
    DeliveryTypeTranslation? translation,
  }) =>
      Payment(
        id: id ?? this.id,
        tag: tag ?? this.tag,
        active: active ?? this.active,
        translation: translation ?? this.translation,
      );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        tag: json["tag"],
        active: json["active"],
        translation: json["translation"] == null
            ? null
            : DeliveryTypeTranslation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag": tag,
        "active": active,
        "translation": translation?.toJson(),
      };
}
