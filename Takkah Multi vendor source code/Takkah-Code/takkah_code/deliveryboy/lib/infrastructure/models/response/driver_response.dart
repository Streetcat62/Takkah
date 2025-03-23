import '../data/location.dart';
import '../data/user_data.dart';
import '../data/gallery_data.dart';

class DriverResponse {
  DriverData? data;

  DriverResponse({this.data});

  DriverResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? DriverData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DriverData {
  int? id;
  int? userId;
  String? typeOfTechnique;
  String? brand;
  String? model;
  String? number;
  String? color;
  bool? online;
  Location? location;
  String? createdAt;
  String? updatedAt;
  UserData? deliveryMan;
  List<GalleryData>? galleries;

  DriverData({
    this.id,
    this.userId,
    this.typeOfTechnique,
    this.brand,
    this.model,
    this.number,
    this.color,
    this.online,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.deliveryMan,
    this.galleries,
  });

  DriverData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    typeOfTechnique = json['type_of_technique'];
    brand = json['brand'];
    model = json['model'];
    number = json['number'];
    color = json['color'];
    online = json['online'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deliveryMan = json['deliveryMan'] != null
        ? UserData.fromJson(json['deliveryMan'])
        : null;
    if (json['galleries'] != null) {
      galleries = <GalleryData>[];
      json['galleries'].forEach((v) {
        galleries!.add(GalleryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['type_of_technique'] = typeOfTechnique;
    data['brand'] = brand;
    data['model'] = model;
    data['number'] = number;
    data['color'] = color;
    data['online'] = online;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (deliveryMan != null) {
      data['deliveryMan'] = deliveryMan!.toJson();
    }
    if (galleries != null) {
      data['galleries'] = galleries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
