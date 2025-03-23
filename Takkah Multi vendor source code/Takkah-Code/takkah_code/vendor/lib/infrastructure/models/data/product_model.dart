import 'package:venderfoodyman/infrastructure/models/data/category.dart';
import 'package:venderfoodyman/infrastructure/models/data/unit_model.dart';
import 'brand_data.dart';
import 'user_address_model.dart';

class ProductResponse {
  List<ProductModel>? data;
  Links? links;
  Meta? meta;

  ProductResponse({
    this.data,
    this.links,
    this.meta,
  });

  ProductResponse copyWith({
    List<ProductModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      ProductResponse(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        data: json["data"] == null
            ? []
            : List<ProductModel>.from(
                json["data"]!.map((x) => ProductModel.fromJson(x))),
        //links: json["links"] == null ? null : Links.fromJson(json["links"]),
        // meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ProductModel {
  int? id;
  int? cartCount;
  String? uuid;
  int? minQty;
  int? maxQty;
  int? active;
  int? quantity;
  num? price;
  int? tax;
  int? shopId;
  dynamic ordersCount;
  dynamic ratingAvg;
  List<dynamic>? reviews;
  Product? product;
  Shop? shop;
  int? discount;

  ProductModel({
    this.id,
    this.cartCount,
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
    this.reviews,
    this.product,
    this.shop,
    this.discount,
  });

  ProductModel copyWith({
    int? id,
    int? cartCount,
    String? uuid,
    int? minQty,
    int? maxQty,
    int? active,
    int? quantity,
    num? price,
    int? tax,
    int? shopId,
    dynamic ordersCount,
    dynamic ratingAvg,
    List<dynamic>? reviews,
    Product? product,
    Shop? shop,
    int? discount,
  }) =>
      ProductModel(
        id: id ?? this.id,
        cartCount: cartCount ?? this.cartCount,
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
        reviews: reviews ?? this.reviews,
        product: product ?? this.product,
        shop: shop ?? this.shop,
        discount: discount ?? this.discount,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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
      reviews: json["reviews"] == null
          ? []
          : List<dynamic>.from(json["reviews"]!.map((x) => x)),
      product:
          json["product"] == null ? null : Product.fromJson(json["product"]),
      shop: json["shop"] == null ? null : Shop.fromJson(json["shop"]),
      discount: json["discount"],
    );
  }

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
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "product": product?.toJson(),
        "shop": shop?.toJson(),
        "discount": discount,
      };
}

class Product {
  int? id;
  String? uuid;
  int? categoryId;
  String? keywords;
  int? brandId;
  String? img;
  String? qrCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  Translation? translation;
  CategoryModel? category;
  Brand? brand;
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
    this.category,
    this.brand,
    this.unit,
  });

  Product copyWith({
    int? id,
    String? uuid,
    int? categoryId,
    String? keywords,
    int? brandId,
    String? img,
    String? qrCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    Translation? translation,
    CategoryModel? category,
    Brand? brand,
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
        category: category ?? this.category,
        brand: brand ?? this.brand,
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
            : Translation.fromJson(json["translation"]),
        category: json["category"] == null
            ? null
            : CategoryModel.fromJson(json["category"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
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
        "category": category?.toJson(),
        "brand": brand?.toJson(),
        "unit": unit?.toJson(),
      };
}

class Translation {
  int? id;
  String? locale;
  String? title;

  Translation({
    this.id,
    this.locale,
    this.title,
  });

  Translation copyWith({
    int? id,
    String? locale,
    String? title,
  }) =>
      Translation(
        id: id ?? this.id,
        locale: locale ?? this.locale,
        title: title ?? this.title,
      );

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
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

class Shop {
  int? id;
  String? uuid;
  int? userId;
  int? tax;
  double? percentage;
  Location? location;
  num? price;
  int? pricePerKm;
  String? phone;
  bool? visibility;
  String? backgroundImg;
  String? logoImg;
  int? minAmount;
  String? status;
  String? statusNote;
  DeliveryTime? deliveryTime;
  String? inviteLink;
  DateTime? createdAt;
  DateTime? updatedAt;

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
    this.visibility,
    this.backgroundImg,
    this.logoImg,
    this.minAmount,
    this.status,
    this.statusNote,
    this.deliveryTime,
    this.inviteLink,
    this.createdAt,
    this.updatedAt,
  });

  Shop copyWith({
    int? id,
    String? uuid,
    int? userId,
    int? tax,
    double? percentage,
    Location? location,
    num? price,
    int? pricePerKm,
    String? phone,
    bool? visibility,
    String? backgroundImg,
    String? logoImg,
    int? minAmount,
    String? status,
    String? statusNote,
    DeliveryTime? deliveryTime,
    String? inviteLink,
    DateTime? createdAt,
    DateTime? updatedAt,
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
        visibility: visibility ?? this.visibility,
        backgroundImg: backgroundImg ?? this.backgroundImg,
        logoImg: logoImg ?? this.logoImg,
        minAmount: minAmount ?? this.minAmount,
        status: status ?? this.status,
        statusNote: statusNote ?? this.statusNote,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        inviteLink: inviteLink ?? this.inviteLink,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        uuid: json["uuid"],
        userId: json["user_id"],
        tax: json["tax"],
        percentage: json["percentage"]?.toDouble(),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        price: json["price"],
        pricePerKm: json["price_per_km"],
        phone: json["phone"],
        visibility: json["visibility"],
        backgroundImg: json["background_img"],
        logoImg: json["logo_img"],
        minAmount: json["min_amount"],
        status: json["status"],
        statusNote: json["status_note"],
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
        "visibility": visibility,
        "background_img": backgroundImg,
        "logo_img": logoImg,
        "min_amount": minAmount,
        "status": status,
        "status_note": statusNote,
        "delivery_time": deliveryTime?.toJson(),
        "invite_link": inviteLink,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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


class Links {
  String? first;
  String? last;
  dynamic prev;
  String? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links copyWith({
    String? first,
    String? last,
    dynamic prev,
    String? next,
  }) =>
      Links(
        first: first ?? this.first,
        last: last ?? this.last,
        prev: prev ?? this.prev,
        next: next ?? this.next,
      );

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    List<Link>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) =>
      Meta(
        currentPage: currentPage ?? this.currentPage,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        links: links ?? this.links,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
