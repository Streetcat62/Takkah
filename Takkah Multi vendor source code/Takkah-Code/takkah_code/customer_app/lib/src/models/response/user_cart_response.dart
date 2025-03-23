import '../data/product_data.dart';

class UserCartResponse {
  UserCartResponse({CartData? data}) {
    _data = data;
  }

  UserCartResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? CartData.fromJson(json['data']) : null;
  }

  CartData? _data;

  UserCartResponse copyWith({CartData? data}) =>
      UserCartResponse(data: data ?? _data);

  CartData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class CartData {
  CartData({
    int? id,
    int? ownerId,
    int? shopId,
    bool? status,
    bool? together,
    num? totalPrice,
    String? createdAt,
    List<UserCartData>? userCarts,
  }) {
    _id = id;
    _ownerId = ownerId;
    _shopId = shopId;
    _status = status;
    _together = together;
    _totalPrice = totalPrice;
    _createdAt = createdAt;
    _userCarts = userCarts;
  }

  CartData.fromJson(dynamic json) {
    _id = json['id'];
    _ownerId = json['owner_id'];
    _shopId = json['shop_id'];
    _status = json['status'];
    _together = json['together'];
    _totalPrice = json['total_price'];
    _createdAt = json['created_at'];
    if (json['userCarts'] != null) {
      _userCarts = [];
      json['userCarts'].forEach((v) {
        _userCarts?.add(UserCartData.fromJson(v));
      });
    }
  }

  int? _id;
  int? _ownerId;
  int? _shopId;
  bool? _status;
  bool? _together;
  num? _totalPrice;
  String? _createdAt;
  List<UserCartData>? _userCarts;

  CartData copyWith({
    int? id,
    int? ownerId,
    int? shopId,
    bool? status,
    bool? together,
    num? totalPrice,
    String? createdAt,
    List<UserCartData>? userCarts,
  }) =>
      CartData(
        id: id ?? _id,
        ownerId: ownerId ?? _ownerId,
        shopId: shopId ?? _shopId,
        status: status ?? _status,
        together: together ?? _together,
        totalPrice: totalPrice ?? _totalPrice,
        createdAt: createdAt ?? _createdAt,
        userCarts: userCarts ?? _userCarts,
      );

  int? get id => _id;

  int? get ownerId => _ownerId;

  int? get shopId => _shopId;

  bool? get status => _status;

  bool? get together => _together;

  num? get totalPrice => _totalPrice;

  String? get createdAt => _createdAt;

  List<UserCartData>? get userCarts => _userCarts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['owner_id'] = _ownerId;
    map['shop_id'] = _shopId;
    map['status'] = _status;
    map['together'] = _together;
    map['total_price'] = _totalPrice;
    map['created_at'] = _createdAt;
    if (_userCarts != null) {
      map['userCarts'] = _userCarts?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class UserCartData {
  UserCartData({
    int? id,
    String? uuid,
    int? userId,
    String? name,
    int? status,
    List<CartDetails>? cartDetails,
  }) {
    _id = id;
    _uuid = uuid;
    _userId = userId;
    _name = name;
    _status = status;
    _cartDetails = cartDetails;
  }

  UserCartData.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _userId = json['user_id'];
    _name = json['name'];
    _status = json['status'];
    if (json['cartDetails'] != null) {
      _cartDetails = [];
      json['cartDetails'].forEach((v) {
        _cartDetails?.add(CartDetails.fromJson(v));
      });
    }
  }

  int? _id;
  String? _uuid;
  int? _userId;
  String? _name;
  int? _status;
  List<CartDetails>? _cartDetails;

  UserCartData copyWith({
    int? id,
    String? uuid,
    int? userId,
    String? name,
    int? status,
    List<CartDetails>? cartDetails,
  }) =>
      UserCartData(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        userId: userId ?? _userId,
        name: name ?? _name,
        status: status ?? _status,
        cartDetails: cartDetails ?? _cartDetails,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  int? get userId => _userId;

  String? get name => _name;

  int? get status => _status;

  List<CartDetails>? get cartDetails => _cartDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['status'] = _status;
    if (_cartDetails != null) {
      map['cartDetails'] = _cartDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CartDetails {
  CartDetails({
    int? id,
    int? quantity,
    bool? bonus,
    ProductData? product,
    int? localQuantity,
  }) {
    _id = id;
    _quantity = quantity;
    _bonus = bonus;
    _shopProduct = product;
    _localQuantity = localQuantity;
  }

  CartDetails.fromJson(dynamic json) {
    _id = json['id'];
    _quantity = json['quantity'];
    _bonus = json['bonus'];
    _shopProduct = json['shopProduct'] != null
        ? ProductData.fromJson(json['shopProduct'])
        : null;
    _localQuantity = json['quantity'];
  }

  int? _id;
  int? _quantity;
  bool? _bonus;
  ProductData? _shopProduct;
  int? _localQuantity;

  CartDetails copyWith({
    int? id,
    int? quantity,
    bool? bonus,
    ProductData? product,
    int? localQuantity,
  }) =>
      CartDetails(
        id: id ?? _id,
        quantity: quantity ?? _quantity,
        bonus: bonus ?? _bonus,
        product: product ?? _shopProduct,
        localQuantity: localQuantity ?? _localQuantity,
      );

  int? get id => _id;

  int? get quantity => _quantity;

  bool? get bonus => _bonus;

  ProductData? get product => _shopProduct;

  int? get localQuantity => _localQuantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quantity'] = _quantity;
    map['bonus'] = _bonus;
    if (_shopProduct != null) {
      map['shopProduct'] = _shopProduct?.toJson();
    }
    return map;
  }
}
