class BrandModelResponse {
  List<MainBrand>? data;

  BrandModelResponse({
    this.data,
  });

  BrandModelResponse copyWith({
    List<MainBrand>? data,
  }) =>
      BrandModelResponse(
        data: data ?? this.data,
      );

  factory BrandModelResponse.fromJson(Map<String, dynamic> json) =>
      BrandModelResponse(
        data: json["data"] == null
            ? []
            : List<MainBrand>.from(json["data"]!.map((x) => MainBrand.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MainBrand {
  int? id;
  Brand? brand;

  MainBrand({
    this.id,
    this.brand,
  });

  MainBrand copyWith({
    int? id,
    Brand? brand,
  }) =>
      MainBrand(
        id: id ?? this.id,
        brand: brand ?? this.brand,
      );

  factory MainBrand.fromJson(Map<String, dynamic> json) => MainBrand(
        id: json["id"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brand?.toJson(),
      };
}

class Brand {
  int? id;
  String? uuid;
  String? title;

  Brand({
    this.id,
    this.uuid,
    this.title,
  });

  Brand copyWith({
    int? id,
    String? uuid,
    String? title,
  }) =>
      Brand(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        title: title ?? this.title,
      );

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        uuid: json["uuid"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "title": title,
      };
}
