import 'location.dart';
import 'push_data.dart';
import 'translation.dart';
import 'product_data.dart';

class OrderDetailModel {
  OrderDetailData? data;

  OrderDetailModel({this.data});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? OrderDetailData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrderDetailData {
  int? id;
  int? userId;
  num? totalPrice;
  num? totalDiscount;
  num? price;
  num? rate;
  num? tax;
  num? commissionFee;
  String? status;
  Location? location;
  AddressModel? address;
  DeliveryType? deliveryType;
  num? deliveryFee;
  dynamic deliveryman;
  String? deliveryDate;
  String? deliveryTime;
  String? createdAt;
  String? note;
  bool? current;
  String? updatedAt;
  num? distance;
  Shop? shop;
  Currency? currency;
  User? user;
  List<Details>? details;
  Transaction? transaction;
  dynamic review;
  DeliveryAddress? deliveryAddress;

  OrderDetailData({
    this.id,
    this.userId,
    this.totalPrice,
    this.totalDiscount,
    this.price,
    this.rate,
    this.tax,
    this.commissionFee,
    this.status,
    this.distance,
    this.note,
    this.location,
    this.address,
    this.current,
    this.deliveryType,
    this.deliveryFee,
    this.deliveryman,
    this.deliveryDate,
    this.deliveryTime,
    this.createdAt,
    this.updatedAt,
    this.shop,
    this.currency,
    this.user,
    this.details,
    this.transaction,
    this.review,
    this.deliveryAddress,
  });

  OrderDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    totalPrice = json['total_price'];
    totalDiscount = json['total_discount'];
    price = json['price'];
    rate = json['rate'];
    tax = json['tax'];
    note = json['note'];
    distance = json['km'];
    commissionFee = json['commission_fee'];
    status = json['status'];
    current = json['current'] == null
        ? false
        : ((json['current'].runtimeType == int)
            ? (json['current'] == 0 ? false : true)
            : json['current']);
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    address = (json['address'] != null)
        ? AddressModel.fromJson(json['address'])
        : null;
    deliveryType = json['delivery_type'] != null
        ? DeliveryType.fromJson(json['delivery_type'])
        : null;
    deliveryFee = json['delivery_fee'];
    deliveryman = json['deliveryman'];
    deliveryDate = json['delivery_date'];
    deliveryTime = json['delivery_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
    review = json['review'];
    deliveryAddress =
    json['delivery_address'] != null ? DeliveryAddress.fromJson(
        json['delivery_address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['total_price'] = totalPrice;
    data['total_discount'] = totalDiscount;
    data['price'] = price;
    data['rate'] = rate;
    data['tax'] = tax;
    data['commission_fee'] = commissionFee;
    data['status'] = status;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['address'] = address;
    if (deliveryType != null) {
      data['delivery_type'] = deliveryType?.toJson();
    }
    data['delivery_fee'] = deliveryFee;
    data['deliveryman'] = deliveryman;
    data['delivery_date'] = deliveryDate;
    data['delivery_time'] = deliveryTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (shop != null) {
      data['shop'] = shop!.toJson();
    }
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    if (transaction != null) {
      data['transaction'] = transaction!.toJson();
    }
    data['review'] = review;
    if (deliveryAddress != null) {
      data['delivery_address'] = deliveryAddress?.toJson();
    }
    return data;
  }
}

class Shop {
  int? id;
  String? uuid;
  int? userId;
  num? price;
  num? pricePerKm;
  num? tax;
  num? percentage;
  String? phone;
  bool? visibility;
  String? backgroundImg;
  String? logoImg;
  num? minAmount;
  String? status;
  String? type;
  DeliveryTime? deliveryTime;
  String? createdAt;
  String? updatedAt;
  Location? location;
  int? productsCount;
  Translation? translation;
  List<String>? locales;

  Shop({
    this.id,
    this.uuid,
    this.userId,
    this.price,
    this.pricePerKm,
    this.tax,
    this.percentage,
    this.phone,
    this.visibility,
    this.backgroundImg,
    this.logoImg,
    this.minAmount,
    this.status,
    this.type,
    this.deliveryTime,
    this.createdAt,
    this.updatedAt,
    this.location,
    this.productsCount,
    this.translation,
    this.locales,
  });

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    userId = json['user_id'];
    price = json['price'];
    pricePerKm = json['price_per_km'];
    tax = json['tax'];
    percentage = json['percentage'];
    phone = json['phone'];
    visibility = json['visibility'].runtimeType == int
        ? (json['visibility'] == 1)
        : json['visibility'];
    backgroundImg = json['background_img'];
    logoImg = json['logo_img'];
    minAmount = json['min_amount'];
    status = json['status'];
    type = json['type'].toString();
    deliveryTime = json['delivery_time'] != null
        ? DeliveryTime.fromJson(json['delivery_time'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    productsCount = json['products_count'];
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    locales = json['locales'] != null ? json['locales'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['user_id'] = userId;
    data['price'] = price;
    data['price_per_km'] = pricePerKm;
    data['tax'] = tax;
    data['percentage'] = percentage;
    data['phone'] = phone;
    data['visibility'] = visibility;
    data['background_img'] = backgroundImg;
    data['logo_img'] = logoImg;
    data['min_amount'] = minAmount;
    data['status'] = status;
    data['type'] = type;
    if (deliveryTime != null) {
      data['delivery_time'] = deliveryTime!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['products_count'] = productsCount;
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    data['locales'] = locales;
    return data;
  }
}

class DeliveryTime {
  String? to;
  String? from;
  String? type;

  DeliveryTime({this.to, this.from, this.type});

  DeliveryTime.fromJson(Map<String, dynamic> json) {
    to = json['to'].toString();
    from = json['from'].toString();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['to'] = to;
    data['from'] = from;
    data['type'] = type;
    return data;
  }
}

class Currency {
  int? id;
  String? symbol;
  String? title;
  bool? active;

  Currency({this.id, this.symbol, this.title, this.active});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    title = json['title'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['title'] = title;
    data['active'] = active;
    return data;
  }
}

class User {
  int? id;
  String? uuid;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? birthday;
  String? gender;
  bool? active;
  String? img;
  String? role;
  String? emailVerifiedAt;
  String? registeredAt;

  User({
    this.id,
    this.uuid,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.birthday,
    this.gender,
    this.active,
    this.img,
    this.role,
    this.emailVerifiedAt,
    this.registeredAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    active = json['active'].runtimeType == int
        ? (json['active'] == 0 ? false : true)
        : json['active'];
    img = json['img'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
    registeredAt = json['registered_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['active'] = active;
    data['img'] = img;
    data['role'] = role;
    data['email_verified_at'] = emailVerifiedAt;
    data['registered_at'] = registeredAt;
    return data;
  }
}

class Details {
  int? id;
  int? orderId;
  int? stockId;
  num? originPrice;
  num? totalPrice;
  num? tax;
  num? discount;
  int? quantity;
  bool? bonus;
  String? createdAt;
  String? updatedAt;
  Stock? stock;
  ProductData? shopProduct;

  Details({
    this.id,
    this.orderId,
    this.stockId,
    this.originPrice,
    this.totalPrice,
    this.tax,
    this.discount,
    this.quantity,
    this.bonus,
    this.createdAt,
    this.updatedAt,
    this.stock,
    this.shopProduct,
  });

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    stockId = json['stock_id'];
    originPrice = json['origin_price'];
    totalPrice = json['total_price'];
    tax = json['tax'];
    discount = json['discount'];
    quantity = json['quantity'].runtimeType == String
        ? int.tryParse(json['quantity'])
        : json['bonus'];
    bonus = json['bonus'].runtimeType == int
        ? (json['bonus'] == 0 ? false : true)
        : json['bonus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stock = json['stock'] != null ? Stock.fromJson(json['stock']) : null;
    shopProduct = json['shopProduct'] != null
        ? ProductData.fromJson(json['shopProduct'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['stock_id'] = stockId;
    data['origin_price'] = originPrice;
    data['total_price'] = totalPrice;
    data['tax'] = tax;
    data['discount'] = discount;
    data['quantity'] = quantity;
    data['bonus'] = bonus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (stock != null) {
      data['stock'] = stock!.toJson();
    }
    if (shopProduct != null) {
      data['shopProduct'] = shopProduct!.toJson();
    }
    return data;
  }
}

class Stock {
  int? id;
  int? countableId;
  num? price;
  int? quantity;
  num? tax;
  num? totalPrice;
  List<Extras>? extras;
  Product? product;

  Stock({
    this.id,
    this.countableId,
    this.price,
    this.quantity,
    this.tax,
    this.totalPrice,
    this.extras,
    this.product,
  });

  Stock.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countableId = json['countable_id'];
    price = json['price'];
    quantity = json['quantity'];
    tax = json['tax'];
    totalPrice = json['total_price'];
    if (json['extras'] != null) {
      extras = <Extras>[];
      json['extras'].forEach((v) {
        extras!.add(Extras.fromJson(v));
      });
    }
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['countable_id'] = countableId;
    data['price'] = price;
    data['quantity'] = quantity;
    data['tax'] = tax;
    data['total_price'] = totalPrice;
    if (extras != null) {
      data['extras'] = extras!.map((v) => v.toJson()).toList();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Extras {
  int? id;
  int? extraGroupId;
  String? value;
  bool? active;
  Group? group;

  Extras({this.id, this.extraGroupId, this.value, this.active, this.group});

  Extras.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    extraGroupId = json['extra_group_id'];
    value = json['value'];
    active = json['active'];
    group = json['group'] != null ? Group.fromJson(json['group']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['extra_group_id'] = extraGroupId;
    data['value'] = value;
    data['active'] = active;
    if (group != null) {
      data['group'] = group!.toJson();
    }
    return data;
  }
}

class Group {
  int? id;
  String? type;
  bool? active;
  Translation? translation;
  List<String>? locales;

  Group({this.id, this.type, this.active, this.translation, this.locales});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    active = json['active'];
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    locales = json['locales'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['active'] = active;
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    data['locales'] = locales;
    return data;
  }
}

class Product {
  int? id;
  String? uuid;
  int? shopId;
  int? categoryId;
  int? brandId;
  num? tax;
  String? barCode;
  String? status;
  bool? active;
  bool? addon;
  String? img;
  int? minQty;
  int? maxQty;
  String? createdAt;
  String? updatedAt;
  Translation? translation;
  List<String>? locales;

  Product({
    this.id,
    this.uuid,
    this.shopId,
    this.categoryId,
    this.brandId,
    this.tax,
    this.barCode,
    this.status,
    this.active,
    this.addon,
    this.img,
    this.minQty,
    this.maxQty,
    this.createdAt,
    this.updatedAt,
    this.translation,
    this.locales,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    shopId = json['shop_id'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    tax = json['tax'];
    barCode = json['bar_code'];
    status = json['status'];
    active = json['active'];
    addon = json['addon'];
    img = json['img'];
    minQty = json['min_qty'];
    maxQty = json['max_qty'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    locales = json['locales'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['shop_id'] = shopId;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['tax'] = tax;
    data['bar_code'] = barCode;
    data['status'] = status;
    data['active'] = active;
    data['addon'] = addon;
    data['img'] = img;
    data['min_qty'] = minQty;
    data['max_qty'] = maxQty;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    data['locales'] = locales;
    return data;
  }
}

class Transaction {
  int? id;
  int? payableId;
  num? price;
  String? paymentTrxId;
  String? note;
  String? status;
  String? statusDescription;
  String? createdAt;
  String? updatedAt;
  PaymentSystem? paymentSystem;

  Transaction({
    this.id,
    this.payableId,
    this.price,
    this.paymentTrxId,
    this.note,
    this.status,
    this.statusDescription,
    this.createdAt,
    this.updatedAt,
    this.paymentSystem,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    payableId = json['payable_id'];
    price = json['price'].runtimeType == String
        ? num.tryParse(json['price'])
        : json['price'];
    paymentTrxId = json['payment_trx_id'];
    note = json['note'];
    status = json['status'];
    statusDescription = json['status_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    paymentSystem = json['payment_system'] != null
        ? PaymentSystem.fromJson(json['payment_system'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['payable_id'] = payableId;
    data['price'] = price;
    data['payment_trx_id'] = paymentTrxId;
    data['note'] = note;
    data['status'] = status;
    data['status_description'] = statusDescription;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (paymentSystem != null) {
      data['payment_system'] = paymentSystem!.toJson();
    }
    return data;
  }
}

class PaymentSystem {
  int? id;
  String? tag;
  bool? active;

  PaymentSystem({this.id, this.tag, this.active});

  PaymentSystem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tag = json['tag'];
    active = json['active'].runtimeType == int
        ? (json['active'] == 0 ? false : true)
        : json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tag'] = tag;
    data['active'] = active;
    return data;
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
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}

class DeliveryAddress {
  DeliveryAddress({
    int? id,
    String? title,
    String? address,
    Location? location,}) {
    _id = id;
    _title = title;
    _address = address;
    _location = location;
  }

  DeliveryAddress.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _address = json['address'];
    _location =
    json['location'] != null ? Location.fromJson(json['location']) : null;

  }

  int? _id;
  String? _title;
  String? _address;
  Location? _location;

  DeliveryAddress copyWith({ int? id,
    String? title,
    String? address,
    Location? location,
  }) =>
      DeliveryAddress(id: id ?? _id,
        title: title ?? _title,
        address: address ?? _address,
        location: location ?? _location,
      );

  int? get id => _id;

  String? get title => _title;

  String? get address => _address;

  Location? get location => _location;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['address'] = _address;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    return map;
  }

}