import 'package:venderfoodyman/infrastructure/models/data/product_model.dart';


class UnitModelResponse {
    List<Unit>? data;
    Links? links;
    Meta? meta;

    UnitModelResponse({
        this.data,
        this.links,
        this.meta,
    });

    UnitModelResponse copyWith({
        List<Unit>? data,
        Links? links,
        Meta? meta,
    }) => 
        UnitModelResponse(
            data: data ?? this.data,
            links: links ?? this.links,
            meta: meta ?? this.meta,
        );

    factory UnitModelResponse.fromJson(Map<String, dynamic> json) => UnitModelResponse(
        data: json["data"] == null ? [] : List<Unit>.from(json["data"]!.map((x) => Unit.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
    };
}

class Unit {
  int? id;
  bool? active;
  String? position;
  DateTime? createdAt;
  DateTime? updatedAt;
  Translation? translation;

  Unit({
    this.id,
    this.active,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.translation,
  });

  Unit copyWith({
    int? id,
    bool? active,
    String? position,
    DateTime? createdAt,
    DateTime? updatedAt,
    Translation? translation,
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
            : Translation.fromJson(json["translation"]),
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
