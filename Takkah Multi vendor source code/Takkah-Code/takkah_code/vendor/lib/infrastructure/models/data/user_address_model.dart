
class UserAddressResponse {
    bool? status;
    String? message;
    UserAddressData? data;

    UserAddressResponse({
        this.status,
        this.message,
        this.data,
    });

    UserAddressResponse copyWith({
        bool? status,
        String? message,
        UserAddressData? data,
    }) => 
        UserAddressResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory UserAddressResponse.fromJson(Map<String, dynamic> json) => UserAddressResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : UserAddressData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class UserAddressData {
    int? id;
    String? uuid;
    String? firstname;
    String? lastname;
    String? email;
    String? gender;
    DateTime? emailVerifiedAt;
    DateTime? registeredAt;
    bool? active;
    String? role;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Address>? addresses;
    dynamic shop;
    Wallet? wallet;
    dynamic point;
    List<dynamic>? invitations;
    dynamic deliveryManSetting;

    UserAddressData({
        this.id,
        this.uuid,
        this.firstname,
        this.lastname,
        this.email,
        this.gender,
        this.emailVerifiedAt,
        this.registeredAt,
        this.active,
        this.role,
        this.createdAt,
        this.updatedAt,
        this.addresses,
        this.shop,
        this.wallet,
        this.point,
        this.invitations,
        this.deliveryManSetting,
    });

    UserAddressData copyWith({
        int? id,
        String? uuid,
        String? firstname,
        String? lastname,
        String? email,
        String? gender,
        DateTime? emailVerifiedAt,
        DateTime? registeredAt,
        bool? active,
        String? role,
        DateTime? createdAt,
        DateTime? updatedAt,
        List<Address>? addresses,
        dynamic shop,
        Wallet? wallet,
        dynamic point,
        List<dynamic>? invitations,
        dynamic deliveryManSetting,
    }) => 
        UserAddressData(
            id: id ?? this.id,
            uuid: uuid ?? this.uuid,
            firstname: firstname ?? this.firstname,
            lastname: lastname ?? this.lastname,
            email: email ?? this.email,
            gender: gender ?? this.gender,
            emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
            registeredAt: registeredAt ?? this.registeredAt,
            active: active ?? this.active,
            role: role ?? this.role,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            addresses: addresses ?? this.addresses,
            shop: shop ?? this.shop,
            wallet: wallet ?? this.wallet,
            point: point ?? this.point,
            invitations: invitations ?? this.invitations,
            deliveryManSetting: deliveryManSetting ?? this.deliveryManSetting,
        );

    factory UserAddressData.fromJson(Map<String, dynamic> json) => UserAddressData(
        id: json["id"],
        uuid: json["uuid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        gender: json["gender"],
        emailVerifiedAt: json["email_verified_at"] == null ? null : DateTime.parse(json["email_verified_at"]),
        registeredAt: json["registered_at"] == null ? null : DateTime.parse(json["registered_at"]),
        active: json["active"],
        role: json["role"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        addresses: json["addresses"] == null ? [] : List<Address>.from(json["addresses"]!.map((x) => Address.fromJson(x))),
        shop: json["shop"],
        wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
        point: json["point"],
        invitations: json["invitations"] == null ? [] : List<dynamic>.from(json["invitations"]!.map((x) => x)),
        deliveryManSetting: json["delivery_man_setting"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "gender": gender,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "registered_at": registeredAt?.toIso8601String(),
        "active": active,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
        "shop": shop,
        "wallet": wallet?.toJson(),
        "point": point,
        "invitations": invitations == null ? [] : List<dynamic>.from(invitations!.map((x) => x)),
        "delivery_man_setting": deliveryManSetting,
    };
}

class Address {
    int? id;
    String? title;
    String? address;
    Location? location;
    bool? addressDefault;
    bool? active;
    DateTime? createdAt;
    DateTime? updatedAt;

    Address({
        this.id,
        this.title,
        this.address,
        this.location,
        this.addressDefault,
        this.active,
        this.createdAt,
        this.updatedAt,
    });

    Address copyWith({
        int? id,
        String? title,
        String? address,
        Location? location,
        bool? addressDefault,
        bool? active,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Address(
            id: id ?? this.id,
            title: title ?? this.title,
            address: address ?? this.address,
            location: location ?? this.location,
            addressDefault: addressDefault ?? this.addressDefault,
            active: active ?? this.active,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        addressDefault: json["default"],
        active: json["active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "location": location?.toJson(),
        "default": addressDefault,
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

class Wallet {
    String? uuid;
    int? userId;
    int? price;
    String? symbol;
    DateTime? createdAt;
    DateTime? updatedAt;

    Wallet({
        this.uuid,
        this.userId,
        this.price,
        this.symbol,
        this.createdAt,
        this.updatedAt,
    });

    Wallet copyWith({
        String? uuid,
        int? userId,
        int? price,
        String? symbol,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Wallet(
            uuid: uuid ?? this.uuid,
            userId: userId ?? this.userId,
            price: price ?? this.price,
            symbol: symbol ?? this.symbol,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        uuid: json["uuid"],
        userId: json["user_id"],
        price: json["price"],
        symbol: json["symbol"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "user_id": userId,
        "price": price,
        "symbol": symbol,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
