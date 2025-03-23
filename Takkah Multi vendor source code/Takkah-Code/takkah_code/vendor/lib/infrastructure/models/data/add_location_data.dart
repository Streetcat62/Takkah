
import 'package:venderfoodyman/infrastructure/models/data/location_data.dart';

class AddAddressResponse {
    bool? status;
    String? message;
    AddAddressModel? data;

    AddAddressResponse({
        this.status,
        this.message,
        this.data,
    });

    AddAddressResponse copyWith({
        bool? status,
        String? message,
        AddAddressModel? data,
    }) => 
        AddAddressResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory AddAddressResponse.fromJson(Map<String, dynamic> json) => AddAddressResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : AddAddressModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class AddAddressModel {
    int? id;
    String? title;
    String? address;
    LocationData? location;
    bool? dataDefault;
    bool? active;
    DateTime? createdAt;
    DateTime? updatedAt;

    AddAddressModel({
        this.id,
        this.title,
        this.address,
        this.location,
        this.dataDefault,
        this.active,
        this.createdAt,
        this.updatedAt,
    });

    AddAddressModel copyWith({
        int? id,
        String? title,
        String? address,
        LocationData? location,
        bool? dataDefault,
        bool? active,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        AddAddressModel(
            id: id ?? this.id,
            title: title ?? this.title,
            address: address ?? this.address,
            location: location ?? this.location,
            dataDefault: dataDefault ?? this.dataDefault,
            active: active ?? this.active,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
        id: json["id"],
        title: json["title"],
        address: json["address"],
        location: json["location"] == null ? null : LocationData.fromJson(json["location"]),
        dataDefault: json["default"],
        active: json["active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "address": address,
        "location": location?.toJson(),
        "default": dataDefault,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

